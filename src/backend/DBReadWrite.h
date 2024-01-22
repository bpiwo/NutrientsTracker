#ifndef DBREADWRITE_H
#define DBREADWRITE_H

#include <vector>

#include "DBdata/FoodProduct.h"
#include "DBdata/EatenFood.h"

class DBReadWrite
{
public:
    DBReadWrite();

    std::vector<FoodProduct> readFoodProducts() const;
    std::vector<EatenFood> readEatenFood() const;
    void writeFoodProduct(const FoodProduct& foodProduct) const;
    void writeEatenFood(const EatenFood& eatenFood) const;
private:
    std::string m_dbName = "NutrientsAppDB.db";

    void executeQuery(const char* query, int (*callback)(void*,int,char**,char**) = nullptr, void* dataStruct = nullptr) const;
};

#endif // DBREADWRITE_H
