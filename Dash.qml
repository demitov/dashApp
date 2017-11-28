import QtQuick 2.9

Item {
    id: dash
    width: 960
    height: 720

    // Coolant temp
    ProgressBar{
        id: coolantTemp

        x: 56
        y: 140
        visible: true

        //
        scale_value: main.sourceData[5] <= 50 ? 0 : (sourceData[5] - 50) * 2
    }

    // Fuel level
    ProgressBar{
        id: fuelLevel

        x: 814
        y: 140

        //
        scale_value: 144
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
//    Clock {
//        x: 400
//        y: 370
//    }
//
//    Voltmeter{
//        id: voltmeter
//        x: 839
//        y: 370
//        voltage: main.sourceData[3]
//    }

    Tachometer {
        id: tachometer
        anchors.centerIn: parent
        rpm: main.sourceData[2] * 0.04
    }

    Speedometer {
        id: speedometer
        anchors.centerIn: parent
        speed: main.sourceData[1]
    }

    Odometer {
        id: odometer
        anchors.horizontalCenter: speedometer.horizontalCenter
        anchors.top: speedometer.bottom
        mileage: main.sourceData[6]
    }

    //    Icons{
    //        // in progress icons
    //    }
}
