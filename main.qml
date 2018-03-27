import QtQuick 2.9
import QtQuick.Window 2.3

//import SerialPortLib 1.0

Window {
    id: main

    visible: true
    //    visibility: Window.FullScreen
    width: 1280
    height: 480
    color: colorBackground
    title: qsTr("dashApp")

    property string serial_data : ""
    property variant sourceData: [238,63,3123,13.7,15,90,175571,0,0,255]

    property string colorNeedle:        "red"
    property string colorBackground:    "grey"

    //массив sourceData получаемый от Arduino
    /*
    1   скорость
    2   обороты двигателя
    3   напряжение бортовой сети
    4   уровень топлива
    5   температура ОЖ
    6   показания одометра
    ...
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

    onSerial_dataChanged: {
        sourceData = "%1".arg(serial_data).split(',')
    }

//    SerialPort {
//        onSerial_data_Changed: {
//            sourceData = "%1".arg(serial_data).split(',')
//        }
//    }
}
