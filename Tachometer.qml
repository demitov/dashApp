import QtQuick 2.8

Item {
    id: tacho
    property alias rotation: needle.rotation
    width: 604
    height: 424
    anchors.centerIn: parent

    Image {
        id: tachoMask
        source: "./images/Tacho.png"
        anchors.centerIn: parent
    }

    Image {
        id: needle
        source: "./images/Needle.png"
        x: (parent.width / 2) - 5
        y: parent.height / 2
        transformOrigin: Item.Top
        smooth: true
    }
}
