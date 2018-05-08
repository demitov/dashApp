#include "serialport.h"
#include <QDebug>

SerialPort::SerialPort(QObject *parent):QObject(parent)
{
    arduino = new QSerialPort(this);
    connect(arduino, &QSerialPort::readyRead, this, &SerialPort::onReadData);
    openDefault();
}

SerialPort::~SerialPort()
{
    delete arduino;
}

void SerialPort::set_serial_data(QString newValue)
{
    mSerial_data = newValue;
    emit serial_data_Changed(mSerial_data);
}

void SerialPort::onReadData()
{
    if (arduino->canReadLine()) {
        QByteArray data = arduino->readLine();
        qDebug()<<QString(data).trimmed();
        QString value = QString(data).trimmed();
        set_serial_data(value);
    }
}

void SerialPort::openDefault()
{
    arduino->setPortName("ttyAMA0");
    arduino->setBaudRate(QSerialPort::Baud115200);
    arduino->setDataBits(QSerialPort::Data8);
    arduino->setParity(QSerialPort::NoParity);
    arduino->setStopBits(QSerialPort::OneStop);
    arduino->setFlowControl(QSerialPort::NoFlowControl);

    if (arduino->open(QSerialPort::ReadWrite))
        qDebug()<<"Connected to "<< arduino->portName();
    else
        qCritical()<<"Serial Port error: " << arduino->errorString();

}

QString SerialPort::get_serial_data() const
{
    return mSerial_data;
}
