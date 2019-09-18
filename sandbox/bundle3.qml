import QtQuick 2.5

Rectangle {
  width: 1200
  height: 720
  color: "pink"

  Row {
    anchors.fill: parent
    spacing: 30

    Rectangle {
      width: 200
      height: 300
      color: "green"

      Rectangle {
        anchors.centerIn: parent
        width: 100
        height: 50
        color: "blue"
      
        Text {
          text: "Bill Smith"
          color: "white"
          anchors.centerIn: parent
        }
      }
    }

    Rectangle {
      width: 200
      height: 300
      color: "green"

      Rectangle {
        anchors.centerIn: parent
        width: 100
        height: 50
        color: "blue"
      
        Text {
          text: "John Brown"
          color: "white"
          anchors.centerIn: parent
        }
      }
    }

    Rectangle {
      width: 200
      height: 300
      color: "green"

      Rectangle {
        anchors.centerIn: parent
        width: 100
        height: 50
        color: "blue"
      
        Text {
          text: "Sam Wise"
          color: "white"
          anchors.centerIn: parent
        }
      }
    }
  }
}
