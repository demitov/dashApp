import QtQuick 2.9
import QtGraphicalEffects 1.0
Item {
    id: voltmeter
    property alias voltage: voltageDigit.text

    width: voltageDigit.width
    height: voltageDigit.height

    Text {
        id: voltageDigit
        font.pixelSize: 20
        font.bold: true
        font.family: "Eurostyle"
        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        anchors.fill: voltageDigit
        horizontalOffset: 1
        verticalOffset: 4
        radius: 2.0
        samples: 16
        color: "black"
        source: voltageDigit
    }
}
