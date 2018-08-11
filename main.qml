import QtQuick 2.10
import QtQuick.Window 2.10

import SerialPortLib 1.0

Window {
    id: main

    visible: true
    width: 1280
    height: 480
    color: colorBackground
    title: qsTr("dashApp")

    property variant sourceData: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    property string colorNeedle:        "red"
    property string colorBackground:    "grey"

    //массив sourceData получаемый от Arduino
    /*
    === ДАТЧИКИ ===
    0   скорость
    1   обороты двигателя
    2   напряжение бортовой сети
    3   уровень топлива
    4   температура ОЖ
    5   показания одометра
    -   температура наружнего воздуха

    === ЛАМПЫ ===
    6   давление масла
    7   check engine
    8  зарядка аккумулятора
    9  тормоза
    10  ABS
    11  иммобилайзер
    12  открыта дверь
    13  открыт багажник
    14  левый поворотник
    15  правый поворотник
    16  дальний свет
    17  передние туманки
    18  AIR BAG
    */

    // загружать приборы только после того как загрузится маска панели
    Loader {
        id: loader
        asynchronous: true
        active: false
        source: "qrc:/Dash.qml"

        Image{
            id: dashMask
            source: "qrc:/images/DashMask.png"
            Component.onCompleted: loader.active = true
        }
    }

    SerialPort {
        onSerial_data_Changed: {
            sourceData = "%1".arg(serial_data).split(',')
        }
    }

    // функция нужна для иконок
    // без нее не воспринимает ноль как ЛОЖЬ
    function isVisible(value) {
        return value > 0;
    }
}
