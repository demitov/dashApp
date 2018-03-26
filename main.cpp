#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QThread>

// data from serial port get from here
// https://github.com/eyllanesc/stackoverflow/tree/master/Arduino-QML
#include "serialport.h"

#define WIDTH   "1280"
#define HEIGHT  "480"

int main(int argc, char *argv[])
{
    //
    //Qt environment
    //
    qputenv("QT_QPA_EGLFS_HIDECURSOR", "1");
    qputenv("QT_QPA_EGLFS_DISABLE_INPUT", "1");
    qputenv("FB_MULTI_BUFFER", "2");
    qputenv("QT_QPA_EGLFS_WIDTH", WIDTH);
    qputenv("QT_QPA_EGLFS_HEIGHT", HEIGHT);
    qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", WIDTH);
    qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", HEIGHT);
    qputenv("QT_QPA_FONTDIR", ".");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    //
    // SerialPort to thread
    //
    QThread *thread = new QThread;                  //Создаем поток для порта платы
    SerialPort *SerialPortNew = new SerialPort();   //Создаем обьект по классу
    SerialPortNew->moveToThread(thread);            //помешаем класс  в поток
    // соединяем сигналы и слоты
    QObject::connect(SerialPortNew, SIGNAL(serial_data_Changed(QString)), SerialPortNew, SLOT(onReadData()));
    thread->start();
    //

    QQmlApplicationEngine engine;

    qmlRegisterType<SerialPort>("SerialPortLib", 1, 0, "SerialPort");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
