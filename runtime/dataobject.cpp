#include <QDebug>
#include "dataobject.h"

DataObject::DataObject(QObject *parent)
    : QObject(parent)
{
}

DataObject::DataObject(const QString &key, const QString &value, QObject *parent)
    : QObject(parent), m_key(key), m_value(value)
{
}

QString DataObject::key() const
{
    return m_key;
}

void DataObject::setKey(const QString &key)
{
    if (key != m_key) {
        m_key = key;
        emit keyChanged();
    }
}

QString DataObject::value() const
{
    return m_value;
}

void DataObject::setValue(const QString &value)
{
    if (value != m_value) {
        m_value = value;
        emit valueChanged();
    }
}
