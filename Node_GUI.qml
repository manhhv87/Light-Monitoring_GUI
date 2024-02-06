import QtQuick
import QtCharts
Item {
    id: root
    property alias node_width: root.width
    property alias node_height: root.height
    property alias node_id: sensor_t.name
    property alias working_power: working
    property alias intensity: sensor_t
    Column {
        anchors.fill: parent
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            height: parent.height *1/2 - 15
            border {
                width: 3
                color: "Black"
            }
            ChartView {
                id: light_intensity
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
            height: parent.height *1/2 -15
            border {
                width: 3
                color: "Black"
            }
            ChartView {
                id: status_power
                title: "Working status charts"
                anchors.fill: parent
                ValuesAxis {
                    id: power_limit
                    min: 0
                    max: 100
                }
                LineSeries {
                    id: working
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
                    axisY: power_limit
                }
            }
        }
        Rectangle {
            id: connect_status
            width: parent.width
            height: 30
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
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
