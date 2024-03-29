import QtQuick
import QtQuick.Controls
Rectangle {
    property alias option: tool_button
        id: title_prj
        width: parent.width
        height: 70
        border {
            width: 2
            color: "Black"
        }
        ToolButton {
            id: tool_button
            width: 50
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "file:///home/namubuntu/Desktop/Light_System/drawer.png"
        }

        Row {
            height: parent.height
            width: parent.width / 3
            anchors.centerIn: parent
            Image {
                y: 2
                width: 66
                height: 66
                source: "file:///home/namubuntu/Desktop/Light_System/uet_logo.png"
            }
            Column {
                y: 10
                width: parent.width - 70
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Vietnam National University, Hanoi"
                    font {
                        family: "Timenewsroman"
                        pointSize: 15
                        bold: true
                    }
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("University of Engineering and Technology")
                    font {
                        family: "Arial"
                        pointSize: 13
                    }
                }
            }
        }
    }
