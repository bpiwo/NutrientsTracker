// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause


/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "AddProductsView"

Pane {
    id: root

    leftPadding: 20
    rightPadding: 20
    bottomPadding: 15

    property alias addButton: addFoodProductButton
    property int currentRoomIndex: 0
    required property var foodList

    background: Rectangle {
        color: Constants.backgroundColor
    }

    Column {
        id: title

        width: parent.width

        Label {
            id: header

            text: qsTr("Add products")
            font: Constants.desktopTitleFont
            color: Constants.primaryTextColor
            elide: Text.ElideRight
        }

        RowLayout {
            id: label
            width: parent.width

            Label {
                text: qsTr("Add new product or meal")
                font: Constants.desktopSubtitleFont
                color: Constants.accentTextColor
                elide: Text.ElideRight
                Layout.fillWidth: true
            }

//            CustomComboBox {
//                id: comboBox
//                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
//                model: roomsList
//                currentIndex: root.currentRoomIndex
//                onCurrentIndexChanged: root.currentRoomIndex = currentIndex
//            }
        }
    }

    Button {
        id: addFoodProductButton

        anchors.top: parent.top
        anchors.right: parent.right
        width: 200
        Material.background: "#1c8c51"
        text: "Add product or meal"
    }

    FoodProductsScrollView {
        id: scrollView

        anchors.top: title.bottom
        anchors.topMargin: 30

        width: internal.contentWidth
        height: internal.contentHeight
        gridWidth: internal.contentWidth
        gridHeight: internal.contentHeight

        delegatePreferredWidth: internal.delegatePreferredWidth
        delegatePreferredHeight: internal.delegatePreferredHeight

        columns: root.width < 1140 ? 1 : 2
        model: backend.foodProducts
    }

//    StatisticsStackView {
//        id: scrollView

//        anchors.top: title.bottom
//        anchors.topMargin: 12
//        anchors.leftMargin: 28

//        width: internal.contentWidth
//        height: internal.contentHeight
//        isOneColumn: internal.isOneColumn

//        model: roomsList
//        currentRoomIndex: root.currentRoomIndex
//    }

//    StatisticsSwipeView {
//        id: swipeView

//        anchors.top: title.bottom

//        model: roomsList

//        width: internal.contentWidth
//        height: internal.contentHeight
//        isOneColumn: internal.isOneColumn

//        currentRoomIndex: root.currentRoomIndex
//        onCurrentRoomIndexChanged: root.currentRoomIndex = currentRoomIndex
//        visible: false
//    }


    QtObject {
        id: internal

        readonly property int contentHeight: root.height - title.height
                                             - root.topPadding - root.bottomPadding
        readonly property int contentWidth: root.width - root.rightPadding - root.leftPadding
        property int delegatePreferredHeight: 276
        property int delegatePreferredWidth: 530
    }

    states: [
        State {
            name: "desktopLayout"
            when: Constants.isBigDesktopLayout || Constants.isSmallDesktopLayout
            PropertyChanges {
                target: header
                font.pixelSize: 48
                font.weight: 600
                font.family: "Titillium Web"
            }
            PropertyChanges {
                target: label
                visible: true
            }
            PropertyChanges {
                target: root
                leftPadding: 20
            }
//            PropertyChanges {
//                target: scrollView
//                visible: true
//            }
//            PropertyChanges {
//                target: swipeView
//                visible: false
//            }
        },
        State {
            name: "mobileLayout"
            when: Constants.isMobileLayout
            PropertyChanges {
                target: header
                font.pixelSize: 24
                font.weight: 600
                font.family: "Titillium Web"
            }
            PropertyChanges {
                target: label
                visible: false
            }
            PropertyChanges {
                target: root
                leftPadding: 16
                rightPadding: 16
            }
            PropertyChanges {
                target: scrollView
                visible: false
            }
            PropertyChanges {
                target: swipeView
                visible: true
            }
        },
        State {
            name: "smallLayout"
            when: Constants.isSmallLayout
            PropertyChanges {
                target: header
                visible: false
            }
            PropertyChanges {
                target: label
                visible: false
            }
            PropertyChanges {
                target: root
                leftPadding: 15
                rightPadding: 15
                topPadding: 3
            }
            PropertyChanges {
                target: scrollView
                visible: false
            }
            PropertyChanges {
                target: swipeView
                visible: true
            }
        }
    ]
}
