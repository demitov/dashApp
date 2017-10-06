import QtQuick 2.9
import QtGraphicalEffects 1.0

Item {
    id: odometer
    property alias mileage : odoDigit.text

    width: odoDigit.width
    height: odoDigit.height

    Text {
        id: odoDigit
        font.pixelSize: 22
        font.bold: true
        font.family: "Eurostyle"
        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        anchors.fill: odoDigit
        horizontalOffset: 1
        verticalOffset: 4
        radius: 2.0
        samples: 16
        color: "black"
        source: odoDigit
    }
}
