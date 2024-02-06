#include "backend.h"
#include <string>
#define ADD_DEVICE 0
#define DATA_AVAILABLE 1
Backend::Backend(QObject *parent)
    : QObject{parent}, socket(new QTcpSocket(this))
{
    connect(socket, &QTcpSocket::readyRead, this, &Backend::read_socket);
    qDebug()<<"Constructor called!";
}

void Backend::socket_request_connect(const QString &server_ip, QString server_port)
{
    int port_no = server_port.toInt();
    QObject::connect(socket, &QAbstractSocket::connected, this, [=]() {
        emit connectionChanged(true);
    });
    QObject::connect(socket, &QAbstractSocket::errorOccurred, this, [=]() {
        emit connectionChanged(false);
    });
    socket->connectToHost(server_ip, port_no);
    qDebug()<<"Connect function called!";
}

void Backend::read_socket(void)
{
    QStringList stringlist;
    stringlist.clear();
    QString rx_buffer = socket->readAll();
    stringlist = rx_buffer.split(" ");
    if(stringlist[0].toInt() == ADD_DEVICE && stringlist[1] != "")
    {
        emit add_device(stringlist[1].toInt());
    }
    else if(stringlist[0].toInt() == DATA_AVAILABLE && stringlist[1] != "" && stringlist[2] != "" && stringlist[3] != "")
    {
        emit dataAvailable(stringlist[1].toInt(), stringlist[2].toInt(), stringlist[3].toInt());
    }
}

void Backend::send_socket(QString tx_buffer)
{
    socket->write(tx_buffer.toUtf8());
}
