import QtQuick 2.9

Item {
    id: dash
    width: 1280
    height: 480

//    // Coolant temp
//    ProgressBar{
//        id: coolantTemp
//        x: 30
//        y: 90
//        visible: true
//        //
//        scale_value: main.sourceData[5] <= 50 ? 0 : (sourceData[5] - 50) * 1.9
//        color: main.sourceData[5] >110 ? "red" : "white"
//    }

//    // Fuel level
//    ProgressBar{
//        id: fuelLevel
//        x: 540
//        y: 90
//        //
//        scale_value: 111
//        color: "white"
//    }

//    // DashMask
//    Image {
//        id: dashMask
//        source: "qrc:/images/DashMask.png"
//        anchors.centerIn: parent
//    }


    // Voltmeter
    Inscription {
        id: voltmeter
        x: 200
        y: 430
        text: String(main.sourceData[3])
        anchors.leftMargin: 214
        size: 20
        z: 2
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
        y: 15
        spacing: 40

        Image {
            id: turnLeft
            source: "qrc:/icons/TurnLeft.png"
            visible: true
        }

        Image {
            id: frontFog
            source: "qrc:/icons/FrontFog.png"
            visible: true
        }

        Image {
            id: highBeam
            source: "qrc:/icons/HighBeam.png"
            visible: true
        }

        Image {
            id: turnRight
            source: "qrc:/icons/TurnRight.png"
            visible: true
        }
    }
}
