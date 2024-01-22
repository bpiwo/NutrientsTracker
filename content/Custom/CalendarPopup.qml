import QtQuick
import QtQuick.Controls

Popup {

    width: 400
    height: 400

    background: Rectangle {
        color: Constants.backgroundColor
        border.color: Constants.accentColor
        radius: 10
    }

    DayOfWeekRow {
        locale: grid.locale

//        Layout.column: 1
//        Layout.fillWidth: true
    }

    ListView {
        id: listview

        width: 200; height: 200
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        highlightRangeMode: ListView.StrictlyEnforceRange

        model: CalendarModel {
            from: new Date(2015, 0, 1)
            to: new Date(2015, 11, 31)
        }

        delegate: MonthGrid {
            width: listview.width
            height: listview.height

            month: model.month
            year: model.year
//                locale: Qt.locale("en_US")
        }

        ScrollIndicator.horizontal: ScrollIndicator { }
    }
}
