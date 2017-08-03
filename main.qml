import QtQuick 2.8
import QtQuick.Window 2.2

import SerialPortLib 1.0
import RadialBarLib 1.0

Window {
    id: dash
    visible: true
    width: 640
    height: 240
    color: "grey"
    title: qsTr("dashApp")

//    property int speed: 63
//    property int rpm: 23
//    property int tempCooliant: 89

    SerialPort {
        onSerial_dataChanged: {
            tx.text = "%1".arg(serial_data);
        }
    }

    Text {
        id: tx
        anchors.centerIn: parent
        fontSizeMode: Text.Fit
        font.family: "Eurostyle"
        font.pointSize: 18
    }

}
