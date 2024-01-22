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

    property string name
    property string unit
    property int carbohydrates
    property int protein
    property int fat
    property int potasium
    property int calcium

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            id: inputBoxesLayout

            columns: 2
            rowSpacing: 5
            columnSpacing: 30

            Label {
                text: "Name"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter name"

                onTextChanged: name = text
            }

            Text {
                text: "Unit"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter unit - g or ml"

                onTextChanged: unit = text
            }

            Text {
                text: "Carbohydrates"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter carbohydrates"

                onTextChanged: carbohydrates = text
                validator: IntValidator {bottom: 1; top: 100}
            }

            Text {
                text: "Protein"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter protein"

                onTextChanged: protein = text
                validator: IntValidator {bottom: 1; top: 100}
            }

            Text {
                text: "Fat"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter fat"

                onTextChanged: fat = text
                validator: IntValidator {bottom: 1; top: 100}
            }

            Text {
                text: "Potasium"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter potasium"

                onTextChanged: carbohydrates = text
                validator: IntValidator {bottom: 1; top: 100}
            }

            Text {
                text: "Calcium"
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
            AddProductTextField {
                placeholderText: "Enter calcium"

                onTextChanged: calcium = text
                validator: IntValidator {bottom: 1; top: 100}
            }

        }

        RowLayout {
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
                    var fp = [root.name, root.unit, 0, 0, 0, root.carbohydrates,
                              root.protein, root.fat, root.potasium, root.calcium]
                    backend.addFoodProduct(fp);
                    root.close()
                }
            }

        }
    }
}
