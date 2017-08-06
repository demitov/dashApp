import QtQuick 2.8
import QtQuick.Window 2.2

import SerialPortLib 1.0
import RadialBarLib 1.0

Window {
    id: dash
    visible: true
    width: 640
    height: 240
    color: "black"
    title: qsTr("dashApp")

    property string serialData: ""
    property variant sourceData: [238,63,2123,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

    SerialPort {
        onSerial_dataChanged: {
            sourceData: "%1".arg(serial_data).split(',')
        }
    }

    Text {
        id: speedometer
        anchors.centerIn: parent
        color: "turquoise"
        font.pointSize: 32
        text: sourceData[1]
    }

    Text {
        id: tachometer
        color: "turquoise"
        font.pixelSize: 18
        text: sourceData[2]
        anchors.horizontalCenter: speedometer.horizontalCenter
        anchors.top: speedometer.bottom
    }
}
