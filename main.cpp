#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "backend.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon("/home/namubuntu/Desktop/Light_System/uet_logo.png"));
    QQmlApplicationEngine engine;
    Backend newbackend;

    engine.rootContext()->setContextProperty("Backend", &newbackend);
    const QUrl url(u"qrc:/Light_System/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
