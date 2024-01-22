#include "QtDayFilterEatenFoodModel.h"

QtDayFilterEatenFoodModel::QtDayFilterEatenFoodModel()
{
    m_date = QDate().currentDate();
    setDynamicSortFilter(true);
}

bool QtDayFilterEatenFoodModel::filterAcceptsRow(int sourceRow, const QModelIndex &sourceParent) const
{
    auto index = sourceModel()->index(sourceRow, 0, sourceParent);
    auto date = sourceModel()->data(index, roleNames().key("date")).toDate();
    return date == m_date;
}

void QtDayFilterEatenFoodModel::setDate(const QDate &date)
{
    beginResetModel();
    m_date = date;
    endResetModel();
}
