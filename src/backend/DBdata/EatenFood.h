#ifndef EATENFOOD_H
#define EATENFOOD_H

#include <string>

struct EatenFood
{
    int ID;
    std::string date;
    int productID;
    int amount;
    bool isPartOfMeal;
    int mealID;
};

#endif // EATENFOOD_H
