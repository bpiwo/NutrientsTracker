// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import "AddProductsView"

AddProductsViewForm {
    addButton.onClicked: {
        addProductPopup.open()
    }

    AddProductPopup {
        id: addProductPopup

        modal: true
    }
}



