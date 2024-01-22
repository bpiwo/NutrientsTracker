#include "HelpersQtToCpp.h"

#include <QDate>

FoodProduct HelpersQtToCpp::QVariantListToFoodProduct(const QVariantList &foodProductData)
{
    FoodProduct fp;
    fp.name = foodProductData.at(0).toString().toStdString();
    fp.unit = foodProductData.at(1).toString().toStdString();
    fp.lastValue = foodProductData.at(2).toInt();
    fp.isMeal = foodProductData.at(3).toInt();
    fp.mealID = foodProductData.at(4).toInt();
    fp.carbohydrates = foodProductData.at(5).toInt();
    fp.protein = foodProductData.at(6).toInt();
    fp.fat = foodProductData.at(7).toInt();
    fp.potasium = foodProductData.at(8).toInt();
    fp.calcium = foodProductData.at(9).toInt();
    return fp;
}

EatenFood HelpersQtToCpp::QVariantListToEatenFood(const QVariantList &eatenFoodData)
{
    EatenFood ef;
    qDebug() << eatenFoodData.at(0);
    ef.date = eatenFoodData.at(0).toDate().toString("yyyy-MM-dd").toStdString();
    ef.productID = eatenFoodData.at(1).toInt();
    ef.amount = eatenFoodData.at(2).toInt();
    ef.isPartOfMeal = eatenFoodData.at(3).toBool();
    ef.mealID = eatenFoodData.at(0).toInt();
    return ef;
}
