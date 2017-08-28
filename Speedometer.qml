import QtQuick 2.8
import QtGraphicalEffects 1.0

Item {
    id: speedometer
    property alias speed: speedDigit.text

    width: speedDigit.width
    height: speedDigit.height

    Text {
        id: speedDigit
        font.pixelSize: 90
        font.bold: true
        font.family: "Eurostyle"
        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        id: dropShadow
        anchors.fill: speedDigit
        horizontalOffset: 2
        verticalOffset: 6
        radius: 4.0
        samples: 16
        color: "black"
        source: speedDigit
    }
}
