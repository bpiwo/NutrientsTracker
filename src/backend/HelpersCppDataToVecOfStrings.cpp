#include "HelpersCppDataToVecOfStrings.h"

HelpersCppDataToVecOfStrings::HelpersCppDataToVecOfStrings()
{

}

std::vector<std::string> HelpersCppDataToVecOfStrings::foodProductToVecOfStr(const FoodProduct &foodProduct)
{
    std::vector<std::string> result;
    result.emplace_back("\'" + foodProduct.name + "\'");
    result.emplace_back("\'" + foodProduct.unit + "\'");
    result.emplace_back(std::to_string(foodProduct.lastValue));
    result.emplace_back(std::to_string(foodProduct.isMeal));
    result.emplace_back(std::to_string(foodProduct.mealID));
    result.emplace_back(std::to_string(foodProduct.carbohydrates));
    result.emplace_back(std::to_string(foodProduct.protein));
    result.emplace_back(std::to_string(foodProduct.fat));
    result.emplace_back(std::to_string(foodProduct.potasium));
    result.emplace_back(std::to_string(foodProduct.calcium));
    return result;
}

std::vector<std::string> HelpersCppDataToVecOfStrings::eatenFoodToVecOfStr(const EatenFood &eatenFood)
{
    std::vector<std::string> result;
    result.emplace_back(quotedString(eatenFood.date));
    result.emplace_back(std::to_string(eatenFood.productID));
    result.emplace_back(std::to_string(eatenFood.amount));
    result.emplace_back(std::to_string(eatenFood.isPartOfMeal));
    result.emplace_back(std::to_string(eatenFood.mealID));
    return result;
}

std::string HelpersCppDataToVecOfStrings::quotedString(const std::string &str)
{
    return "\'" + str + "\'";
}

