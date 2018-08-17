import QtQuick 2.10
import QtQuick.Window 2.10

import SerialPortLib 1.0

Window {
    id: main

    visible: true
    width: 1280
    height: 480
    color: colorBackground
    title: qsTr("dashApp")

    property variant sourceData: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    property string colorNeedle:        "red"
    property string colorBackground:    "grey"

    property int    varSpeed:       sourceData[0]
    property int    varTacho:       sourceData[1]
    property real   varOdometr: 0//    sourceData[2]
    property real   varVoltage:     sourceData[2]
    property int    varFuel:        sourceData[3]
    property int    varCooliant:    sourceData[4]
    property real   varOutsideTemp: 0 //sourceData[6]
    property int    varOilPressure: sourceData[5]
    property int    varCheckEngine: sourceData[6]
    property int    varBatteryLow:  sourceData[7]
    property int    varBrakeWarn:   sourceData[8]
    property int    varABS:         sourceData[9]
    property int    varImmobilizer: sourceData[10]
    property int    varDoorAjar:    sourceData[11]
    property int    varTrunkLid:    sourceData[12]
    property int    varTurnLeft:    sourceData[13]
    property int    varTurnRight:   sourceData[14]
    property int    varHighBeam:    sourceData[15]
    property int    varFrontFog:    sourceData[16]
    property int    varAirBag:      sourceData[17]
    property int    varSeatBelt:    sourceData[18]

    //массив sourceData получаемый от Arduino
    /*
    === ДАТЧИКИ ===
    0   скорость
    1   обороты двигателя
    2   одометр
    3   напряжение бортовой сети
    4   уровень топлива
    5   температура ОЖ
    6   температура наружнего воздуха

    === ЛАМПЫ ===
    7   давление масла
    8   check engine
    9   зарядка аккумулятора
    10  тормоза
    11  ABS
    12  иммобилайзер
    13  открыта дверь
    14  открыт багажник
    15  левый поворотник
    16  правый поворотник
    17  дальний свет
    18  передние туманки
    19  AIR BAG
    */

    // загружать приборы только после того как загрузится маска панели
    Loader {
        id: loader
        asynchronous: true
        active: false
        source: "qrc:/Dash.qml"

        Image{
            id: dashMask
            source: "qrc:/images/DashMask.png"
            Component.onCompleted: loader.active = true
        }
    }

    SerialPort {
        onSerial_data_Changed: {
            sourceData = "%1".arg(serial_data).split(',')
        }
    }

    // функция нужна для иконок
    // без нее не воспринимает ноль как ЛОЖЬ
    function isVisible(value) {
        return value > 0;
    }
}
