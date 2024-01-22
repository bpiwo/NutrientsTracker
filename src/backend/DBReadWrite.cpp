#include "DBReadWrite.h"

#include <sqlite3.h>
#include <cstring>
#include <algorithm>
#include <iostream>
#include <numeric>
#include <sstream>

#include "HelpersCppDataToVecOfStrings.h"

DBReadWrite::DBReadWrite()
{}

static int callback_foodProducts(void *fps, int argc, char **argv, char **azColName){
//    std::cout << "Load food product" << std::endl;

    auto foodProducts = static_cast<std::vector<FoodProduct>*>(fps);

    FoodProduct fp = FoodProduct();

    for(int i=0; i<argc; i++){
        if(strcmp(azColName[i], "ID") == 0)
            fp.ID = std::stoi(argv[i]);

        if(strcmp(azColName[i], "Name") == 0)
            fp.name = std::string(argv[i]);

        if(strcmp(azColName[i], "Unit") == 0)
            fp.unit = std::string(argv[i]);

        if(strcmp(azColName[i], "LastValue") == 0)
            fp.lastValue = std::stoi(argv[i]);

        if(strcmp(azColName[i], "IsMeal") == 0)
            fp.isMeal = std::stoi(argv[i]);

        if(strcmp(azColName[i], "MealID") == 0)
            fp.mealID = std::stoi(argv[i]);

        if(strcmp(azColName[i], "Carbohydrates") == 0)
            fp.carbohydrates = std::stoi(argv[i]);

        if(strcmp(azColName[i], "Protein") == 0)
            fp.protein = std::stoi(argv[i]);

        if(strcmp(azColName[i], "Fat") == 0)
            fp.fat = std::stoi(argv[i]);

        if(strcmp(azColName[i], "Potasium") == 0)
            fp.potasium = std::stoi(argv[i]);

        if(strcmp(azColName[i], "Calcium") == 0)
            fp.calcium = std::stoi(argv[i]);
    }

    foodProducts->emplace_back(fp);
//    std::cout << "Load food product done" << std::endl;
    return 0;
}

static int callback_eatenFood(void *fps, int argc, char **argv, char **azColName){
//    std::cout << "Load eaten food" << std::endl;

    auto eatenFoods = static_cast<std::vector<EatenFood>*>(fps);
    auto exampleFc = [](int x){return x;};
    // TODO: use map instead of two vectors (lol)
    auto ef = EatenFood();
    auto columns = {"ID", "Date", "ProductID", "Amount", "IsPartOfMeal", "MealID"};
    std::vector<std::function<void(char*)>> fcsForColumns =
    {[&ef](const char* str){ef.ID = std::stoi(str);},
    [&ef](const char* str){ef.date = std::string(str);},
    [&ef](const char* str){ef.productID = std::stoi(str);},
    [&ef](const char* str){ef.amount = std::stoi(str);},
    [&ef](const char* str){ef.isPartOfMeal = std::stoi(str);},
    [&ef](const char* str){ef.mealID = std::stoi(str);}};

    for(int i=0; i<argc; i++){
        auto colName = azColName[i];
        auto it = std::ranges::find_if(columns, [colName](auto value){return strcmp(colName, value) == 0;});
        fcsForColumns[std::distance(columns.begin(), it)](argv[i]);
    }

    eatenFoods->emplace_back(ef);
//    std::cout << "Load eaten food done" << std::endl;
    return 0;
}

std::vector<FoodProduct> DBReadWrite::readFoodProducts() const
{
//    printf("DBReadWrite::readFoodProducts");
    std::vector<FoodProduct> foodProducts;
    executeQuery("SELECT * FROM FoodProduct", callback_foodProducts, &foodProducts);
    return foodProducts;
}

std::vector<EatenFood> DBReadWrite::readEatenFood() const
{
//    printf("DBReadWrite::readEatenFood");
    std::vector<EatenFood> eatenFood;
    executeQuery("SELECT * FROM EatenFood", callback_eatenFood, &eatenFood);
    return eatenFood;
}

void DBReadWrite::writeFoodProduct(const FoodProduct &foodProduct) const
{
    auto fpStrVec = HelpersCppDataToVecOfStrings::foodProductToVecOfStr(foodProduct);
    auto fpStr = std::accumulate(std::next(fpStrVec.begin()), fpStrVec.end(),
                                 fpStrVec[0], [](std::string l, std::string r){return l + ", " + r;});
    std::stringstream ss;
    ss << "INSERT INTO FoodProduct (Name, Unit, LastValue, IsMeal, MealID, Carbohydrates, Protein, Fat, Potasium, Calcium) VALUES (" <<
        fpStr << ")";
    std::cout<< "query:  " << ss.str() << std::endl;
    executeQuery(ss.str().c_str());
}

void DBReadWrite::writeEatenFood(const EatenFood &eatenFood) const
{
    auto efStrVec = HelpersCppDataToVecOfStrings::eatenFoodToVecOfStr(eatenFood);
    auto efStr = std::accumulate(std::next(efStrVec.begin()), efStrVec.end(),
                                 efStrVec[0], [](std::string l, std::string r){return l + ", " + r;});
    std::stringstream ss;
    ss << "INSERT INTO EatenFood (Date, ProductID, Amount, IsPartOfMeal, MealID) VALUES (" <<
        efStr << ")";
    std::cout<< "query:  " << ss.str() << std::endl;
    executeQuery(ss.str().c_str());
}

void DBReadWrite::executeQuery(const char* query, int (*callback)(void *, int, char **, char **), void* dataStruct) const
{
    sqlite3 *db;
    char *zErrMsg = 0;
    int rc = sqlite3_open(m_dbName.c_str(), &db);
    if( rc==SQLITE_OK ){

        rc = sqlite3_exec(db, query,
                          callback, dataStruct, &zErrMsg);

        if( rc!=SQLITE_OK ){
            std::cerr << "DB error: " << zErrMsg << std::endl;
        }
    }
    sqlite3_close(db);
}
