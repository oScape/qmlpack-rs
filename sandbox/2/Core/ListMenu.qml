import QtQuick 2.1

FocusScope {
    clip: true

    onActiveFocusChanged: {
        if (activeFocus)
            mainView.state = "showListViews"
    }

    ListView {
        id: list1
        y: activeFocus ? 10 : 40; width: parent.width / 3; height: parent.height - 20
        focus: true
        KeyNavigation.up: gridMenu; KeyNavigation.left: contextMenu; KeyNavigation.right: list2
        model: 10; cacheBuffer: 200
        delegate: ListViewDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

    ListView {
        id: list2
        y: activeFocus ? 10 : 40; x: parseInt(parent.width / 3); width: parent.width / 3; height: parent.height - 20
        KeyNavigation.up: gridMenu; KeyNavigation.left: list1; KeyNavigation.right: list3
        model: 10; cacheBuffer: 200
        delegate: ListViewDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

    ListView {
        id: list3
        y: activeFocus ? 10 : 40; x: parseInt(2 * parent.width / 3); width: parent.width / 3; height: parent.height - 20
        KeyNavigation.up: gridMenu; KeyNavigation.left: list2
        model: 10; cacheBuffer: 200
        delegate: ListViewDelegate {}

        Behavior on y {
            NumberAnimation { duration: 600; easing.type: Easing.OutQuint }
        }
    }

    Rectangle { width: parent.width; height: 1; color: "#D1DBBD" }

    Rectangle {
        y: 1; width: parent.width; height: 10
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#3E606F" }
            GradientStop { position: 1.0; color: "transparent" }
        }
    }

    Rectangle {
        y: parent.height - 10; width: parent.width; height: 10
        gradient: Gradient {
            GradientStop { position: 1.0; color: "#3E606F" }
            GradientStop { position: 0.0; color: "transparent" }
        }
    }
}
