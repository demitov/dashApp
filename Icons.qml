import QtQuick 2.9

Item {
    id: icons
    width: 1280
    height: 480

    Image {
        id: highBeam
        anchors.top: parent.top
        anchors.topMargin: parent.height / 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/icons/HighBeam.png"
        visible: main.isVisible(main.sourceData[19])
    }

    Row {
        anchors.top: highBeam.bottom
        anchors.horizontalCenter: highBeam.horizontalCenter
        spacing: 8

        Image {
            id: oilPressureLow
            source: "qrc:/icons/OilPressureLow.png"
            visible: main.isVisible(main.sourceData[8])
        }

        Image {
            id: checkEngine
            source: "qrc:/icons/CheckEngine.png"
            visible: main.isVisible(main.sourceData[9])
        }
    }
}
