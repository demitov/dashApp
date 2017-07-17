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

    property int speed: 63
    property int rpm: 23
    property double tempCooliant: 89

    SerialPort {
        onSerial_dataChanged: {
            tx.text = "%1".arg(serial_data);
        }
    }

    Text {
        id: tx
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 7
        fontSizeMode: Text.Fit
        font.family: "Eurostyle"
        font.pointSize: 18
    }

    // Cooliant temp
    RadialBar {
        width: dash.width / 5
        height: width
        penStyle: Qt.RoundCap
        dialType: RadialBar.FullDial
        progressColor: "darkgrey"
        foregroundColor: "black"
        dialWidth: 10
        startAngle: 30
        spanAngle: 180
        minValue: 40
        maxValue: 130
        value: dash.tempCooliant
        textFont {
            family: "consolas"
            italic: false
            pointSize: 18
        }
        suffixText: "°"
        textColor: "#c61e5d"
    }

    TachoNeedle {
        id: tachoNeedle

             anchors.verticalCenterOffset: 0
             anchors.centerIn: parent

             focus: true
             Keys.onPressed: {
                      if (event.key === Qt.Key_Space && !event.isAutoRepeat) {
                          tachoNeedle.value = 100
                      }
             }
             Keys.onReleased: {
                     if (event.key === Qt.Key_Space && !event.isAutoRepeat) {
                         tachoNeedle.value = 0
                     }}
    }

    Speedometer {
        id: speedometer
        anchors.centerIn: parent
        text: dash.speed
    }
}
