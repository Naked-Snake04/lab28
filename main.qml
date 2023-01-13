import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "parse.js" as JS

Window {
    visible: true
    width: 380
    height: 640
    title: qsTr("Hello World")

    Component.onCompleted: JS.load()


    ListModel {  id:listModel }

    ListView {
        id:view
        anchors.fill:parent
        model : listModel
        delegate: Rectangle {
             width:parent.width
             height:80
             Text {
             anchors.centerIn: parent
             text: title
             }

        }
    }
}
