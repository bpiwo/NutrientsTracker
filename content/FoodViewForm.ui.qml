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
import "FoodView/"

Pane {
    id: root

    topPadding: 4
    leftPadding: 27
    rightPadding: 27
    bottomPadding: 13

    property alias addEatenFoodButton: addFoodEaten
    property alias openCalendarButton: openCalendar
    property alias listModel: scrollView.model
    property alias dateText: heading2.text
    required property var foodList

    background: Rectangle {
        anchors.fill: parent
        color: Constants.backgroundColor
    }

    Column {
        id: title

        width: internal.contentWidth

        Label {
            id: heading2

            text: qsTr("What did you eat today?")
            font.pixelSize: 24
            font.weight: 600
            font.family: "Titillium Web"
            color: Constants.accentTextColor
            elide: Text.ElideRight
        }
    }

    Button {
        id: openCalendar

        anchors.top: parent.top
        anchors.right: addFoodEaten.left
        anchors.rightMargin: 10
        width: 50
        height: 50
        Image{
            anchors.centerIn: parent
            source: "qrc:/content/images/calendar.svg"
            width: 30
            height: 30
        }
        background: Rectangle {
            color: openCalendar.hovered ?  "#105230" : "transparent"
            radius: 3
        }
    }

    Button {
        id: addFoodEaten

        anchors.top: parent.top
        anchors.right: parent.right
        width: 200
        Material.background: "#1c8c51"
        text: "Add item"
    }

    FoodScrollView {
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
        model: foodList
    }

//    RoomsSwipeView {
//        id: swipeView

//        anchors.top: title.bottom
//        anchors.topMargin: 5
//        anchors.left: parent.left
//        anchors.right: parent.right

//        width: internal.contentWidth
//        height: internal.contentHeight
//        delegatePreferredHeight: internal.delegatePreferredHeight
//        delegatePreferredWidth: internal.delegatePreferredWidth

//        model: foodList
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
//            PropertyChanges {
//                target: heading
//                text: qsTr("Welcome")
//                font: Constants.desktopTitleFont
//            }
            PropertyChanges {
                target: heading2
                visible: true
            }
            PropertyChanges {
                target: scrollView
                visible: true
            }
//            PropertyChanges {
//                target: swipeView
//                visible: false
//            }
            PropertyChanges {
                target: internal
                delegatePreferredHeight: 276
                delegatePreferredWidth: 530
            }
            PropertyChanges {
                target: root
                leftPadding: 27
            }
        },
        State {
            name: "mobileLayout"
            when: Constants.isMobileLayout
            PropertyChanges {
                target: heading
                text: qsTr("Rooms")
                font: Constants.mobileTitleFont
            }
            PropertyChanges {
                target: heading2
                visible: false
            }
            PropertyChanges {
                target: scrollView
                visible: true
            }
            PropertyChanges {
                target: swipeView
                visible: false
            }
            PropertyChanges {
                target: internal
                delegatePreferredHeight: 177
                delegatePreferredWidth: 306
            }
            PropertyChanges {
                target: root
                leftPadding: 27
            }
        },
        State {
            name: "smallLayout"
            when: Constants.isSmallLayout
            PropertyChanges {
                target: heading
                text: qsTr("Rooms")
                font: Constants.smallTitleFont
            }
            PropertyChanges {
                target: heading2
                visible: false
            }
            PropertyChanges {
                target: scrollView
                visible: false
            }
            PropertyChanges {
                target: swipeView
                visible: true
            }
            PropertyChanges {
                target: internal
                delegatePreferredHeight: 177
                delegatePreferredWidth: 340
            }
            PropertyChanges {
                target: root
                leftPadding: 11
            }
        }
    ]
}
