import QtQuick 2.9

Item {
    width: 320
    height: 480

    Image {
        id: turnLeft
        x: 200
        y: 40
        source: "./icons/TurnLeft.png"
        visible: true
    }
    Image {
        id: turnRight
        x: 250
        y: 40
        source: "./icons/TurnRight.png"
        visible: true
    }
    Image {
        id: checkEngine
        source: "./icons/CheckEngine.png"
        visible: true
    }
    Image {
        id: batteryLow
        anchors.top: checkEngine.bottom
        source: "./icons/Battery.png"
        visible: true
    }
    Image {
        id: absError
        source: "./icons/ABS.png"
        anchors.top: batteryLow.bottom
        visible: true
    }
    Image {
        id: brakeWarning
        source: "./icons/BrakeWarning.png"
        anchors.top: absError.bottom
        visible: true
    }
    Image {
        id: oilPressureLow
        source: "./icons/OilPressureLow.png"
        anchors.top: brakeWarning.bottom
        visible: true
    }
    Image {
        id: doorAjar
        source: "./icons/DoorAjar.png"
        anchors.top: parent.top
        anchors.left: oilPressureLow.right
        visible: true
    }
    Image {
        id: trunkLidAjar
        source: "./icons/TrunkLidAjar.png"
        anchors.top: doorAjar.bottom
        anchors.left: doorAjar.left
        visible: true
    }
    Image {
        id: seatBelt
        source: "./icons/SeatBelt.png"
        anchors.top: trunkLidAjar.bottom
        anchors.left: trunkLidAjar.left
        visible: true
    }
    Image {
        id: airBag
        source: "./icons/AirBag.png"
        anchors.top: seatBelt.bottom
        anchors.left: seatBelt.left
        visible: true
    }
    Image {
        id: highBeam
        source: "./icons/HighBeam.png"
        anchors.top: airBag.bottom
        anchors.left: airBag.left
        visible: true
    }
    Image {
        id: immobilizer
        source: "./icons/Immobilizer.png"
        anchors.top: parent.top
        anchors.left: doorAjar.right
        visible: true
    }
    Image {
        id: frontFog
        source: "./icons/FrontFog.png"
        anchors.top: immobilizer.bottom
        anchors.left: immobilizer.left
        visible: true
    }
}
