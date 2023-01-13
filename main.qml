import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MyModule 1.0


Window {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("Hello World")

    Parsing{
        id: parsing
    }
    Text {
        id: name
        text: parsing.getValuet()
    }
}
