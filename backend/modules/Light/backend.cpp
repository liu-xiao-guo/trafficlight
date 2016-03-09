#include <QtQml>
#include <QtQml/QQmlContext>
#include "backend.h"
#include "mytype.h"
#include "trafficlight.h"
#include "piechart.h"

void BackendPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("Light"));

    qmlRegisterType<MyType>(uri, 1, 0, "MyType");
    qmlRegisterType<TrafficLight>(uri, 1, 0, "TrafficLight");
}

void BackendPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}

