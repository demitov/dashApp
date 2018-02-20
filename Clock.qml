import QtQuick 2.9
import QtGraphicalEffects 1.0

Item {
    id: clock

    width: clockDigit.width
    height: clockDigit.height

    property int hours
    property int minutes

    function timeChanged() {
            var date = new Date;
            hours = date.getHours()
            minutes = date.getMinutes()
    }

    Timer {
           interval: 100; running: true; repeat: true;
           onTriggered: clock.timeChanged()
       }

    Text {
        id: clockDigit
        font.pixelSize: 20
        font.bold: true
        font.family: "Eurostyle"
        color: "white"
        anchors.centerIn: parent
        text: hours + ":" + minutes
    }

    DropShadow {
        anchors.fill: clockDigit
        horizontalOffset: 1
        verticalOffset: 3
        radius: 2.0
        samples: 16
        color: "grey"
        source: clockDigit
    }
}
