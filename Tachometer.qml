import QtQuick 2.8
import QtGraphicalEffects 1.0

Item {
    id: tachometer
    property alias text : rpmDigit.text

    width: rpmDigit.width
    height: rpmDigit.height


    Text {
        id: rpmDigit
        font.pixelSize: 24
        font.bold: true
        font.family: "Eurostyle"
        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        anchors.fill: rpmDigit
        horizontalOffset: 1
        verticalOffset: 4
        radius: 2.0
        samples: 16
        color: "black"
        source: rpmDigit
    }
}
