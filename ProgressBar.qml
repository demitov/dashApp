import QtQuick 2.10

Item{
    id: progressBar

    property alias scale_value: valueBar.height
    property alias color: valueBar.color

    width: 75
    height: 150

    Rectangle {
        id: valueBar
        width: parent.width
        border.width: 0
//        color: "white"
        anchors.bottom: parent.bottom
    }
}
