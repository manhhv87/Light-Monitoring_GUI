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
        //send_socket("exit");
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
    Q_INVOKABLE void setMode_Auto(QString dev_id);
    Q_INVOKABLE void setMode_Manual(QString dev_id, QString h_start_0, QString h_stop_0, QString m_start_0, QString m_stop_0, QString h_start_50, QString h_stop_50, QString m_start_50, QString m_stop_50, QString h_start_75, QString h_stop_75, QString m_start_75, QString m_stop_75, QString h_start_100, QString h_stop_100, QString m_start_100, QString m_stop_100);
private:
    QTcpSocket *socket;
signals:
    void connectionChanged(bool status);
    void add_device(int id);
    void dataAvailable(int id, int sensor, int illuminance, float voltage, float current);
    void remove_device(int id);
    void modeChanged(int id, bool mode);
    void busyChanged(bool status);
    void statusChanged(int id, bool status);
};

#endif // BACKEND_H
