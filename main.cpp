#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// data from serial port get from here
// https://github.com/eyllanesc/stackoverflow/tree/master/Arduino-QML
#include "serialport.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<SerialPort>("SerialPortLib", 1, 0, "SerialPort");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
