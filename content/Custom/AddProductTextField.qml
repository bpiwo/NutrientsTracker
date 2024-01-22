import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import "../"

TextField {
    id: root
    font.pixelSize: 18
    font.weight: 600
    font.family: "Titillium Web"
    color: Constants.primaryTextColor
    placeholderTextColor: "grey"
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 35
        radius: 3
        color: "transparent"
        border.color: root.focus ? Constants.accentColor : "transparent"
    }
    cursorDelegate: Rectangle {
        id: cursor
        visible: false
        color: Constants.accentColor
        width: 2

        SequentialAnimation {
            loops: Animation.Infinite
            running: root.cursorVisible

            PropertyAction {
                target: cursor
                property: 'visible'
                value: true
            }

            PauseAnimation {
                duration: 500
            }

            PropertyAction {
                target: cursor
                property: 'visible'
                value: false
            }

            PauseAnimation {
                duration: 500
            }

            onStopped: {
                cursor.visible = false
            }
        }
    }
}
