#ifndef HELPERSCPPDATATOVECOFSTRINGS_H
#define HELPERSCPPDATATOVECOFSTRINGS_H

#include <vector>

#include "DBdata/FoodProduct.h"
#include "DBdata/EatenFood.h"

class HelpersCppDataToVecOfStrings
{
public:
    HelpersCppDataToVecOfStrings();

    static std::vector<std::string> foodProductToVecOfStr(const FoodProduct &foodProduct);
    static std::vector<std::string> eatenFoodToVecOfStr(const EatenFood &eatenFood);

private:
    static std::string quotedString(const std::string& str);
};

#endif // HELPERSCPPDATATOVECOFSTRINGS_H
