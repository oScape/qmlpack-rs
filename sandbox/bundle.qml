import QtQuick 2.5

Rectangle {
  width: 1200
  height: 720
  color: "pink"

  Component {
    id: abc
    
    Rectangle {
      property alias name: abc_loader.item

      width: 200
      height: 300
      color: "green"

      Loader {
        id: abc_loader
        // property var name: name
        sourceComponent: def
        anchors.centerIn: parent
      }

      Connections {
        target: abc_loader.Rectangle
        name
      }
    } 
  }

  Component {
    id: def
    signal getParameters(string n)

    Rectangle {
      property var name: "hello world"
      width: 100
      height: 50
      color: "blue"
    
      Text {
        id: jkl
        text: name
        color: "white"
        anchors.centerIn: parent
      }

    }
  }

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
    delegate: Loader {
      sourceComponent: abc
      onLoaded: {
        item.name = model.name
      }
    }
  }
}