import QtQuick 2.10
import QtGraphicalEffects 1.0

Item {
    property alias text: inscriptionText.text
    property alias size: inscriptionText.font.pixelSize

    width: inscriptionText.width
    height: inscriptionText.height

    Text {
        id: inscriptionText
        font.bold: true
        font.family: "Eurostyle"
        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        id: dropShadow
        anchors.fill: inscriptionText
        horizontalOffset: 2
        verticalOffset: 5
        radius: 6
        samples: 16
        color: "grey"
        source: inscriptionText
    }
}
