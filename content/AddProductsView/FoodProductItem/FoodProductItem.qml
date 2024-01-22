import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import "../../"

Pane {
    id: root

    property bool isSmallLayout: false

//    property alias isEnabled: toggle.checked
//    property alias toggle: toggle

    required property string name
    property double eaten: 100
    required property string unit
    property int baseAmount: 100
    required property double carbohydrates
    required property double protein
    required property double fat
//    required property var model

    width: internal.width
    height: internal.height

    topPadding: 12
    leftPadding: internal.leftPadding
    bottomPadding: 0
    rightPadding: 16

    background: Rectangle {
        radius: 12
        color: Constants.accentColor
    }

    RowLayout {
        id: header

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: internal.switchMargin
        spacing: 10

//        Item {
//            Layout.preferredWidth: internal.iconSize
//            Layout.preferredHeight: internal.iconSize
//            Layout.alignment: Qt.AlignTop

//            Image {
//                id: icon

//                source: "images/" + root.iconName
//                sourceSize.width: internal.iconSize
//                sourceSize.height: internal.iconSize
//            }

//            MultiEffect {
//                anchors.fill: icon
//                source: icon
//                colorization: 1
//                colorizationColor: Constants.iconColor
//            }
//        }

        Column {
            id: title

            Layout.fillWidth: true
            spacing: internal.titleSpacing

            Label {
                text: root.name
                font.pixelSize: !root.isSmallLayout ? 24 : 18
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.primaryTextColor
            }
        }

//        CustomSwitch {
//            id: toggle
//            checked: root.active
//            onCheckedChanged: model.active = toggle.checked
//        }
        Button {
//            Layout.alignment: Qt.AlignRight
            text: "Product Info"
        }

        Button {
            id: editButton
            width: 30
            height: 30
            icon.color: "white"
            icon.source: "qrc:/content/images/edit.svg"
            background: Rectangle {
                color: editButton.hovered ?  "#105230" : "transparent"
                radius: 3
            }
        }

        Button {
            id: removeButton
            width: 30
            height: 30
            icon.color: "white"
            icon.source: "qrc:/content/images/bin.svg"
            background: Rectangle {
                color: removeButton.hovered ?  "#105230" : "transparent"
                radius: 3
            }
        }
    }

    RowLayout {
        id: macroData

        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.leftMargin: !root.isSmallLayout ? 24 : 0
        anchors.topMargin: 12
        anchors.rightMargin: !root.isSmallLayout ? 24 : 0
        spacing: 20

        MacroMicroDataColumn {
            id: carbohydratesInfo

            width: internal.macroColumnWidth
            labelText: !root.isSmallLayout ? "Carbohydrates" : "Carbs"
            showValue: root.carbohydrates * root.eaten / root.baseAmount
            valueUnit: "g"
        }

        MacroMicroDataColumn {
            id: proteinInfo

            width: internal.macroColumnWidth
            labelText: !root.isSmallLayout ? "Protein" : "Prot."
            showValue: root.protein * root.eaten / root.baseAmount
            valueUnit: "g"
        }

        MacroMicroDataColumn {
            id: fatInfo

            width: internal.macroColumnWidth
            labelText: "Fat"
            showValue: root.fat * root.eaten / root.baseAmount
            valueUnit: "g"
        }
    }

//    RowLayout {
//        id: microData

//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        anchors.rightMargin: !root.isSmallLayout ? 24 : 0
//    }

    Rectangle {
        id: separator

        anchors.bottom: summary.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: "#DCDCDC"
    }

    Rectangle {
        id: summary

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        height: 40

        RowLayout {
            id: summaryLayout

            anchors.fill: parent
            Layout.alignment: Qt.AlignVCenter

    // Add some code to check values per 100g/ml in popups

            Label {
                Layout.alignment: Qt.AlignVCenter

                text: "Calories sum: "
                font.pixelSize: 20
                font.weight: 400
                font.family: "Titillium Web"
                color: Constants.accentTextColor
            }

            Label {
                Layout.alignment: Qt.AlignVCenter

                text: internal.caloriesSum + " / 100" + root.unit
                font.pixelSize: 20
                font.weight: 600
                font.family: "Titillium Web"
                color: Constants.accentTextColor
            }
        }
    }

    QtObject {
        id: internal

        property int width: 530
        property int height: 276
        property int rightMargin: 60
        property int leftPadding: 16
        property int titleSpacing: 8
        property int spacing: 16
        property int columnMargin: 7
        property int iconSize: 34
        property int switchMargin: 9
        property int macroColumnWidth: 80

        property double carbsEaten: root.carbohydrates * root.eaten / root.baseAmount
        property double proteinEaten: root.protein * root.eaten / root.baseAmount
        property double fatEaten: root.fat * root.eaten / root.baseAmount

        property double carbsCaloriesEaten: carbsEaten * 4
        property double proteinCaloriesEaten: proteinEaten * 4
        property double fatCaloriesEaten: fatEaten * 9

        property double caloriesSum: carbsCaloriesEaten + proteinCaloriesEaten + fatCaloriesEaten
    }

    states: [
        State {
            name: "desktopLayout"
            when: Constants.isBigDesktopLayout || Constants.isSmallDesktopLayout
            PropertyChanges {
                target: root
                isSmallLayout: false
            }
            PropertyChanges {
                target: internal
                width: 530
                height: 276
                rightMargin: 53
                leftPadding: 16
                spacing: 16
                titleSpacing: 8
                columnMargin: 7
                iconSize: 34
                switchMargin: 9
            }
        },
        State {
            name: "mobileLayout"
            when: Constants.isMobileLayout
            PropertyChanges {
                target: internal
                width: 306
                height: 177
                rightMargin: 12
                leftPadding: 8
                spacing: 6
                titleSpacing: 4
                columnMargin: 17
                iconSize: 24
                switchMargin: 2
            }
            PropertyChanges {
                target: root
                isSmallLayout: true
            }
        },
        State {
            name: "smallLayout"
            when: Constants.isSmallLayout
            PropertyChanges {
                target: root
                isSmallLayout: true
            }
            PropertyChanges {
                target: internal
                width: 340
                height: 177
                rightMargin: 34
                leftPadding: 8
                spacing: 3
                titleSpacing: 2
                columnMargin: 7
                iconSize: 24
                switchMargin: 9
            }
        }
    ]
}
