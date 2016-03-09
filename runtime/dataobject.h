
#ifndef DATAOBJECT_H
#define DATAOBJECT_H

#include <QObject>

class DataObject : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString key READ key WRITE setKey NOTIFY keyChanged)
    Q_PROPERTY(QString value READ value WRITE setValue NOTIFY valueChanged)

public:
    DataObject(QObject *parent=0);
    DataObject(const QString &key, const QString &value, QObject *parent=0);

    QString key() const;
    void setKey(const QString &key);

    QString value() const;
    void setValue(const QString &value);

signals:
    void keyChanged();
    void valueChanged();

private:
    QString m_key;
    QString m_value;
};

#endif // DATAOBJECT_H
