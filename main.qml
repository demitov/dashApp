import QtQuick 2.9
import QtQuick.Window 2.3

import SerialPortLib 1.0

Window {
    id: main
    visible: true
    width: 1200
    height: 720
    color: "grey"
    title: qsTr("dashApp")

    property variant sourceData: [238,63,2123,13.7,0,90,175321.3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,255]

    //массив sourceData получаемый от Arduino
    /*
    1   скорость
    2   обороты двигателя
    3   напряжение бортовой сети
    4   уровень топлива
    5   температура ОЖ
    6   одометр 3-й байт
    7   одометр 2-й байт
    8   одометр 1-й байт
    9   одометр 0-й байт
    ...
    */


    // get the data from the serial port and put it into an array sourceData
    SerialPort {
        onSerial_dataChanged: {
            sourceData: "%1".arg(serial_data).split(',')
        }
    }

    Dash {
        anchors.centerIn: parent
    }
}
