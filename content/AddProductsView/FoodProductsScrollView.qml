import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "FoodProductItem"

ScrollView {
    id: scrollView

    clip: true
    contentWidth: availableWidth

    property alias model: repeater.model
    property alias columns: gridLayout.columns
    property alias gridWidth: gridLayout.width
    property alias gridHeight: gridLayout.height

    required property int delegatePreferredHeight
    required property int delegatePreferredWidth

    GridLayout {
        id: gridLayout

        columnSpacing: 24
        rowSpacing: 25

        Repeater {
            id: repeater

            FoodProductItem {
                id: roomItem

                Layout.preferredHeight: scrollView.delegatePreferredHeight
                Layout.preferredWidth: scrollView.delegatePreferredWidth
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }
}
