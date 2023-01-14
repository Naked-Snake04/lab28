import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 1000
    height: 800
    title: qsTr("Movies")
color: "#484A4A"

    ListModel{
        id: listModel
    }

        GridView {
            id: view
            anchors.topMargin: 55
            anchors.leftMargin: 10
            anchors.centerIn: parent
            anchors.fill: parent
            model: listModel
            cellWidth: 300; cellHeight: 350


            delegate: Rectangle{
                color: "transparent"
                border.width: 5
                border.color: "#00FF00"
                Image {
                    source: image
                    width: 225; height: 325
                }
                Text {
                    id: text
                    text: title
                }
            }

            Component.onCompleted: {
                getApi();
            }
        }


    TextField
    {
        anchors.topMargin: 5
        color: "#FFFFFF"
        placeholderTextColor: "#FFFFFF"
        id: textfield
        width: 1000
        height: 50
        placeholderText: "Поиск"
        text: ""
        onTextChanged: getApi()

        background: Rectangle  {
            color: "#484A4A"
            //radius: 15
            border.width: 5
            border.color: "#00FF00"
        }
    }

    function getApi() {
        const data = null;

        const xhr = new XMLHttpRequest();
        xhr.responseType = 'json';
        xhr.withCredentials = true;

        xhr.onreadystatechange = function() {
            if(xhr.readyState === XMLHttpRequest.DONE) {
                print('DONE')
                var json = JSON.parse(xhr.responseText)
                print(xhr.responseText)
                loaded(json)
            }
        }
        textfield.text.replace(" ", "_");
        if (textfield.text == "")
            xhr.open("GET", "http://www.omdbapi.com/?apikey=f35af11c&s=ava&type=movie")
        else
            xhr.open("GET", "http://www.omdbapi.com/?apikey=f35af11c&s="+ textfield.text +"&type=movie");
        xhr.setRequestHeader("API-Key", "f35af11c");
        xhr.setRequestHeader("API-Host", "omdbapi.com");

        xhr.send(data);
    }

    function loaded(json){
        listModel.clear()
        for ( var index in json.Search) {
            listModel.append({
                                 "title": json.Search[index]["Title"],
                                 "year": json.Search[index]["Year"],
                                 "image": json.Search[index]["Poster"]
                             })
        }
    }
}

