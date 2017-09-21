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

    property variant sourceData: [238,63,2123,175321.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

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
        y: 93
        visible: true

        //
        scale_value: 100
    }

    // Fuel level
    ProgressBar{
        id: fuelLevel

        x: 870
        y: 93

        //
        scale_value: 144
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
        source: "./icons/CheckEngine.png"
        visible: true
    }
    Image {
        id: batteryLow
        anchors.top: checkEngine.bottom
        source: "./icons/Battery.png"
        visible: true
    }
    Image {
        id: absError
        source: "./icons/ABS.png"
        anchors.top: batteryLow.bottom
        visible: true
    }
    Image {
        id: brakeWarning
        source: "./icons/BrakeWarning.png"
        anchors.top: absError.bottom
        visible: true
    }
    Image {
        id: oilPressureLow
        source: "./icons/OilPressureLow.png"
        anchors.top: brakeWarning.bottom
        visible: true
    }
    Image {
        id: doorAjar
        source: "./icons/DoorAjar.png"
        anchors.top: parent.top
        anchors.left: oilPressureLow.right
        visible: true
    }
    Image {
        id: trunkLidAjar
        source: "./icons/TrunkLidAjar.png"
        anchors.top: doorAjar.bottom
        anchors.left: doorAjar.left
        visible: true
    }
    Image {
        id: seatBelt
        source: "./icons/SeatBelt.png"
        anchors.top: trunkLidAjar.bottom
        anchors.left: trunkLidAjar.left
        visible: true
    }
    Image {
        id: airBag
        source: "./icons/AirBag.png"
        anchors.top: seatBelt.bottom
        anchors.left: seatBelt.left
        visible: true
    }
}
