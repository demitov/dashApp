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

    // serial string
    Inscription {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.left: parent.left

        text: String(main.serial_data)
        size: 18
    }

    //Icons
    Icons {
        anchors.fill: parent
    }

    // Icons temp
    IconsTemp {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

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
        size: 120
    }

    Row {
        id: topIcons
        anchors.horizontalCenter: parent.horizontalCenter
        y: 5
        spacing: 300

        Image {
            id: turnLeft
            source: "qrc:/icons/TurnLeft.png"
            visible: main.sourceData[17]
        }

        Image {
            id: turnRight
            source: "qrc:/icons/TurnRight.png"
            visible: main.sourceData[18]
        }
    }

    Row {
        id: bottomLeft
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        spacing: 48

        // empty Item
        Item {
            width: 48
            height: 48
        }

        // Voltmeter
        Inscription {
            id: voltmeter
            text: String(main.sourceData[3]) + "V"
            size: 20
        }

        // Outside Temp
        Inscription {
            id: outsideTemp
            text: String(main.sourceData[7]) + "\xB0"
            size: 20
        }
    }

    Row {
        id: bottomRight
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        spacing: 48

        // Odometer
        Inscription {
            id: odometer
            text: String(main.sourceData[6])
            size: 20
        }

        // empty Item
        Item {
            width: 48
            height: 48
        }
    }
}
