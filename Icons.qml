import QtQuick 2.11

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
            visible: main.isVisible(main.varTurnLeft)
    }

    Image {
        id: turnRight
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenterOffset: 175
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/icons/TurnRight.png"
            visible: main.isVisible(main.varTurnRight)
        }

    Image {
        id: highBeam
        anchors.top: parent.top
        anchors.topMargin: parent.height / 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/icons/HighBeam.png"
        visible: main.isVisible(main.varHighBeam)
    }

    Image {
        id: checkEngine
        anchors.top: highBeam.bottom
        anchors.horizontalCenter: highBeam.horizontalCenter
        source: "qrc:/icons/CheckEngine.png"
        visible: main.isVisible(main.varCheckEngine)
    }

    Image {
        id: oilPressureLow
        x: 780
        y: 330
        source: "qrc:/icons/OilPressureLow.png"
        visible: main.isVisible(main.varOilPressure)
    }
}
