import QtQuick 2.5

Rectangle {
  property alias name: myButton.name
  width: 200
  height: 300
  color: "green"

  Button {
    id: myButton
    anchors.centerIn: parent
  }
}