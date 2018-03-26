import QtQuick 2.9

Item {
    id: icons
    width: 240
    height: 320

    Image {
        id: checkEngine
        source: "qrc:/icons/CheckEngine.png"
        visible: true
    }
    Image {
        id: batteryLow
        anchors.top: checkEngine.bottom
        source: "qrc:/icons/Battery.png"
        visible: true
    }
    Image {
        id: absError
        source: "qrc:/icons/ABS.png"
        anchors.top: batteryLow.bottom
        visible: true
    }
    Image {
        id: brakeWarning
        source: "qrc:/icons/BrakeWarning.png"
        anchors.top: absError.bottom
        visible: true
    }
    Image {
        id: oilPressureLow
        source: "qrc:/icons/OilPressureLow.png"
        anchors.top: brakeWarning.bottom
        visible: true
    }
    Image {
        id: doorAjar
        source: "qrc:/icons/DoorAjar.png"
        anchors.top: parent.top
        anchors.left: oilPressureLow.right
        visible: true
    }
    Image {
        id: trunkLidAjar
        source: "qrc:/icons/TrunkLidAjar.png"
        anchors.top: doorAjar.bottom
        anchors.left: doorAjar.left
        visible: true
    }
    Image {
        id: seatBelt
        source: "qrc:/icons/SeatBelt.png"
        anchors.top: trunkLidAjar.bottom
        anchors.left: trunkLidAjar.left
        visible: true
    }
    Image {
        id: airBag
        source: "qrc:/icons/AirBag.png"
        anchors.top: seatBelt.bottom
        anchors.left: seatBelt.left
        visible: true
    }
    Image {
        id: highBeam
        source: "qrc:/icons/HighBeam.png"
        anchors.top: airBag.bottom
        anchors.left: airBag.left
        visible: true
    }
    Image {
        id: immobilizer
        source: "qrc:/icons/Immobilizer.png"
        anchors.top: parent.top
        anchors.left: doorAjar.right
        visible: true
    }
    Image {
        id: frontFog
        source: "qrc:/icons/FrontFog.png"
        anchors.top: immobilizer.bottom
        anchors.left: immobilizer.left
        visible: true
    }
}
