#ifndef QTBACKEND_H
#define QTBACKEND_H

#include <memory.h>
#include <QObject>
#include <QSortFilterProxyModel>
#include "BackEnd.h"
#include "QtModels/QtFoodProductsModel.h"
#include "QtModels/QtEatenFoodModel.h"
#include "QtModels/QtDayFilterEatenFoodModel.h"

class QtBackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QtFoodProductsModel* foodProducts READ foodProducts NOTIFY foodProductsChanged)
    Q_PROPERTY(QtEatenFoodModel* eatenFood READ eatenFood NOTIFY eatenFoodChanged)
    Q_PROPERTY(QtDayFilterEatenFoodModel* dayEatenFood READ dayEatenFood NOTIFY dayEatenFoodChanged)
public:
    explicit QtBackEnd(QObject *parent = nullptr);

    Q_INVOKABLE void loadData();
    Q_INVOKABLE void addFoodProduct(const QVariantList& foodProductData);
    Q_INVOKABLE void addEatenFood(const QVariantList& foodProductData);
    Q_INVOKABLE void resetSourceModel();

    QtFoodProductsModel* foodProducts();
    QtEatenFoodModel* eatenFood();
    QtDayFilterEatenFoodModel* dayEatenFood();

signals:
    void foodProductsChanged();
    void eatenFoodChanged();
    void dayEatenFoodChanged();

private:
    std::unique_ptr<BackEnd> m_backend;

    QSharedPointer<QtFoodProductsModel> m_foodProductsModel;
    QSharedPointer<QtEatenFoodModel> m_eatenFoodModel;
    QSharedPointer<QtDayFilterEatenFoodModel> m_dayEatenFoodModel;
};

#endif // QTBACKEND_H
