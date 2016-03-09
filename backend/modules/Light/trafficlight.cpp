#include <QPainter>
#include <QRadialGradient>

#include "trafficlight.h"

TrafficLight::TrafficLight(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
}

QColor TrafficLight::color() const
{
    return m_color;
}

void TrafficLight::setColor(const QColor &color)
{
    if ( color == m_color )
        return;
    else {
        m_color = color;
        update();   // repaint with the new color
        emit colorChanged();
    }
}

void TrafficLight::paint(QPainter *painter)
{
    QRectF rect(boundingRect());

    QPen pen;
    pen.setWidthF( 0 );
    pen.setColor(m_color);
    painter->setPen( pen );

    QRadialGradient g( rect.width()/2, rect.height()/2,
                       rect.width()/2, rect.width()/2, height()/2 );

    g.setColorAt( 0.0, Qt::white );
    g.setColorAt( 1.0, m_color );
    painter->setBrush( g );

    painter->drawEllipse(rect);
}
