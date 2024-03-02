import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
Drawer {
    id: root
    width: parent.width * 1/2
    height: parent.height
    property string title_color: "Yellow"
    onClosed: {
        id_to_view.text = "";
        id_show.text = "";
        mode_show.text = "";
        ill_show.text = "";
        light_show.text = "";
        voltage_show.text = "";
        current_show.text = "";
        status_show.text = "";
    }

    Rectangle {
        anchors.fill: parent
        //color: "Pink"
        Column {
            anchors.fill: parent
            spacing: 10
            Rectangle {
                width: parent.width
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                color: title_color
                border {
                    width: 3
                    color: "black"
                }
                Text {
                    anchors.centerIn: parent
                    font {
                        pointSize: 20
                        bold: true
                    }
                    text: "Manual Setting"
                }
                ToolButton {
                    id: tool_button
                    anchors.right: parent.right
                    width: 45
                    height: 45
                    icon.source: "file:///home/namubuntu/Desktop/Light_System/images.png"
                    onClicked: {
                        root.close()
                    }
                }
            }
            Text {
                font {
                    pointSize: 15
                    bold: true
                }
                text: "Set illuminance 0%"
            }
            Row {
                width: parent.width
                height: 40
                spacing: 3
                TextField {
                    id: h_start_0
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "6"
                }
                Text {
                    id: foo
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_start_0
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "0"
                }
                Text {
                    id: to
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: "to"
                }
                TextField {
                    id: h_stop_0
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "17"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_stop_0
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "59"
                }
            }

            Text {
                font {
                    pointSize: 15
                    bold: true
                }
                text: "Set illuminance 50%"
            }
            Row {
                width: parent.width
                height: 40
                spacing: 3
                TextField {
                    id: h_start_50
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "18"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_start_50
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "0"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: "to"
                }
                TextField {
                    id: h_stop_50
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "18"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_stop_50
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "59"
                }
            }

            Text {
                font {
                    pointSize: 15
                    bold: true
                }
                text: "Set illuminance 75%"
            }
            Row {
                width: parent.width
                height: 40
                spacing: 3
                TextField {
                    id: h_start_75
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "19"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_start_75
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "0"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: "to"
                }
                TextField {
                    id: h_stop_75
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "21"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_stop_75
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "59"
                }
            }

            Text {
                font {
                    pointSize: 15
                    bold: true
                }
                text: "Set illuminance 100%"
            }
            Row {
                width: parent.width
                height: 40
                spacing: 3
                TextField {
                    id: h_start_100
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "22"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_start_100
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "0"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: "to"
                }
                TextField {
                    id: h_stop_100
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 24"
                    text: "5"
                }
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    font {
                        pointSize: 15
                    }
                    text: ":"
                }
                TextField {
                    id: m_stop_100
                    width: (parent.width - (2*foo.width) - to.width - 20)/4
                    height: parent.height
                    placeholderText: "0 - 60"
                    text: "59"
                }
            }
            Rectangle {
                width: parent.width
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                color: title_color
                border {
                    width: 3
                    color: "black"
                }
                Text {
                    anchors.centerIn: parent
                    font {
                        pointSize: 20
                        bold: true
                    }
                    text: "Control Device"
                }
            }
            Row {
                width: parent.width
                TextField {
                    id: id_to_set
                    width: parent.width *0.6
                    height: 50
                    placeholderText: "Device ID"
                }
                Button {
                    width: parent.width *0.2
                    height: 50
                    text: "Manual"
                    onClicked: {
                        Backend.setMode_Manual(id_to_set.text, h_start_0.text, m_start_0.text, h_stop_0.text, m_stop_0.text,
                                               h_start_50.text, m_start_50.text, h_stop_50.text, m_stop_50.text,
                                               h_start_75.text, m_start_75.text, h_stop_75.text, m_stop_75.text,
                                               h_start_100.text, m_start_100.text, h_stop_100.text, m_stop_100.text);
                    }
                }
                Button {
                    width: parent.width *0.2
                    height: 50
                    text: "Auto"
                    onClicked: {
                        Backend.setMode_Auto(id_to_set.text)
                    }
                }
            }
            Rectangle {
                width: parent.width
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                color: title_color
                border {
                    width: 3
                    color: "black"
                }
                Text {
                    anchors.centerIn: parent
                    font {
                        pointSize: 20
                        bold: true
                    }
                    text: "Searching Device"
                }
            }
            Row {
                width: parent.width
                TextField {
                    id: id_to_view
                    width: parent.width *0.8
                    height: 50
                    placeholderText: "Device ID"
                }
                Button {
                    width: parent.width *0.2
                    height: 50
                    text: "View Data"
                    onClicked: {
                        var finding_flag = false
                        for(var i = 0; i < chart_model.count; i++)
                        {
                            if(parseInt(chart_model.get(i).node_id) === parseInt(id_to_view.text))
                            {
                                id_show.text = "NODE ID: " + id_to_view.text
                                mode_show.text = "MODE: " + wrap_device.itemAt(i).item.getMode
                                ill_show.text = "Illuminance: " + wrap_device.itemAt(i).item.illuminance.at(9).y
                                light_show.text = "Light Sensor: "+ wrap_device.itemAt(i).item.intensity.at(9).y
                                voltage_show.text = "Source Voltage: " + wrap_device.itemAt(i).item.sourceVoltage.at(9).y
                                current_show.text = "Source Current: " + wrap_device.itemAt(i).item.sourceCurrent.at(9).y
                                status_show.text = "Status: " + wrap_device.itemAt(i).item.connect_s
                                finding_flag = true
                                break;
                            }
                        }
                        if(!finding_flag)
                        {
                            id_show.text = "";
                            mode_show.text = "";
                            ill_show.text = "";
                            light_show.text = "";
                            voltage_show.text = "";
                            current_show.text = "";
                            status_show.text = "";
                            console.log("Node not found!")
                        }
                    }
                }
            }
            Text {
                id: id_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
                color: "red"
            }
            Text {
                id: mode_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
            }
            Text {
                id: light_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
            }
            Text {
                id: ill_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
            }
            Text {
                id: voltage_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
            }
            Text {
                id: current_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
            }
            Text {
                id: status_show
                anchors.horizontalCenter: parent.horizontalCenter
                font {
                    pointSize: 20
                    bold: true
                }
            }
        }
    }
}
