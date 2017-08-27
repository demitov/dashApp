import QtQuick 2.8

Item {
    id: tacho
    property alias rotation: needle.rotation
    width: 400
    height: 400
    anchors.centerIn: parent

    Image {
        id: tachoMask
        source: "./images/Tacho.png"
        anchors.centerIn: parent
    }

    Image {
        id: needle
        source: "./images/Needle.png"
        x: 195
        y: 200
        transformOrigin: Item.Top
        smooth: true
    }
}

//Item {
//    id: tachometer
//    property alias text : rpmDigit.text

//    width: rpmDigit.width
//    height: rpmDigit.height

//    Text {
//        id: rpmDigit
//        font.pixelSize: 24
//        font.bold: true
//        font.family: "Eurostyle"
//        color: "white"
//        anchors.centerIn: parent
//    }

//    DropShadow {
//        anchors.fill: rpmDigit
//        horizontalOffset: 1
//        verticalOffset: 4
//        radius: 2.0
//        samples: 16
//        color: "black"
//        source: rpmDigit
//    }
//}
