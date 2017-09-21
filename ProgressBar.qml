import QtQuick 2.8

Item{
    id: progressBar

    property alias scale_value: valueBar.height


    width: 60
    height: 145

    Rectangle {
        id: valueBar
        width: parent.width
        border.width: 0
        color: "white"
        anchors.bottom: parent.bottom

    }
}
