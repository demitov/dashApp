import QtQuick 2.8
import QtQuick.Window 2.2

import SerialPortLib 1.0

Window {
    id: dash
    visible: true
    // Resolution SHARP LQ123K1LG03
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

    Tachometer {
        id: tachometer
        anchors.centerIn: parent
        rotation: sourceData[2] * 0.04
    }

    Speedometer {
        id: speedometer
        anchors.centerIn: parent
        text: sourceData[1]
    }

    Odometer {
        id: odometer
        anchors.horizontalCenter: speedometer.horizontalCenter
        anchors.top: speedometer.bottom
        text: sourceData[3]
    }
}
