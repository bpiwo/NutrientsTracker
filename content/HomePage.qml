// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick

HomePageForm {

    Component.onCompleted: {
//        console.log("dddddddd", backend)
        backend.loadData();
//        console.log("dddddddd", backend.userName)
//        console.log("dddddddd", backend.foodProducts)
//        console.log("dddddddd", backend.eatenFood)
//        console.log("dddddddd", backend.dayEatenFood)
//        var fp = ["someName", "unit", 0, 0, 0, 0, 0, 0, 0, 0]
//        backend.addFoodProduct(fp);
    }
}
