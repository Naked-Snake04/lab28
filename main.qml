import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Movies")

    ListModel{
        id: listModel
    }

    ListView {
        id: view
        anchors.centerIn: parent
        anchors.fill: parent
        model: listModel
        delegate: Rectangle{
            width:parent.width
                     height:80
                     Text {
                     text: title + "\n" + year
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

            xhr.open("GET", "https://online-movie-database.p.rapidapi.com/title/v2/find?title=a&titleType=movie&limit=20&sortArg=moviemeter%2Casc&releaseDateMin=2023-01-01&releaseDateMax=2023-01-16");
            xhr.setRequestHeader("X-RapidAPI-Key", "c2b15c3a8emsh8012b14720d4e22p1b7c46jsnac86ccc53ad5");
            xhr.setRequestHeader("X-RapidAPI-Host", "online-movie-database.p.rapidapi.com");

            xhr.send(data);
        }

        function loaded(json){
            for ( var index in json.results) {
            listModel.append({
                                 "title": json.results[index]["title"],
                                 "year": json.results[index]["year"]
                             })
            }
        }
        Component.onCompleted: {
            getApi();
        }

    }
}
