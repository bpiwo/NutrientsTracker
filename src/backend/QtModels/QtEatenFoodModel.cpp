#include "QtEatenFoodModel.h"

#include <algorithm>
#include <optional>

QtEatenFoodModel::QtEatenFoodModel()
{

}

int QtEatenFoodModel::rowCount(const QModelIndex &parent) const
{
//    qDebug() << m_eatenFood.size();
    return m_eatenFood.size();
}

QVariant QtEatenFoodModel::data(const QModelIndex &index, int role) const
{
    if(rowCount() > index.row()) {
        auto ef = m_eatenFood.at(index.row());
        switch(role) {
            case Role_Date:
                return QString::fromStdString(ef.date);
            case Role_Amount:
                return ef.amount;
            case Role_FoodProduct_Name: {
                auto fpOpt = FoodProductByID(ef.productID);
                if(fpOpt.has_value()) return QString::fromStdString(fpOpt.value().name);
            }
            case Role_FoodProduct_Unit: {
                auto fpOpt = FoodProductByID(ef.productID);
                if(fpOpt.has_value()) return QString::fromStdString(fpOpt.value().unit);
            }
            case Role_FoodProduct_Carbohydrates: {
                auto fpOpt = FoodProductByID(ef.productID);
                if(fpOpt.has_value()) return fpOpt.value().carbohydrates;
            }
            case Role_FoodProduct_Protein: {
                auto fpOpt = FoodProductByID(ef.productID);
                if(fpOpt.has_value()) return fpOpt.value().protein;
            }
            case Role_FoodProduct_Fat: {
                auto fpOpt = FoodProductByID(ef.productID);
                if(fpOpt.has_value()) return fpOpt.value().fat;
            }
        }
    }
    return QVariant();
}

QHash<int, QByteArray> QtEatenFoodModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Role_Date] = "date";
    roles[Role_Amount] = "eaten";
    roles[Role_FoodProduct_Name] = "name";
    roles[Role_FoodProduct_Unit] = "unit";
    roles[Role_FoodProduct_Carbohydrates] = "carbohydrates";
    roles[Role_FoodProduct_Protein] = "protein";
    roles[Role_FoodProduct_Fat] = "fat";
    return roles;
}

void QtEatenFoodModel::setFoodProducts(std::vector<FoodProduct> data)
{
    beginResetModel();
    m_foodProducts = data;
    endResetModel();
}

void QtEatenFoodModel::setEatenFood(std::vector<EatenFood> data)
{
    beginResetModel();
    m_eatenFood = data;
    endResetModel();
}

std::optional<FoodProduct> QtEatenFoodModel::FoodProductByID(const int id) const
{
    auto it = std::ranges::find_if(m_foodProducts, [id](auto fp){return fp.ID == id;});
    if(it == m_foodProducts.end())
        return std::nullopt;
    return *it;
}
