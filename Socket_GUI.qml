import QtQuick
import QtQuick.Controls
Item {
    id: root
    Image {
        anchors.fill: parent
        source: "file://home/namubuntu/Desktop/Light_System/a.jpg"
    }
    Column {
        anchors.centerIn: parent
        width: parent.width
        spacing: 10
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Light Monitoring System"
            font {
                bold: true
                pointSize: 30
            }
        }
        TextField {
            id: ip_v4
            width: parent.width /2
            height: 50
            placeholderText: "IP Address"
            anchors.horizontalCenter: parent.horizontalCenter
            text: "192.168.1.162"
        }
        TextField {
            id: port
            width: parent.width /2
            height: 50
            placeholderText: "Port number"
            anchors.horizontalCenter: parent.horizontalCenter
            text: "2000"
        }
        Button {
            id: connect_socket
            width: port.width
            height: port.height
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Connect"
            onClicked: {
                request_to_connect(ip_v4.text, port.text)
            }
        }
        Text {
            id: connect_status
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Status"
            font {
                italic: true
                pointSize: 15
            }
        }
    }
    function request_to_connect(ip, port)
    {
        Backend.socket_request_connect(ip, port);
        return 0;
    }
    Connections {
        target: Backend
        function onConnectionChanged(status)
        {
            if(status === true)
            {
                connect_status.text = "Status"
                connect_status.color = "Black"
                root.visible = false
            }
            else
            {
                connect_status.text = "Connection failure!"
                connect_status.color = "Red"
                root.visible = true
            }
            return 0;
        }
    }
}
