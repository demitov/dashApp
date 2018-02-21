import QtQuick 2.9

Item {
    id: tacho
    property alias rpm: needleRotation.angle
    width: 404
    height: 404
    anchors.centerIn: parent

    Image {
        id: needle
        source: "./images/Needle.png"
        x: (parent.width / 2) - 5
        y: parent.height / 2
        transform: Rotation {
            id: needleRotation
            origin.x: 5
            origin.y: 0
        }
        smooth: true
    }
}
