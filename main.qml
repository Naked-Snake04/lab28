import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Movies")

    Grid {
        id: grid
        rows: 6
        columns: 2
        anchors.centerIn: parent
        spacing: 8
        Text {
            id: stateLabel
            text: "Title: "
            font.pixelSize: 16
        }
        Text {
            id: stateText
            text: ""
            font.pixelSize: 16
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
                    stateText.text = "%1".arg(json.title);
                    print(xhr.responseText)
                }
            }

            xhr.open("GET", "https://online-movie-database.p.rapidapi.com/title/get-videos?tconst=tt0944947&limit=25&region=US");
            xhr.setRequestHeader("X-RapidAPI-Key", "c2b15c3a8emsh8012b14720d4e22p1b7c46jsnac86ccc53ad5");
            xhr.setRequestHeader("X-RapidAPI-Host", "online-movie-database.p.rapidapi.com");

            xhr.send(data);
        }

        Component.onCompleted: {
            getApi();
        }
    }


}
