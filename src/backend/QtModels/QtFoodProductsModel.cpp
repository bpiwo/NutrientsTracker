#include "QtFoodProductsModel.h"
#include <QDebug>

QtFoodProductsModel::QtFoodProductsModel()
{

}

int QtFoodProductsModel::rowCount(const QModelIndex &parent) const
{
    return m_foodProducts.size();
}

QVariant QtFoodProductsModel::data(const QModelIndex &index, int role) const
{
    if(rowCount() > index.row()) {
        auto fp = m_foodProducts.at(index.row());
        switch(role) {
        case Role_ID:
            return fp.ID;
        case Role_Unit:
            return QString::fromStdString(fp.unit);
        case Role_Name:
            return QString::fromStdString(fp.name);
        case Role_Carbohydrates:
            return fp.carbohydrates;
        case Role_Protein:
            return fp.protein;
        case Role_Fat:
            return fp.fat;
        case Role_Calcium:
            return fp.calcium;
        case Role_Potasium:
            return fp.potasium;
        }
    }
    return QVariant();
}

QHash<int, QByteArray> QtFoodProductsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Role_ID] = "ID";
    roles[Role_Unit] = "unit";
    roles[Role_Name] = "name";
    roles[Role_Carbohydrates] = "carbohydrates";
    roles[Role_Protein] = "protein";
    roles[Role_Fat] = "fat";
    roles[Role_Calcium] = "calcium";
    roles[Role_Potasium] = "potasium";
    return roles;
}

void QtFoodProductsModel::setModelData(std::vector<FoodProduct> data)
{
    beginResetModel();
    m_foodProducts = data;
    endResetModel();
}

