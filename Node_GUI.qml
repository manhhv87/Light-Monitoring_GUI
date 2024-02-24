import QtQuick
import QtCharts
import QtQuick.Controls
Item {
    id: root
    property alias node_width: root.width
    property alias node_height: root.height
    property alias node_id: sensor_t.name
    property alias illuminance: illuminance
    property alias intensity: sensor_t
    property alias sourceVoltage: voltage
    property alias sourceCurrent: current
    property alias color_s: connect_status.color
    property alias connect_s: txt.text
    property alias getMode: cur_mode.text
    Column {
        anchors.fill: parent
        Row {
            width: parent.width
            height: parent.height -30
            Column {
                width: parent.width /2
                height: parent.height
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height *1/2
                    border {
                        width: 3
                        color: "Black"
                    }
                    ChartView {
                        title: "Light intensity charts"
                        anchors.fill: parent
                        ValuesAxis {
                            id: light_intensity_limit
                            min: 0
                            max: 4095
                        }
                        SplineSeries {
                            id: sensor_t
                            XYPoint {x: 0; y: 0}
                            XYPoint {x: 1; y: 0}
                            XYPoint {x: 2; y: 0}
                            XYPoint {x: 3; y: 0}
                            XYPoint {x: 4; y: 0}
                            XYPoint {x: 5; y: 0}
                            XYPoint {x: 6; y: 0}
                            XYPoint {x: 7; y: 0}
                            XYPoint {x: 8; y: 0}
                            XYPoint {x: 9; y: 0}
                            axisY: light_intensity_limit
                        }
                    }
                }
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height *1/2
                    border {
                        width: 3
                        color: "Black"
                    }
                    ChartView {
                        title: "Illuminance Chart"
                        anchors.fill: parent
                        ValuesAxis {
                            id: illuminance_limit
                            min: 0
                            max: 100
                        }
                        LineSeries {
                            id: illuminance
                            name: sensor_t.name
                            color: "Yellow"
                            XYPoint {x: 0; y: 0}
                            XYPoint {x: 1; y: 0}
                            XYPoint {x: 2; y: 0}
                            XYPoint {x: 3; y: 0}
                            XYPoint {x: 4; y: 0}
                            XYPoint {x: 5; y: 0}
                            XYPoint {x: 6; y: 0}
                            XYPoint {x: 7; y: 0}
                            XYPoint {x: 8; y: 0}
                            XYPoint {x: 9; y: 0}
                            axisY: illuminance_limit
                        }
                    }
                }
            }

            Column {
                width: parent.width /2
                height: parent.height
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height *1/2
                    border {
                        width: 3
                        color: "Black"
                    }
                    ChartView {
                        title: "Battery Voltage"
                        anchors.fill: parent
                        ValuesAxis {
                            id: voltage_limit
                            min: 0
                            max: 220
                        }
                        SplineSeries {
                            id: voltage
                            name: sensor_t.name
                            color: "Orange"
                            XYPoint {x: 0; y: 0}
                            XYPoint {x: 1; y: 0}
                            XYPoint {x: 2; y: 0}
                            XYPoint {x: 3; y: 0}
                            XYPoint {x: 4; y: 0}
                            XYPoint {x: 5; y: 0}
                            XYPoint {x: 6; y: 0}
                            XYPoint {x: 7; y: 0}
                            XYPoint {x: 8; y: 0}
                            XYPoint {x: 9; y: 0}
                            axisY: voltage_limit
                        }
                    }
                }
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    height: parent.height *1/2
                    border {
                        width: 3
                        color: "Black"
                    }
                    ChartView {
                        title: "Battery Current"
                        anchors.fill: parent
                        ValuesAxis {
                            id: current_limit
                            min: 0
                            max: 100
                        }
                        LineSeries {
                            id: current
                            name: sensor_t.name
                            color: "Brown"
                            XYPoint {x: 0; y: 0}
                            XYPoint {x: 1; y: 0}
                            XYPoint {x: 2; y: 0}
                            XYPoint {x: 3; y: 0}
                            XYPoint {x: 4; y: 0}
                            XYPoint {x: 5; y: 0}
                            XYPoint {x: 6; y: 0}
                            XYPoint {x: 7; y: 0}
                            XYPoint {x: 8; y: 0}
                            XYPoint {x: 9; y: 0}
                            axisY: current_limit
                        }
                    }
                }
            }
        }
        Row {
            width: parent.width
            height: 30
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                id: current_mode
                width: parent.width /2
                height: parent.height
                color: "Black"
                Text {
                    id: cur_mode
                    anchors.centerIn: parent
                    color: "Pink"
                    font {
                        pointSize: 20
                        bold: true
                    }
                    text: "Auto"
                }
            }
            Rectangle {
                id: connect_status
                width: parent.width /2
                height: parent.height
                color: "red"
                Text {
                    id: txt
                    anchors.centerIn: parent
                    font {
                        pointSize: 20
                        bold: true
                    }
                    text: "Disconnected"
                }
            }

        }
    }
}
