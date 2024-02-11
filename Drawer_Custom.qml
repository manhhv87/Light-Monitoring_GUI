import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
Drawer {
    id: root
    width: parent.width * 1/2
    height: parent.height
    Column {
        anchors.fill: parent
        spacing: 10
        Rectangle {
            width: parent.width
            height: 70
            border {
                width: 3
                color: "Black"
            }
            Text {
                anchors.centerIn: parent
                font {
                    pointSize: 25
                    bold: true
                }
                text: "OPTION"
            }
        }
        Button {
            width: parent.width
            height: 50
            text: "Resume"
            onClicked: {
                root.close()
            }
        }
        Button {
            width: parent.width
            height: 50
            text: "Exit"
            onClicked: {
                user_exit.open()
            }
        }
    }
    Dialog {
        id: user_exit
        anchors.centerIn: parent
        title: "Exit program"
        Text {
            text: "Do you really want to quit?"
        }
        standardButtons: Dialog.Yes| Dialog.No
        onAccepted: {
            Qt.quit()
        }
    }
}

