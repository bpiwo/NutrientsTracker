#ifndef QTDAYFILTEREATENFOODMODEL_H
#define QTDAYFILTEREATENFOODMODEL_H

#include <QSortFilterProxyModel>
#include <QDate>

class QtDayFilterEatenFoodModel : public QSortFilterProxyModel
{
    Q_OBJECT

public:
    QtDayFilterEatenFoodModel();

    bool filterAcceptsRow(int sourceRow,
                          const QModelIndex &sourceParent) const override;

    Q_INVOKABLE void setDate(const QDate& date);

private:
    QDate m_date;
};

#endif // QTDAYFILTEREATENFOODMODEL_H
