#include "QtBackEnd.h"
#include <QDebug>

#include "HelpersQtToCpp.h"

QtBackEnd::QtBackEnd(QObject *parent)
    : QObject{parent}
{
    qRegisterMetaType<QtFoodProductsModel*>();
    qRegisterMetaType<QtEatenFoodModel*>();
    qRegisterMetaType<QtDayFilterEatenFoodModel*>();

    m_backend = std::make_unique<BackEnd>();
    m_foodProductsModel = QSharedPointer<QtFoodProductsModel>::create();
    m_eatenFoodModel = QSharedPointer<QtEatenFoodModel>::create();
    m_dayEatenFoodModel = QSharedPointer<QtDayFilterEatenFoodModel>::create();
//    m_dayEatenFoodModel->setFilterRole(m_dayEatenFoodModel->roleNames().key("date"));
}

void QtBackEnd::loadData()
{
    m_backend->loadDBData();
    m_foodProductsModel->setModelData(m_backend->foodProducts());
    m_eatenFoodModel->setFoodProducts(m_backend->foodProducts());
    m_eatenFoodModel->setEatenFood(m_backend->eatenFood());
    emit foodProductsChanged();
    emit eatenFoodChanged();
    m_dayEatenFoodModel->setSourceModel(m_eatenFoodModel.get());
    emit dayEatenFoodChanged();
}

void QtBackEnd::addFoodProduct(const QVariantList &foodProductData)
{
    qDebug() << "Add food product";
    auto foodProduct = HelpersQtToCpp::QVariantListToFoodProduct(foodProductData);
    m_backend->addFoodProduct(foodProduct);
    loadData();
}

void QtBackEnd::addEatenFood(const QVariantList &eatenFoodData)
{
    qDebug() << "Add eaten food";
    auto eatenFood = HelpersQtToCpp::QVariantListToEatenFood(eatenFoodData);
    m_backend->addEatenFood(eatenFood);
    loadData();
}

void QtBackEnd::resetSourceModel()
{
    m_dayEatenFoodModel->setSourceModel(m_eatenFoodModel.get());
}

QtFoodProductsModel *QtBackEnd::foodProducts()
{
    return m_foodProductsModel.get();
}

QtEatenFoodModel *QtBackEnd::eatenFood()
{
    return m_eatenFoodModel.get();
}

QtDayFilterEatenFoodModel *QtBackEnd::dayEatenFood()
{
    return m_dayEatenFoodModel.get();
}

