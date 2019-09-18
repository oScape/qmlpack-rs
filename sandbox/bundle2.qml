import QtQuick 2.5

Rectangle {
  width: 1200
  height: 720
  color: "pink"

  ListView {
    anchors.fill: parent
    spacing: 30
    orientation: ListView.Horizontal
    model: ListModel {
      ListElement {
          name: "Bill Smith"
      }
      ListElement {
          name: "John Brown"
      }
      ListElement {
          name: "Sam Wise"
      }
    }
    delegate: Rectangle {
      property alias name: myButton.name
      width: 200
      height: 300
      color: "green"

      Rectangle {
        property alias name: myText.text
        width: 100
        height: 50
        color: "blue"
      
        Text {
          id: myText
          text: "hello world"
          color: "white"
          anchors.centerIn: parent
        }
      }
    }
  }
}