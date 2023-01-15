import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Page{
    id: root
    property alias buttonText: navButton.text
    signal buttonClicked()

    background: Rectangle{
        color: "#484A4A"
    }

    Grid {
        id: grid
        rows: 7
        columns: 2
        x: 300
        y: 50
        leftPadding: 50
        spacing: 8
        Text {
            id: titleLabel
            color: "white"
            text: "Title:"
            font.pixelSize: 16
        }
        Text {
            id: titleText
            color: "white"
            text: ""
            font.pixelSize: 16
        }
        Text {
            id: yearLabel
            color: "white"
            text: "Year:"
            font.pixelSize: 16
        }
        Text {
            id: yearText
            color: "white"
            text: ""
            font.pixelSize: 16
        }
        Text {
            id: plotLabel
            color: "white"
            text: "Plot:"
            font.pixelSize: 16
        }
        Text {
            id: plotText
            color: "white"
            text: ""
            font.pixelSize: 16
            width: 500
            wrapMode: Text.WordWrap
        }
        Text {
            id: directorLabel
            color: "white"
            text: "Director:"
            font.pixelSize: 16
        }
        Text {
            id: directorText
            color: "white"
            text: ""
            font.pixelSize: 16
        }
        Text {
            id: runtimeLabel
            color: "white"
            text: "Runtime:"
            font.pixelSize: 16
        }
        Text {
            id: runtimeText
            color: "white"
            text: ""
            font.pixelSize: 16
        }
        Text {
            id: genreLabel
            color: "white"
            text: "Genre:"
            font.pixelSize: 16
        }
        Text {
            id: genreText
            color: "white"
            text: ""
            font.pixelSize: 16
        }
        Text {
            id: actorsLabel
            color: "white"
            text: "Actors:"
            font.pixelSize: 16
        }
        Text {
            id: actorsText
            color: "white"
            text: ""
            font.pixelSize: 16
        }
}

    Button{
        id: navButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: {
            root.buttonClicked()
        }
        background: Rectangle  {
            color: "#8A8A8A"
        }

    }

    Image {
        anchors.leftMargin: 10
        id: image
        source: ""
        width: 325; height: 525
    }

    function getApiDetails() {
        const data = null;

        var xhr = new XMLHttpRequest();
        xhr.responseType = 'json';
        xhr.onreadystatechange = function() {
            if(xhr.readyState === XMLHttpRequest.DONE) {
                print('DONE')
                var json = JSON.parse(xhr.responseText)
                titleText.text = "%1".arg(json["Title"]);
                yearText.text = "%1".arg(json["Year"]);
                plotText.text = "%1".arg(json["Plot"]);
                directorText.text = "%1".arg(json["Director"]);
                runtimeText.text = "%1".arg(json["Runtime"]);
                genreText.text = "%1".arg(json["Genre"]);
                actorsText.text = "%1".arg(json["Actors"]);
                image.source = "%1".arg(json["Poster"]);
                print(xhr.responseText)
            }
        }
        xhr.open("GET", "http://www.omdbapi.com/?apikey=f35af11c&t=Avatar&type=movie");
        //xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send(data);
    }

    Component.onCompleted: {
        getApiDetails()
    }
}
