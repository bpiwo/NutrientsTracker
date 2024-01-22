#ifndef HELPERSQTTOCPP_H
#define HELPERSQTTOCPP_H

#include <QVariantList>
#include "DBdata/FoodProduct.h"
#include "DBdata/EatenFood.h"

class HelpersQtToCpp
{
public:
    static FoodProduct QVariantListToFoodProduct(const QVariantList& foodProductData);

    static EatenFood QVariantListToEatenFood(const QVariantList& eatenFoodData);
};

#endif // HELPERSQTTOCPP_H
