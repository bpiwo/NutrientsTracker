#include "backend.h"
#include <sqlite3.h>
#include <cstring>
#include <algorithm>
#include <iostream>

BackEnd::BackEnd()
{}

void BackEnd::loadDBData()
{
    std::cout << "BackEnd::loadDBData" << std::endl;
    loadFoodProducts();
    loadEatenFood();
}

void BackEnd::addFoodProduct(const FoodProduct &foodProduct)
{
    m_dbReadWrrite.writeFoodProduct(foodProduct);
}

void BackEnd::addEatenFood(const EatenFood &eatenFood)
{
    m_dbReadWrrite.writeEatenFood(eatenFood);
}

void BackEnd::loadFoodProducts()
{
    m_foodProducts = m_dbReadWrrite.readFoodProducts();
    //    printFoodProducts();
}

void BackEnd::loadEatenFood()
{
    m_eatenFood = m_dbReadWrrite.readEatenFood();
}

std::vector<FoodProduct> BackEnd::foodProducts()
{
    return m_foodProducts;
}

std::vector<EatenFood> BackEnd::eatenFood()
{
    return m_eatenFood;
}

void BackEnd::printFoodProducts()
{
    std::cout << "Current food products" << std::endl;
    auto pr = [](const FoodProduct& sfp){std::cout <<
        sfp.ID << " " << sfp.name << " " << sfp.unit.c_str() <<
        " " << sfp.isMeal << " " << sfp.mealID << " " << std::endl;};
    for_each (m_foodProducts.begin(), m_foodProducts.end(), pr);
}
