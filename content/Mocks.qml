import QtQuick 6.2

Item {
    readonly property var foodList: foodList

    ListModel {
        id: foodList

        ListElement {
            name: qsTr("Food 1")
        }
        ListElement {
            name: qsTr("Food 2")
        }
        ListElement {
            name: qsTr("Food 3")
        }
        ListElement {
            name: qsTr("Food 4")
        }
    }
}
