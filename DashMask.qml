import QtQuick 2.9

Canvas {
    id: mask

    width: 800
    height: 600

    onPaint: {
        var ctx = getContext("2d");

        ctx.lineWidth = 1
        ctx.strokeStyle = "white"

        //внешний круг
        ctx.beginPath();
        ctx.arc(mask.width/2,mask.height/2,210,Math.PI, 4*Math.PI, false);
        ctx.stroke();
        ctx.closePath();

        //внутренний круг
        ctx.beginPath();
        ctx.arc(mask.width/2,mask.height/2,185,Math.PI, 4*Math.PI, false);
        ctx.stroke();
        ctx.closePath();

        //левый край
        ctx.beginPath();
        ctx.arc(mask.width/2,mask.height/2,300, 145*Math.PI/180, 215*Math.PI/180, false);
        ctx.moveTo(154,128);
        ctx.lineTo(200,128);
        ctx.moveTo(100,mask.height/2);
        ctx.arc(mask.width/2,mask.height/2,264, 180*Math.PI/180, 221*Math.PI/180, false);
        ctx.moveTo(154,472);
        ctx.lineTo(200,472);
        ctx.stroke();
        ctx.closePath();

        //правый край
        ctx.beginPath();
        ctx.arc(mask.width/2,mask.height/2,300, 35*Math.PI/180, 325*Math.PI/180, true);
        ctx.moveTo(646,128);
        ctx.lineTo(600,128);
        ctx.moveTo(700,mask.height/2);
        ctx.arc(mask.width/2,mask.height/2,264, 0*Math.PI/180, 319*Math.PI/180, true);
        ctx.moveTo(646,472);
        ctx.lineTo(600,472);
        ctx.stroke();
        ctx.closePath();
    }
}
