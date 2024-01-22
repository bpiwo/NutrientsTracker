// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick

ListModel {
    id: foodList

    ListElement {
        name: qsTr("Oat flakes")
        eaten: 50
        unit: "g"
        baseAmount: 100
        carbohydrates: 60
        protein: 8
        fat: 2
        }
    ListElement {
        name: qsTr("Milk")
        eaten: 50
        unit: "ml"
        baseAmount: 100
        carbohydrates: 8
        protein: 8
        fat: 4
    }
    ListElement {
        name: qsTr("Beef")
        amount: 230
        unit: "g"
        baseAmount: 100
        carbohydrates: 8
        protein: 30
        fat: 15
    }
}
