import QtQuick 2.10

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

    // Coolant temp
    CoolantTemp {
        x: 321
        y: 90
        scale_value: main.varCooliant <= 50 ? 0 : (varCooliant - 50) * 1.9
        color: main.varCooliant >110 ? "red" : "white"
    }

    //Fuel level
    FuelLevel {
        x: 884
        y: 90
        scale_value: main.varFuel
        color: "white"
    }

    //Icons
    Icons {
        anchors.fill: parent
    }

    // иконки размещение которых еще не выбрано
    IconsTemp {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

    }

    Tachometer {
        id: tachometer
        anchors.centerIn: parent
        rpm: main.varTacho * 0.04
    }

    // Speedometer
    Inscription {
        id: speedometer
        anchors.centerIn: parent
        text: String(main.varSpeed)
        size: 120
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
            text: String(main.varVoltage) + "V"
            size: 20
        }

        // Outside Temp
        Inscription {
            id: outsideTemp
            text: String(main.varOutsideTemp) + "\xB0"
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
            text: String(main.sourceData[2])
            size: 20
        }

        // empty Item
        Item {
            width: 48
            height: 48
        }
    }
}
