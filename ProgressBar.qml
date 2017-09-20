import QtQuick 2.8

Item{
    id: progressBar

    property alias scale_value: valueBar.height


    width: 60

    Rectangle {
        id: valueBar
        rotation: 180
        width: parent.width
        border.width: 0
        color: "white"

    }
}
