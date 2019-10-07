import QtQuick 2.1

FocusScope {
    onActiveFocusChanged: {
        if (activeFocus)
            mainView.state = "showTabViews"
    }

    Rectangle {
        anchors.fill: parent
        clip: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#193441" }
            GradientStop { position: 1.0; color: Qt.darker("#193441") }
        }

        Row {
            id: tabView
            anchors.fill: parent; anchors.leftMargin: 20; anchors.rightMargin: 20
            Repeater {
                activeFocusOnTab: false
                model: 5
                Item {
                    id: container
                    width: 152; height: 152
                    activeFocusOnTab: true
                    focus: true

                    KeyNavigation.up: listMenu
                    KeyNavigation.down: gridMenu

                    Rectangle {
                        id: content
                        color: "transparent"
                        antialiasing: true
                        anchors.fill: parent; anchors.margins: 20; radius: 10

                        Rectangle { color: "#91AA9D"; anchors.fill: parent; anchors.margins: 3; radius: 8; antialiasing: true }
                        Image { source: "images/qt-logo.png"; anchors.centerIn: parent }
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            container.forceActiveFocus()
                        }
                    }

                    states: State {
                        name: "active"; when: container.activeFocus
                        PropertyChanges { target: content; color: "#FCFFF5"; scale: 1.1 }
                    }

                    transitions: Transition {
                        NumberAnimation { properties: "scale"; duration: 100 }
                    }
                }
            }
        }
    }
}
