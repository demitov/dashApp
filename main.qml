import QtQuick 2.8
import QtQuick.Window 2.2

import SerialPortLib 1.0

Window {
    id: dash
    visible: true
    // Resolution SHARP LQ123K1LG03
    width: 1280
    height: 480
    color: "black"
    title: qsTr("dashApp")

    property variant sourceData: [238,63,2123,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

    SerialPort {
        onSerial_dataChanged: {
            sourceData: "%1".arg(serial_data).split(',')
        }
    }

    Image {
        id: dashboardMask
        source: "./images/DashboardMask.png"
        anchors.centerIn: parent
    }

    Speedometer {
        id: speedometer
        anchors.centerIn: parent
        text: sourceData[1]
    }

    Tachometer {
        id: tachometer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: speedometer.bottom
        text: sourceData[2]
    }
}
