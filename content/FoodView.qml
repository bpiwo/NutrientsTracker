// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQml 2.0
import QtQuick
import "Custom/"
import "Calendar/"
import "FoodView/"

FoodViewForm {

    addEatenFoodButton.onClicked: {
        addEatenFoodPopup.open()
    }

    openCalendarButton.onClicked: {
        calendarPopup.open()
    }

    CalendarDialog {
        id: calendarPopup

        onAccepted: {
            var formattedDay = ("0" + selected_day).slice(-2);
            var formattedMonth = ("0" + selected_month).slice(-2);
            var dateStr = formattedDay + "/" + formattedMonth + "/" + selected_year
            var chosenDate = Date.fromLocaleDateString(Qt.locale(), dateStr, Locale.ShortFormat)
            dateText = "Date: " + chosenDate.toLocaleDateString(Locale.LongFormat)
            backend.dayEatenFood.setDate(chosenDate)
            addEatenFoodPopup.date = chosenDate
        }
    }

    Component.onCompleted: {
        dateText = "Date: " + new Date().toLocaleDateString(Locale.LongFormat)
        listModel = backend.dayEatenFood
    }

    AddEatenFoodPopup {
        id: addEatenFoodPopup
        date: new Date()
        modal: true
        foodProductsModel: backend.foodProducts
    }
}
