import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Hello World")
    Item {
        width: 200
        height: 150

        ListModel {
            id: model
        }

        ListView {
            id: listview
            anchors.fill: parent
            model: model
            delegate: Text {
                text: jsondata
            }
        }

        function getData() {
            var xmlhttp = new XMLHttpRequest();
            var url = "https://samplechat.firebaseio-demo.com/users/jack/name.json";

            xmlhttp.onreadystatechange=function() {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    myFunction(xmlhttp.responseText);
                }
            }
            xmlhttp.open("GET", url, true);
            xmlhttp.send();
        }

        function myFunction(json) {
            var obj = JSON.parse(json);
            listview.model.append( {jsondata: obj.first +" "+ obj.last })
        }

        Button {
            anchors.bottom: parent.bottom
            width: parent.width
            text: "GET Data"
            onClicked: getData()
        }
    }
}
