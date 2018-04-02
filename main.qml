import QtQuick 2.9
import QtQuick.Window 2.3

import SerialPortLib 1.0

Window {
    id: main

    visible: true
    width: 1280
    height: 480
    color: colorBackground
    title: qsTr("dashApp")

    property variant sourceData: [238,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]
//                                                                       1 1 1 1 1 1 1 1 1 1 2 2 2
//                                 0  1    2   3   4  5     6     7  8 9 0 1 2 3 4 5 6 7 8 9 0 1 2
//    property variant sourceData: [238,63,2123,13.7,15,90,175571.3,23,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,255]

    property string colorNeedle:        "red"
    property string colorBackground:    "grey"

    //массив sourceData получаемый от Arduino
    /*
    === ДАТЧИКИ ===
    1   скорость
    2   обороты двигателя
    3   напряжение бортовой сети
    4   уровень топлива
    5   температура ОЖ
    6   показания одометра
    7   температура наружнего воздуха

    === ЛАМПЫ ===
    8   давление масла
    9   check engine
    10  левый поворотник
    11  правый поворотник
    12  дальний свет
    13  ABS
    14  иммобилайзер
    15  открыта дверь
    16  открыт багажник
    17  зарядка аккумулятора
    18  тормоза
    19  ремень безопасности
    20  AIR BAG
    21  передние туманки
    */

    // Coolant temp
    ProgressBar{
        id: coolantTemp
        x: 323
        y: 90
        width: 70
        visible: true
        scale_value: main.sourceData[5] <= 50 ? 0 : (sourceData[5] - 50) * 1.9
        color: main.sourceData[5] >110 ? "red" : "white"
    }

    // Fuel level
    ProgressBar{
        id: fuelLevel
        x: 887
        y: 90
        width: 70
        scale_value: 111
        color: "white"
    }
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

    function isVisible(value) {
        return value > 0;
    }
}
