#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTcpSocket>
#include <QDebug>
class Backend : public QObject
{
    Q_OBJECT
public:
    ~Backend()
    {
        send_socket("exit");
        socket->close();
        qDebug()<<"Destructor called!";
        delete socket;
    }
    explicit Backend(QObject *parent = nullptr);
    Q_INVOKABLE void socket_request_connect(const QString &server_ip, QString server_port);
    void read_socket(void);
    void send_socket(QString tx_buffer);
    Q_INVOKABLE void request_add_device(QString dev_id);
    Q_INVOKABLE void request_remove_device(QString dev_id);
private:
    QTcpSocket *socket;
signals:
    void connectionChanged(bool status);
    void add_device(int id);
    void dataAvailable(int id, int sensor, int power);
    void remove_device(int id);
    void busyChanged(bool status);
};

#endif // BACKEND_H
