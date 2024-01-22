#ifndef QTEATENFOODMODEL_H
#define QTEATENFOODMODEL_H

#include <QAbstractListModel>

#include "DBdata/FoodProduct.h"
#include "DBdata/EatenFood.h"

class QtEatenFoodModel : public QAbstractListModel
{
    Q_OBJECT

    enum EatenFoodRoles{
        Role_ID=Qt::UserRole,
        Role_Date,
        Role_ProductID,
        Role_Amount,
        Role_IsPartOfMeal,
        Role_MealID,
        Role_FoodProduct_Name,
        Role_FoodProduct_Unit,
        Role_FoodProduct_Carbohydrates,
        Role_FoodProduct_Protein,
        Role_FoodProduct_Fat,
        Role_FoodProduct_Potasium,
        Role_FoodProduct_Calcium
    };

public:
    QtEatenFoodModel();

    Q_INVOKABLE int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    Q_INVOKABLE QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

    void setFoodProducts(std::vector<FoodProduct> data);
    void setEatenFood(std::vector<EatenFood> data);
private:
    std::vector<EatenFood> m_eatenFood;
    std::vector<FoodProduct> m_foodProducts;

    std::optional<FoodProduct> FoodProductByID(const int ID) const;
};

#endif // QTEATENFOODMODEL_H
