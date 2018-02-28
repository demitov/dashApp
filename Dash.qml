import QtQuick 2.9

Item {
    id: dash
    width: 640
    height: 480

    // Coolant temp
    ProgressBar{
        id: coolantTemp
        x: 30
        y: 90
        visible: true
        //
        scale_value: main.sourceData[5] <= 50 ? 0 : (sourceData[5] - 50) * 1.9
        color: main.sourceData[5] >110 ? "red" : "white"
    }

    // Fuel level
    ProgressBar{
        id: fuelLevel
        x: 540
        y: 90
        //
        scale_value: 111
        color: "white"
    }

    // DashMask
    Image {
        id: dashMask
        source: "./images/DashMask.png"
        anchors.centerIn: parent
    }

//    DashMask {
//        anchors.centerIn: parent
//    }

    // Clock
    Clock {
        id: clock
        anchors.left: parent.left
        anchors.bottom: parent.bottom
    }

    // Voltmeter
    Inscription {
        id: voltmeter
        anchors.left: parent.left
        anchors.bottom: clock.top
        text: String(main.sourceData[3])
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
        size: 160
    }

    // Odometer
    Inscription {
        id: odometer
        anchors.horizontalCenter: speedometer.horizontalCenter
        anchors.top: speedometer.bottom
        text: String(main.sourceData[6])
        size: 30
    }
}
