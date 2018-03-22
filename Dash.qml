import QtQuick 2.9

Item {
    id: dash
    width: 1280
    height: 480
    opacity: 0
    Component.onCompleted: dashAnimation.running = true

    OpacityAnimator {
        id: dashAnimation
        target: dash
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutCirc
    }

    // Voltmeter
    Inscription {
        id: voltmeter
        x: 200
        y: 430
        text: String(main.sourceData[3])
        anchors.leftMargin: 214
        size: 20
    }

    Tachometer {
        id: tachometer
        anchors.centerIn: parent
        rpm: main.sourceData[2] * 0.04
    }

    // Speedometer
    Inscription {
        id: speedometer
        anchors.centerIn: parent
        text: String(main.sourceData[1])
        size: 100
    }

    // Odometer
    Inscription {
        id: odometer
        anchors.horizontalCenter: speedometer.horizontalCenter
        anchors.top: speedometer.bottom
        text: String(main.sourceData[6])
        size: 26
    }

    Row {
        id: topIcons
        anchors.horizontalCenter: parent.horizontalCenter
        y: 5
        spacing: 300

        Image {
            id: turnLeft
            source: "qrc:/icons/TurnLeft.png"
            visible: true
        }

        Image {
            id: turnRight
            source: "qrc:/icons/TurnRight.png"
            visible: true
        }
    }
}
