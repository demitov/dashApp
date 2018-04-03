import QtQuick 2.9

Item {
    id: tacho
    property alias rpm: needleRotation.angle
    width: 420
    height: 420
    anchors.centerIn: parent

    Rectangle {
        id: needle
        width: 5
        height: 210
        color: main.colorNeedle
        x: (parent.width / 2) - 3
        y: parent.height / 2
        transform: Rotation {
            id: needleRotation
            origin.x: 3
            origin.y: 0
        }
        antialiasing: true
    }
}
