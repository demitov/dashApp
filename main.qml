import QtQuick 2.8
import QtQuick.Window 2.2

import SerialPortLib 1.0

Window {
    id: dash
    visible: true
    width: 1280
    height: 480
    color: "grey"
    title: qsTr("dashApp")

    property variant sourceData: [238,63,2123,175321,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

    // get the data from the serial port and put it into an array sourceData
    SerialPort {
        onSerial_dataChanged: {
            sourceData: "%1".arg(serial_data).split(',')
        }
    }

    // Coolant temp
    ProgressBar{
        id: coolantTemp

        x: 364
        y: 92
        visible: true

        //
        scale_value: 144
    }

    // Fuel level
    ProgressBar{
        id: fuelLevel

        x: 870
        y: 92

        //
        scale_value: 144.7
    }

    // DashMask
    Image {
        id: dashMask
        source: "./images/DashMask.png"
        anchors.centerIn: parent
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
        mileage: sourceData[3]
    }

    // in progress icons
    Image {
        id: turnLeft
        x: 468
        y: 40
        source: "./icons/TurnLeft.png"
        visible: true
    }
    Image {
        id: turnRight
        x: 794
        y: 40
        source: "./icons/TurnRight.png"
        visible: true
    }
    Image {
        id: checkEngine
        x: 10
        y: 67
        source: "./icons/CheckEngine.png"
        visible: true
    }
    Image {
        id: batteryLow
        source: "./icons/Battery.png"
        visible: true
    }
}
