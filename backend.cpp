#include "backend.h"
#include <string>
#define ADD_DEVICE 0
#define DATA_AVAILABLE 1
#define REMOVE_DEVICE 4
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
        else if(stringlist[0].toInt() == DATA_AVAILABLE && stringlist[1] != "" && stringlist[2] != "" && stringlist[3] != "")
        {
            emit dataAvailable(stringlist[1].toInt(), stringlist[2].toInt(), stringlist[3].toInt());
        }
        else if(stringlist[0].toInt() == REMOVE_DEVICE && stringlist[1] != "")
        {
            emit remove_device(stringlist[1].toInt());
            emit busyChanged(false);
        }
    }
    //   qDebug()<<rx_buffer;
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
