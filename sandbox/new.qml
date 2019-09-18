import QtQuick 2.5

Rectangle {
  width: 1200
  height: 720
  color: "pink"

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
}