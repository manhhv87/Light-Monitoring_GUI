#include "backend.h"
#include <string>
#define ADD_DEVICE      0
#define DATA_AVAILABLE  1
#define REMOVE_DEVICE   4
#define DISCONNECTED    5
#define MODE_MANUAL     6
#define MODE_AUTO       7
Backend::Backend(QObject *parent)
    : QObject{parent}, socket(new QTcpSocket(this))
{
    connect(socket, &QTcpSocket::readyRead, this, &Backend::read_socket);
    qDebug()<<"Constructor called!";
}

void Backend::socket_request_connect(const QString &server_ip, QString server_port)
{
    QString connectt = "Client say Hello!";
    int port_no = server_port.toInt();
    QObject::connect(socket, &QAbstractSocket::connected, this, [=]() {
        emit connectionChanged(true);
        emit busyChanged(false);
    });
    QObject::connect(socket, &QAbstractSocket::errorOccurred, this, [=]() {
        emit connectionChanged(false);
        emit busyChanged(false);
    });
    socket->connectToHost(server_ip, port_no);
    qDebug()<<"Connect function called!";
    socket->write(connectt.toUtf8());
    emit busyChanged(true);
}

void Backend::read_socket(void)
{
    QStringList stringlist;
    stringlist.clear();
    QString rx_buffer = socket->readAll();
    if(rx_buffer == "Failed")
    {
        emit busyChanged(false);
    }
    else
    {
        stringlist = rx_buffer.split(" ");
        if(stringlist[0].toInt() == ADD_DEVICE && stringlist[1] != "")
        {
            emit add_device(stringlist[1].toInt());
            emit busyChanged(false);
        }
        else if(stringlist[0].toInt() == DATA_AVAILABLE && stringlist[1] != "" && stringlist[2] != "" && stringlist[3] != "" && stringlist[4] != "" && stringlist[5] != "" && stringlist[6] != "")
        {
            emit dataAvailable(stringlist[1].toInt(), stringlist[2].toInt(), stringlist[3].toInt(), stringlist[4].toFloat(), stringlist[5].toFloat());
            if(stringlist[6].toInt() == MODE_AUTO)
                emit modeChanged(stringlist[1].toInt(), true);
            else if(stringlist[6].toInt() == MODE_MANUAL)
                emit modeChanged(stringlist[1].toInt(), false);
            emit statusChanged(stringlist[1].toInt(), true);
        }
        else if(stringlist[0].toInt() == REMOVE_DEVICE && stringlist[1] != "")
        {
            emit remove_device(stringlist[1].toInt());
            emit busyChanged(false);
        }
        else if(stringlist[0].toInt() == DISCONNECTED && stringlist[1] != "")
        {
            emit statusChanged(stringlist[1].toInt(), false);
        }
    }
    //qDebug()<<rx_buffer;
}

void Backend::send_socket(QString tx_buffer)
{
    socket->write(tx_buffer.toUtf8());
}

void Backend::request_add_device(QString dev_id)
{
    QString to_send;
    to_send = QString::number(ADD_DEVICE) + " " + dev_id;
    send_socket(to_send);
    emit busyChanged(true);
}

void Backend::request_remove_device(QString dev_id)
{
    QString to_send;
    to_send = QString::number(REMOVE_DEVICE) + " " + dev_id;
    send_socket(to_send);
    emit busyChanged(true);
}

void Backend::setMode_Auto(QString dev_id)
{
    QString to_send;
    to_send = QString::number(MODE_AUTO) + " " + dev_id;
    send_socket(to_send);
    qDebug()<<"set "+dev_id+" to AUTO";
}

void Backend::setMode_Manual(QString dev_id, QString h_start_0, QString h_stop_0, QString m_start_0, QString m_stop_0, QString h_start_50, QString h_stop_50, QString m_start_50, QString m_stop_50, QString h_start_75, QString h_stop_75, QString m_start_75, QString m_stop_75, QString h_start_100, QString h_stop_100, QString m_start_100, QString m_stop_100)
{
    QString to_send;
    to_send = QString::number(MODE_MANUAL) + " " + dev_id + " " +h_start_0 + " " +h_stop_0 + " " + m_start_0 + " " + m_stop_0 + " " +h_start_50 + " " +h_stop_50 + " " + m_start_50 + " " + m_stop_50 + " " +h_start_75 + " " +h_stop_75 + " " + m_start_75 + " " + m_stop_75 + " " +h_start_100 + " " +h_stop_100 + " " + m_start_100 + " " + m_stop_100;
    send_socket(to_send);
    qDebug()<<to_send;
}
