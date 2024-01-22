#ifndef BACKEND_H
#define BACKEND_H

#include <string>
#include <vector>
#include <memory>

#include "DBReadWrite.h"

class BackEnd
{

public:
    explicit BackEnd();

    void loadDBData();
    void addFoodProduct(const FoodProduct& foodProduct);
    void addEatenFood(const EatenFood& eatenFood);

    void loadFoodProducts();
    void loadEatenFood();

    std::vector<FoodProduct> foodProducts();
    std::vector<EatenFood> eatenFood();

private:
    DBReadWrite m_dbReadWrrite;
    std::vector<FoodProduct> m_foodProducts;
    std::vector<EatenFood> m_eatenFood;


    void printFoodProducts();
};

#endif // BACKEND_H
