#include "json_parsing.h"

#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonValue>
#include <QJsonParseError>

json_parsing::json_parsing(QObject *parent)
    : QObject{parent}
{
        QString val;
        QFile file;
        file.setFileName("test.json");
        file.open(QIODevice::ReadOnly | QIODevice::Text);
        val = file.readAll();
        file.close();

        QJsonDocument doc = QJsonDocument::fromJson(val.toUtf8());
        QJsonObject json = doc.object();
        QString str = json["hello"].toString();
        bool t = json["t"].toBool();
        bool f = json["f"].toBool();
        bool n = json["n"].toBool();
        int  i = json["i"].toInt();
        double pi = json["pi"].toDouble();
        QJsonArray ar = json["a"].toArray();
        QList <QVariant> at = ar.toVariantList();
}

bool json_parsing::getValuet(){
    return t;
}
