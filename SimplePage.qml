import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Page{
    id: root
    property alias buttonText: navButton.text
    signal buttonClicked()

    ListModel{
        id:titleModel
    }

    GridView {
        id: viewTitle
        anchors.topMargin: 55
        anchors.leftMargin: 10
        anchors.centerIn: parent
        anchors.fill: parent
        model: titleModel
        cellWidth: 300; cellHeight: 350

        delegate: Rectangle{
            color: "#00FF00"
            width: 230; height: 330
            Image {
                source: image
                width: 225; height: 325
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: { stack.push(page2) }
            }
        }

        Component.onCompleted: {
            getApi();
        }
    }

    Button{
        id: navButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: {
            root.buttonClicked()
        }
    }


}
