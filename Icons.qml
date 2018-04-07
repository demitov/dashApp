import QtQuick 2.10

Item {
    id: icons
    width: 1280
    height: 480

    Image {
        id: turnLeft
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenterOffset: -175
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/icons/TurnLeft.png"
            visible: main.isVisible(main.sourceData[10])
    }

    Image {
        id: turnRight
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenterOffset: 175
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/icons/TurnRight.png"
            visible: main.isVisible(main.sourceData[11])
        }

    Image {
        id: highBeam
        anchors.top: parent.top
        anchors.topMargin: parent.height / 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/icons/HighBeam.png"
        visible: main.isVisible(main.sourceData[12])
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
