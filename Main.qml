import QtQuick
import QtQuick.Controls
import QtCharts
import QtQuick.Layouts

ApplicationWindow {
    width: screen.width //* 0.8
    height: screen.height //* 0.8
    visible: true
    title: qsTr("Light Monitoring System")
    header: Header_GUI {
        option.onClicked: {
            user_option.open()
        }
    }
    Drawer_Custom {id: user_option}

    background: Image {
        anchors.fill: parent
        source: "file://home/namubuntu/Desktop/Light_System/Lora.png"
    }
    ListModel {id: chart_model}
    Item {
        id: content
        visible: !sock_gui.visible
        anchors.fill: parent
        Column {
            anchors.fill: parent
            Flickable {
                id: flickable
                width: parent.width
                height: parent.height * 0.95
                contentWidth: light.implicitWidth
                contentHeight: light.implicitHeight
                flickableDirection: Flickable.HorizontalFlick
                Row {
                    id: light
                    spacing: 1
                    anchors.fill: parent
                    Repeater {
                        id: wrap_device
                        model: chart_model
                        delegate: Loader {
                            sourceComponent: Node_GUI {
                                width: flickable.width
                                height: flickable.height
                                node_id: model.node_id
                            }
                        }
                    }
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                height: parent.height *0.05
                TextField {
                    id: entry_id
                    width: parent.width *1/2
                    height: parent.height
                    focus: true
                    placeholderText: "Device ID"
                }
                Button {
                    width: parent.width *1/4
                    height: parent.height
                    text: "Add Device"
                    onClicked: {
                        if(entry_id.text !== "")
                        {
                            Backend.request_add_device(entry_id.text)
                            entry_id.text = ""
                        }
                    }
                }
                Button {
                    width: parent.width *1/4
                    height: parent.height
                    text: "Remove Device"
                    onClicked: {
                        if(entry_id.text !== "")
                        {
                            Backend.request_remove_device(entry_id.text)
                            entry_id.text = ""
                        }
                    }
                }
            }
        }
    }
    Socket_GUI {
        id: sock_gui
        visible: true
        anchors.fill: parent
    }

    function add_device(new_id)
    {
        if(new_id === "")
        {
            console.log("Please Enter New ID!");
            return -1;
        }
        for(var i = 0; i < chart_model.count; i++)
        {
            if(chart_model.get(i).node_id === new_id)
            {
                console.log("Device existed!")
                return -1;
            }
        }
        chart_model.append({ node_id: new_id })
        return 0;
    }
    function remove_device(device_id)
    {
        if(device_id === "")
        {
            console.log("Please Enter Node ID!");
            return -1;
        }
        for(var i = 0; i < chart_model.count; i++)
        {
            if(chart_model.get(i).node_id === device_id)
            {
                chart_model.remove(i)
                return 0;
            }
        }
        console.log("Device ID is not existed!")
    }

    Connections {
        target: Backend

        function onAdd_device(id)
        {
            if(add_device(id.toString()))
                return -1;
            return 0;
        }

        function onRemove_device(id)
        {
            if(remove_device(id.toString()))
                return -1;
            return 0;
        }

        function onDataAvailable(id, sensor, illuminance, voltage, current)
        {
            for(var i = 0; i < chart_model.count; i++)
            {
                if(chart_model.get(i).node_id === id.toString())
                {
                    for(var j = 0; j < wrap_device.itemAt(i).item.illuminance.count - 1; j++)
                    {
                        wrap_device.itemAt(i).item.illuminance.replace(j, j, wrap_device.itemAt(i).item.illuminance.at(j+1).y);
                        wrap_device.itemAt(i).item.intensity.replace(j, j, wrap_device.itemAt(i).item.intensity.at(j+1).y);
                        wrap_device.itemAt(i).item.sourceVoltage.replace(j, j, wrap_device.itemAt(i).item.sourceVoltage.at(j+1).y);
                        wrap_device.itemAt(i).item.sourceCurrent.replace(j, j, wrap_device.itemAt(i).item.sourceCurrent.at(j+1).y);
                        console.log("Replace "+j)
                    }
                    wrap_device.itemAt(i).item.illuminance.replace(wrap_device.itemAt(i).item.illuminance.count -1, 9,  illuminance);
                    wrap_device.itemAt(i).item.intensity.replace(wrap_device.itemAt(i).item.intensity.count -1, 9, sensor);
                    wrap_device.itemAt(i).item.sourceVoltage.replace(wrap_device.itemAt(i).item.sourceVoltage.count -1, 9, voltage);
                    wrap_device.itemAt(i).item.sourceCurrent.replace(wrap_device.itemAt(i).item.sourceCurrent.count -1, 9, current);
                    break;
                }
            }
        }

        function onStatusChanged(id, status)
        {
            for(var i = 0; i < chart_model.count; i++)
            {
                if(chart_model.get(i).node_id === id.toString())
                {
                    if(status === true)
                    {
                        wrap_device.itemAt(i).item.color_s = "Green";
                        wrap_device.itemAt(i).item.connect_s = "Stable Connection";
                    }
                    else
                    {
                        wrap_device.itemAt(i).item.color_s = "Red";
                        wrap_device.itemAt(i).item.connect_s = "Disonnected";
                    }

                    break;
                }
            }
        }

        function onModeChanged(id, currentMode)
        {
            for(var i = 0; i < chart_model.count; i++)
            {
                if(chart_model.get(i).node_id === id.toString())
                {
                    if(currentMode)
                    {
                        wrap_device.itemAt(i).item.getMode = "AUTO"
                    }
                    else
                    {
                        wrap_device.itemAt(i).item.getMode = "MANUAL"
                    }
                    break;
                }
            }
        }

        function onBusyChanged(status)
        {
            loading.running = status
        }
    }
    BusyIndicator {
        id: loading
        width: 200
        height: 200
        anchors.centerIn: parent
        running: false
        visible: running
        Text {
            text: qsTr("Please wait...!")
            anchors.centerIn: parent
            font {
                pointSize: 20
                bold: true
            }
        }
    }
}
