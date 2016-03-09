#ifndef TRAFFICLIGHT_H
#define TRAFFICLIGHT_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>

class TrafficLight : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)

public:
    explicit TrafficLight(QQuickItem *parent = 0);
    void paint(QPainter *painter);

    QColor color() const;
    void setColor(const QColor &color);

signals:
    void colorChanged();

public slots:

private:
    QColor m_color;
};

#endif // TRAFFICLIGHT_H
