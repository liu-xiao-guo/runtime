#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QProcessEnvironment>
#include <QQmlContext>
#include <QDebug>

#include "dataobject.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Try to get all of the env variables here
    QProcessEnvironment environment = QProcessEnvironment::systemEnvironment();

    QStringList keys = environment.keys();

    QList<QObject*> dataList;

    foreach (QString key, keys) {
        qDebug() << "key: " << key;

        QString value = environment.value(key);
        qDebug() << "value: " << value;

        dataList.append(new DataObject(key, value));
    }

    QQuickView view;
    view.setSource(QUrl(QStringLiteral("qrc:///Main.qml")));
    view.setResizeMode(QQuickView::SizeRootObjectToView);

    QQmlContext *ctxt = view.rootContext();
    ctxt->setContextProperty("varModel", QVariant::fromValue(dataList));

    view.show();
    return app.exec();
}

