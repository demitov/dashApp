import QtQuick 2.11
import QtGraphicalEffects 1.0

Item {
    property alias text: inscriptionText.text
    property alias size: inscriptionText.font.pixelSize

    width: inscriptionText.width
    height: inscriptionText.height

    FontLoader {
        id: ubuntuFont
        name: "UbuntuFont"
        source: "qrc:/UbuntuFont.ttf"
    }

    Text {
        id: inscriptionText
        font.bold: true
//        font.family: ubuntuFont.name
        color: "white"
        anchors.centerIn: parent
    }

    DropShadow {
        id: dropShadow
        anchors.fill: inscriptionText
        horizontalOffset: 2
        verticalOffset: 4
        radius: 6
        samples: 16
        color: "grey"
        source: inscriptionText
    }
}
