import QtQuick 2.9
import QtQuick.Window 2.2

import SerialPortLib 1.0

Window {
    id: dash
    visible: true
    width: 1280
    height: 480
    color: "grey"
    title: qsTr("dashApp")

    property variant sourceData: [238,63,2123,13.7,0,90,175321.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

    //массив sourceData получаемый от Arduino
    /*
    1   скорость
    2   обороты двигателя
    3   напряжение бортовой сети
    4   уровень топлива
    5   температура ОЖ
    6   одометр 3-й байт
    7   одометр 2-й байт
    8   одометр 1-й байт
    9   одометр 0-й байт
    ...
    */


    // get the data from the serial port and put it into an array sourceData
    SerialPort {
        onSerial_dataChanged: {
            sourceData: "%1".arg(serial_data).split(',')
        }
    }

    // Coolant temp
    ProgressBar{
        id: coolantTemp

        x: 357
        y: 95
        visible: true

        //
        scale_value: sourceData[5] <= 50 ? 0 : (sourceData[5] - 50) * 2
    }

    // Fuel level
    ProgressBar{
        id: fuelLevel

        x: 862
        y: 95

        //
        scale_value: 144
    }

    // DashMask
//    Image {
//        id: dashMask
//        source: "./images/DashMask.png"
//        anchors.centerIn: parent
//    }

    DashMask {
        anchors.centerIn: parent
    }

    // Clock
    Clock {
        x: 400
        y: 370
    }

    Voltmeter{
        id: voltmeter
        x: 839
        y: 370
        voltage: sourceData[3]
    }

    Tachometer {
        id: tachometer
        anchors.centerIn: parent
        rpm: sourceData[2] * 0.04
    }

    Speedometer {
        id: speedometer
        anchors.centerIn: parent
        speed: sourceData[1]
    }

    Odometer {
        id: odometer
        anchors.horizontalCenter: speedometer.horizontalCenter
        anchors.top: speedometer.bottom
        mileage: sourceData[6]
    }

    Icons{
        // in progress icons
    }
}
