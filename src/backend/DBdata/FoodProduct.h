#ifndef FOODPRODUCT_H
#define FOODPRODUCT_H

#include <string>

struct FoodProduct
{
    int ID;
    std::string name;
    std::string unit;
    int lastValue;
    bool isMeal;
    int mealID;
    int carbohydrates;
    int protein;
    int fat;
    int potasium;
    int calcium;
};

#endif // FOODPRODUCT_H
