import QtQuick
import QtQuick.Controls

import "../../"

Column {
    id: root

    property string labelText: ""
    property double showValue: 0
    property string valueUnit: ""
    spacing: 3

    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        text: root.labelText
        font.pixelSize: 12
        font.weight: 400
        font.family: "Titillium Web"
        color: Constants.accentTextColor
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        height: 24
        color: "#105230"
        radius: 4

        Label {
            anchors.centerIn: parent
            text: root.showValue + " " + valueUnit
            font.pixelSize: 16
            font.weight: 600
            font.family: "Titillium Web"
            color: Constants.accentTextColor
        }
    }
}

