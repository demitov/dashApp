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
    property variant sourceData: [238,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

    SerialPort {
        onSerial_dataChanged: {
            serialData = "%1".arg(serial_data);
            sourceData: serialData.split(',')
        }
    }

    Text {
        id: speed
        anchors.centerIn: parent
        color: "white"
        text: toString(sourceData[1])
    }
}
