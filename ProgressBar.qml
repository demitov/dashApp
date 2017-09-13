import QtQuick 2.8

Item{
    id: progressBar

    property alias scale_value: progressBar.height

    width: 60
//    height: 1   // 1 - 145

    Rectangle {
        id: valueBar
        width: parent.width
        height: parent.height
        border.width: 0
        color: "white"

    }
}
