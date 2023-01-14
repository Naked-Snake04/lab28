import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 1000
    height: 800
    title: qsTr("Movies")


    ListModel{
        id: listModel
    }
Rectangle{
    color: "#484A4A"
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
                         Image {
                             source: image.url
                             width: 225; height: 325
                         }
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
            radius: 10
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
                xhr.open("GET", "https://online-movie-database.p.rapidapi.com/title/v2/find?title=a&titleType=movie&limit=20&sortArg=moviemeter%2Casc")
                else
                xhr.open("GET", "https://online-movie-database.p.rapidapi.com/title/v2/find?title="+ textfield.text +"&titleType=movie&limit=20&sortArg=moviemeter%2Casc");
                xhr.setRequestHeader("X-RapidAPI-Key", "c2b15c3a8emsh8012b14720d4e22p1b7c46jsnac86ccc53ad5");
                xhr.setRequestHeader("X-RapidAPI-Host", "online-movie-database.p.rapidapi.com");

                xhr.send(data);
            }

            function loaded(json){
                listModel.clear()
                for ( var index in json.results) {
                listModel.append({
                                     "title": json.results[index]["title"],
                                     "year": json.results[index]["year"],
                                     "image": json.results[index]["image"]
                                 })
                }
            }
}

