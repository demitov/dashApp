import QtQuick 2.9

Item {
    width: 75
    height: 150

    Canvas {
//        id: cooliantTemp
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");

            ctx.reset();
            ctx.fillStyle = colorBackground;

            ctx.beginPath();
            ctx.moveTo(20, 20);

        }
    }
}
