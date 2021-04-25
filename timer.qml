import QtQuick 2.5
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3

Item
{
    id: app
    property var ms: 0 //milliseconds
    property var s:1  //seconds
    property var m:0   //minutes
    property var h: 0  //hours



    visible: true
   // color: "#000000"
    width: 350
    height: 350
  //  title: qsTr("My Timer")
  //  maximumHeight: height
   // maximumWidth: width
   // minimumHeight: height
  //  minimumWidth: width

    Item
    {
        Timer
        {
            id:simpleTimer
            interval: 21; running: false; repeat: true
            onTriggered:
            {
                if(!(ms==0 && s==0 && m==0 && h==0)){

                     ms=ms+21
                }

                if(ms>=1000)
                {
                    s=s-1
                    ms=0


                    if(s==0)
                    {
                        if(m!=0)
                        {
                        m=m-1
                        s=60
                        }
                    }
                    if(m==0 && s==0)
                    {
                        if(h!=0)
                        {
                           h=h-1
                           m+=59
                            s=60
                        }

                    }


                }
                if(s<10)
                lablTimer.text = "0"+h+":0"+m+":0"+s.toString()//+":"+ms.toString()
                else lablTimer.text ="0"+h+":"+m+":"+s.toString()
            }
         }
    }


    ColumnLayout
    {
        width: 291
        height: 92
        rotation: 0.14
        anchors.verticalCenterOffset: 20
        anchors.horizontalCenterOffset: 36
        anchors.centerIn: parent
       Label
       {
           id : lablTimer
           width: 265
           height: 60
           color: "#ffffff"
           text: qsTr("00:00:00")
           //Layout.alignment: parent.horizontalCenter
           //anchors.horizontalCenter: parent.horizontalCenter
           font.pixelSize: 50
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
       }

        RowLayout
        {
            Button
            {
                id: startBut
                x: 25
                text: "Start"
                //isDefault: false
                onClicked:
                {
                    buttStop.enabled=true
                   // buttnewLine.enabled=true


                    //pause or start
                    if(simpleTimer.running==false)
                     {
                        startBut.text= qsTr("Pause")
                        simpleTimer.running =true
                     }
                    else
                    {
                        startBut.text=  qsTr("Start")
                        simpleTimer.running =false
                    }
                }
            }

            Button
            {
                id: buttStop
                x: 140
                y: 0
                width: 93
                enabled: false
                text: qsTr("Cancel")
                onClicked:
                {


                    buttStop.enabled = false
                    startBut.text = "Start"
                    simpleTimer.stop()
                    lablTimer.text="00:00:00"
                    ms=0
                    s=1
                    m=0
                    h=0

                }
            }


        }
    }

    Button {
        id: plusOne
        x: 65
        y: 78
        width: 42
        height: 28
        text: qsTr("1Min")

        onClicked: {
            m=m+1
            if(m>=60){
                m=0
                h=h+1
            }
            if(m<10){
            lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
            }
            else{
             lablTimer.text = "0"+h+":"+m+":0"+s.toString()
            }

        }
    }

    Button {
        id: plusFive
        x: 113
        y: 78
        width: 42
        height: 28
        text: qsTr("5Min")

        onClicked: {
           m=m+5
            if(m>=60){
                m=0
                 h=h+1
            }
            if(m<10){
            lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
            }
            else{
             lablTimer.text = "0"+h+":"+m+":0"+s.toString()
            }
        }
    }

Button {
    id: plusTen
    x: 165
    y: 78
    width: 42
    height: 28
    text: qsTr("10Min")
    onClicked: {
       m=m+10
        if(m>=60){
            m=0
             h=h+1
        }
        if(m<10){
        lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
        }
        else{
         lablTimer.text = "0"+h+":"+m+":0"+s.toString()
        }
    }

}

Button {
    id: plusFifteen
    x: 218
    y: 78
    width: 42
    height: 28
    text: qsTr("15Min")
    onClicked: {
        m=m+15
        if(m>=60){
            m=0
             h=h+1
        }

        if(m<10){
        lablTimer.text = "0"+h+":0"+m+":0"+s.toString()
        }
        else{
         lablTimer.text = "0"+h+":"+m+":0"+s.toString()
        }
    }
}

Label {

    id: lablTimer1
    x: 75
    y: 270
    width: 169
    height: 36
    color: "#ffffff"
    text: qsTr("🔔 00:00:00")
    font.pixelSize: 30

}


}

