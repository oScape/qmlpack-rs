import QtQuick 2.1
import "Core"

Rectangle {
    id: window

    width: 800; height: 640
    color: "#3E606F"

    FocusScope {
        id: mainView

        width: parent.width; height: parent.height
        focus: true

        TabMenu {
            id: tabMenu
            y: 160; width: parent.width; height: 160

            focus: true
            activeFocusOnTab: true
        }

        GridMenu {
            id: gridMenu
            y: 320; width: parent.width; height: 320
            activeFocusOnTab: true
        }

        ListMenu {
            id: listMenu
            y: 640; width: parent.width; height: 320
            activeFocusOnTab: true
        }

        Rectangle {
            id: shade
            anchors.fill: parent
            color: "black"
            opacity: 0
        }

        states:  [
            State {
                name: "showTabViews"
                PropertyChanges { target: tabMenu; y:  160 }
                PropertyChanges { target: gridMenu; y: 320 }
                PropertyChanges { target: listMenu; y: 640 }
            },

            State {
                name: "showGridViews"
                PropertyChanges { target: tabMenu; y:    0 }
                PropertyChanges { target: gridMenu; y: 160 }
                PropertyChanges { target: listMenu; y: 480 }
            },

            State {
                name: "showListViews"
                PropertyChanges { target: tabMenu; y: -160 }
                PropertyChanges { target: gridMenu; y: 0 }
                PropertyChanges { target: listMenu; y: 320 }
            }
        ]

        transitions: Transition {
            NumberAnimation { properties: "y"; duration: 600; easing.type: Easing.OutQuint }
        }
    }

    Image {
        source: "Core/images/arrow.png"
        rotation: 90
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            anchors.fill: parent; anchors.margins: -10
            onClicked: contextMenu.focus = true
        }
    }

    ContextMenu { id: contextMenu; x: -265; width: 260; height: parent.height }

    states: State {
        name: "contextMenuOpen"
        when: !mainView.activeFocus
        PropertyChanges { target: contextMenu; x: 0; open: true }
        PropertyChanges { target: mainView; x: 130 }
        PropertyChanges { target: shade; opacity: 0.25 }
    }

    transitions: Transition {
        NumberAnimation { properties: "x,opacity"; duration: 600; easing.type: Easing.OutQuint }
    }
}
