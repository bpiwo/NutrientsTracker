import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import "../"
import "../Custom"

Popup {
    id: root

    width: 400
    height: 400

    background: Rectangle {
        color: Constants.backgroundColor
        border.color: Constants.accentColor
        radius: 10
    }

    property var foodProductsModel
    property var date
    property int amount
    property int productID

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Label {
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.preferredHeight: 30
            text: "Select product"
            font.pixelSize: !root.isSmallLayout ? 24 : 18
            font.weight: 600
            font.family: "Titillium Web"
            color: Constants.primaryTextColor
        }

        ComboBox {
            id: foodProductBox

            Layout.alignment: Qt.AlignTop
            Layout.columnSpan: 1
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            displayText: ""

            model: foodProductsModel

            background: Rectangle {
                width: parent.width
                height: 80
                color: Constants.accentColor
                radius: 10
            }

            delegate: ItemDelegate {

                width: foodProductBox.width
                height: 40

                background: Rectangle {
                    anchors.fill: parent
                    color: Constants.accentColor
                    radius: 10
                }

                Label
                {
                    anchors.centerIn: parent
                    text: model.name
                    color: "white"
                    font.pixelSize: !root.isSmallLayout ? 24 : 18
                    font.weight: 600
                    font.family: "Titillium Web"
                }
                onClicked: {
                    foodProductBox.displayText = model.name
                    root.productID = model.ID
                }
            }

            contentItem: Text {
                    leftPadding: 20

                    text: foodProductBox.displayText
                    font.pixelSize: !root.isSmallLayout ? 24 : 18
                    font.weight: 600
                    font.family: "Titillium Web"
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideLeft
            }

            popup.background: Rectangle {
                anchors.fill: parent
                color: Constants.accentColor
                radius: 10
            }
        }

        GridLayout {
            id: inputBoxesLayout

            Layout.alignment: Qt.AlignTop
            columns: 2
            rowSpacing: 5
            columnSpacing: 30

            Label {
                text: "Amount"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter amount"

                onTextChanged: amount = text
            }


        }

        Rectangle {
            id: fillHeight
            color: "transparent"
            Layout.preferredHeight: 100
        }

        RowLayout {
            Layout.alignment: Qt.AlignBottom
            Layout.columnSpan: 1
            spacing: 20

            Button {
                id: cancelButton
                implicitWidth: 100
                Material.background: "#1c8c51"
                text: "Cancel"
                onClicked: root.close()
            }

            Button {
                id: addButton
                Layout.fillWidth: true
                Material.background: "#1c8c51"
                text: "Add product"
                onClicked: {
                    var ef = [root.date, root.productID, root.amount, 0, 0]
                    backend.addEatenFood(ef);
                    root.close()
                }
            }

        }
    }
}
