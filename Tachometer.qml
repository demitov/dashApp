import QtQuick 2.9

Item {
    id: tacho
    property alias rpm: needleRotation.angle
    width: 300
    height: 300
    anchors.centerIn: parent

    Image {
        id: tachoScales
        anchors.centerIn: parent
        source: "qrc:/images/TachoScales.png"
    }
    Rectangle {
        id: needle
        width: 5
        height: 150
        color: main.colorNeedle
        x: (parent.width / 2) - 3
        y: parent.height / 2
        transform: Rotation {
            id: needleRotation
            origin.x: 5
            origin.y: 0
        }
        smooth: true
    }

//    Image {
//        id: needle
//        source: "./images/Needle.png"
//        x: (parent.width / 2) - 5
//        y: parent.height / 2
//        transform: Rotation {
//            id: needleRotation
//            origin.x: 5
//            origin.y: 0
//        }
//        smooth: true
//    }
}
