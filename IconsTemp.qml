import QtQuick 2.9

Item {
    id: iconsTemp
    width: 240
    height: 320

    Image {
        id: batteryLow
        anchors.top: parent.top
        source: "qrc:/icons/Battery.png"
        visible: main.isVisible(main.sourceData[17])
    }
    Image {
        id: absError
        source: "qrc:/icons/ABS.png"
        anchors.top: batteryLow.bottom
        visible: main.isVisible(main.sourceData[13])
    }
    Image {
        id: brakeWarning
        source: "qrc:/icons/BrakeWarning.png"
        anchors.top: absError.bottom
        visible: main.isVisible(main.sourceData[18])
    }
    Image {
        id: doorAjar
        source: "qrc:/icons/DoorAjar.png"
        anchors.top: parent.top
        anchors.left: absError.right
        visible: main.isVisible(main.sourceData[15])
    }
    Image {
        id: trunkLidAjar
        source: "qrc:/icons/TrunkLidAjar.png"
        anchors.top: doorAjar.bottom
        anchors.left: doorAjar.left
        visible: main.isVisible(main.sourceData[16])
    }
    Image {
        id: seatBelt
        source: "qrc:/icons/SeatBelt.png"
        anchors.top: trunkLidAjar.bottom
        anchors.left: trunkLidAjar.left
        visible: main.isVisible(main.sourceData[19])
    }
    Image {
        id: airBag
        source: "qrc:/icons/AirBag.png"
        anchors.top: seatBelt.bottom
        anchors.left: seatBelt.left
        visible: main.isVisible(main.sourceData[20])
    }
    Image {
        id: immobilizer
        source: "qrc:/icons/Immobilizer.png"
        anchors.top: parent.top
        anchors.left: doorAjar.right
        visible: main.isVisible(main.sourceData[14])
    }
    Image {
        id: frontFog
        source: "qrc:/icons/FrontFog.png"
        anchors.top: immobilizer.bottom
        anchors.left: immobilizer.left
        visible: main.isVisible(main.sourceData[21])
    }
}
