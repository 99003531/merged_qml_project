import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Window {
    width: 640
    height: 640
    visible: true
    title: qsTr("Hello World")
    color:"Black"

Loader
{
    id:loader
    anchors.fill:parent.fill
}



Row{
    anchors.top: parent.top
    anchors.topMargin: 20
    anchors.horizontalCenterOffset: -30
    anchors.horizontalCenter: parent.horizontalCenter
    spacing: 1



Item
{
    id:stop
    height:300
    width:300
    x:0
    y:50



Button
{
    width:200
    text:"stopwatch"
    id:rectangleButton
    onClicked: {
        //loader.left=parent.left
        loader.source="stopwatch.qml"
    }

}
}
Item {
    id: start
    height:300
    width:300
    x:350
    y:50
    anchors.leftMargin: 400



Button
{
    width:200
    text:"timer"
    id:squareButton
    onClicked: {
        //loader.right=parent.right
        loader.source="timer.qml"


    }

}
}

}
}

