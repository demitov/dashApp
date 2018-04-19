import QtQuick 2.10
import QtGraphicalEffects 1.0

Item{
    id: fuelLevel
    width: 75
    height: 150

    property alias scale_value: valueBar.height
    property alias color: valueBar.color

    Rectangle {
        id: maskObj
        anchors.fill: parent
        color: "black"

        Rectangle {
            id: valueBar
            width: parent.width
            border.width: 0
            anchors.bottom: parent.bottom
        }

        smooth: true
        visible: false
    }

    Image {
        id: maskImage
        source: "qrc:/images/maskFuelLevel.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    OpacityMask {
        id: maskEffect
        anchors.fill: parent
        source: maskObj
        maskSource: maskImage
    }
}
