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
    if (mserial_data == newValue)
        return;

    mserial_data = newValue;
    emit serial_data_Changed(mserial_data);
}

void SerialPort::onReadData()
{
    if(arduino->bytesAvailable()>0){

        QByteArray data = arduino->readAll();
        qDebug()<<QString(data).trimmed();
        QString value = QString(data).trimmed();
        bool ok;
//        double val = value.toDouble(&ok);
//        if(ok)
//            set_serial_data(val);
    }
}

void SerialPort::openDefault()
{
    for(auto info: QSerialPortInfo::availablePorts()){
        qDebug()<<info.portName()<<info.description()<<info.manufacturer();
        if(!info.isBusy() && (info.description().contains("Arduino") || info.manufacturer().contains("Arduino"))){
            portInfo = info;
            break;
        }
    }

    if(portInfo.isNull()){
        return;
    }

    arduino->setPortName(portInfo.portName());
    arduino->setBaudRate(QSerialPort::Baud115200);
    arduino->setDataBits(QSerialPort::Data8);
    arduino->setParity(QSerialPort::NoParity);
    arduino->setStopBits(QSerialPort::OneStop);
    arduino->setFlowControl(QSerialPort::NoFlowControl);

    if(arduino->open(QSerialPort::ReadWrite))
        qDebug()<<"Connected to "<< portInfo.manufacturer()<< " on " << portInfo.portName();
    else
        qCritical()<<"Serial Port error: " << arduino->errorString();

}

QString SerialPort::get_serial_data() const
{
    return mserial_data;
}
