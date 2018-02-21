import QtQuick 2.9
import QtQuick.Window 2.3

import SerialPortLib 1.0

Window {
    id: main
    visible: true
//    visibility: Window.FullScreen
    width: 1280
    height: 480
    color: "grey"
    title: qsTr("dashApp")

    property string serial_data : ""
    property variant sourceData: [238,63,2123,13.7,15,93,175571,0,0,255]

    //массив sourceData получаемый от Arduino
    /*
    1   скорость
    2   обороты двигателя
    3   напряжение бортовой сети
    4   уровень топлива
    5   температура ОЖ
    6   показания одометра
    ...
    */


    // get the data from the serial port and put it into an array sourceData
    SerialPort {
        onSerial_data_Changed: {
            sourceData = "%1".arg(serial_data).split(',')
        }
    }

    Dash {
        anchors.centerIn: parent
    }
}
