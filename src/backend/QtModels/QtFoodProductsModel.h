#ifndef QTFOODPRODUCTSMODEL_H
#define QTFOODPRODUCTSMODEL_H

#include <QAbstractListModel>

#include "DBdata/FoodProduct.h"

class QtFoodProductsModel : public QAbstractListModel
{
    Q_OBJECT

    enum FoodProductRoles{
        Role_ID=Qt::UserRole,
        Role_Name,
        Role_Unit,
        Role_LastValue,
        Role_IsMeal,
        Role_MealID,
        Role_Carbohydrates,
        Role_Protein,
        Role_Fat,
        Role_Potasium,
        Role_Calcium
    };

public:
    QtFoodProductsModel();

    Q_INVOKABLE int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

    void setModelData(std::vector<FoodProduct> data);
private:
    std::vector<FoodProduct> m_foodProducts;
};

#endif // QTFOODPRODUCTSMODEL_H
