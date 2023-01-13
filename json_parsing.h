#ifndef JSON_PARSING_H
#define JSON_PARSING_H

#include <QObject>

class json_parsing : public QObject
{
    Q_OBJECT
private:
    bool t;
public:
    explicit json_parsing(QObject *parent = nullptr);
    Q_INVOKABLE bool getValuet();
signals:

};

#endif // JSON_PARSING_H
