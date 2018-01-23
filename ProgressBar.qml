import QtQuick 2.9

Item{
    id: progressBar

    property alias scale_value: valueBar.height
    property alias color: valueBar.color

    width: 90
    height: 220

    Rectangle {
        id: valueBar
        width: parent.width
        border.width: 0
//        color: "white"
        anchors.bottom: parent.bottom
    }
}
