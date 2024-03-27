#include "fileio.h"
#include "upnpmanager.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
// #include <QSplashScreen>

int
main(int argc, char* argv[]) {
    // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
    app.setApplicationName("demon-presentation-board");
    app.setOrganizationName("waterbear");
    // QQuickStyle::setStyle("material");
    // QLocale::setDefault(QLocale(QLocale::English, QLocale::UnitedStates));

    UpnpManager upnpmanager;
    upnpmanager.handleSearch = true;

    QQmlApplicationEngine engine;

    FileIO fileio;
    if(argc>1){
        fileio.setOpenFilePaht(QString(argv[1]));
    }
    engine.rootContext()->setContextProperty("fileio", &fileio);
    engine.rootContext()->setContextProperty("upnp", &upnpmanager);

    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app, &QApplication::quit);

    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/DPBEditor/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
