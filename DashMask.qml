import QtQuick 2.9

Canvas {
    id: dashMask
    anchors.fill: parent
    onPaint: {
        var ctx = getContext("2d")

        //внешний круг
        ctx.beginPath();
        ctx.arc(parent.width/2,parent.height/2,210,Math.PI, 4*Math.PI, false)
        ctx.stroke();
        ctx.closePath();

        //внутренний круг
        ctx.beginPath();
        ctx.arc(parent.width/2,parent.height/2,185,Math.PI, 4*Math.PI, false)
        ctx.stroke();
        ctx.closePath();

        //левый край
        ctx.beginPath();
        ctx.arc(parent.width/2,parent.height/2,300, 135*Math.PI/180, 225*Math.PI/180, false)
        ctx.stroke();
        ctx.closePath();

        //правый край
        ctx.beginPath();
        ctx.arc(parent.width/2,parent.height/2,300, 45*Math.PI/180, 315*Math.PI/180, true)
        ctx.stroke();
        ctx.closePath();
    }
}
