cmake_minimum_required(VERSION 3.21.1)
set(CMAKE_CXX_STANDARD 20)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(NutrientsTrackerApp LANGUAGES CXX)
include_directories(src/backend)

set(CMAKE_AUTOMOC ON)

find_package(SQLite3 REQUIRED)
find_package(Qt6 6.2 REQUIRED COMPONENTS Core Gui Qml Quick Sql)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()

qt_add_executable(NutrientsTrackerApp src/main.cpp
    src/backend/BackEnd.h src/backend/BackEnd.cpp
    src/backend/DBdata/FoodProduct.h
    src/backend/QtBackEnd.h src/backend/QtBackEnd.cpp
    src/backend/QtModels/QtFoodProductsModel.h src/backend/QtModels/QtFoodProductsModel.cpp
    src/backend/HelpersQtToCpp.h src/backend/HelpersQtToCpp.cpp
    src/backend/DBReadWrite.h src/backend/DBReadWrite.cpp
    src/backend/DBdata/EatenFood.h
    src/backend/QtModels/QtEatenFoodModel.h src/backend/QtModels/QtEatenFoodModel.cpp
    src/calendar/yacalendar.cpp src/calendar/yacalendar.h
    src/backend/QtModels/QtDayFilterEatenFoodModel.h src/backend/QtModels/QtDayFilterEatenFoodModel.cpp
    src/backend/HelpersCppDataToVecOfStrings.h src/backend/HelpersCppDataToVecOfStrings.cpp


)

qt_add_resources(NutrientsTrackerApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

target_link_libraries(NutrientsTrackerApp PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    SQLite::SQLite3
)

if (BUILD_QDS_COMPONENTS)
    include(${CMAKE_CURRENT_SOURCE_DIR}/qmlcomponents)
endif()

include(${CMAKE_CURRENT_SOURCE_DIR}/qmlmodules)

if (LINK_INSIGHT)
    include(${CMAKE_CURRENT_SOURCE_DIR}/insight)
endif ()

include(GNUInstallDirs)
install(TARGETS NutrientsTrackerApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

