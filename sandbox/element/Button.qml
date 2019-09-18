import QtQuick 2.5

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