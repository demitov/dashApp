#ifndef SERIALPORT_H
#define SERIALPORT_H

#include <QObject>
#include <QSerialPort>

class SerialPort : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString serial_data READ get_serial_data WRITE set_serial_data NOTIFY serial_data_Changed )

public:
    SerialPort(QObject *parent = 0);
    ~SerialPort();

    QString get_serial_data() const;
    void set_serial_data(QString newValue);

public slots:
    void onReadData();

signals:
    void serial_data_Changed(QString newValue);

private:
    QSerialPort *arduino;
    static const quint16 arduino_uno_vendor_id = 0x2341;
    static const quint16 arduino_uno_product_id = 0x0001;
    QString mSerial_data;

    void openDefault();
};

#endif // SERIALPORT_H
