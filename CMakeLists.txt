cmake_minimum_required(VERSION 3.16)

project(Light_System VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Charts)
qt_standard_project_setup()

qt_add_executable(appLight_System
    main.cpp
)

qt_add_qml_module(appLight_System
    URI Light_System
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES Header_GUI.qml
    QML_FILES Node_GUI.qml
    QML_FILES Socket_GUI.qml
    SOURCES backend.h backend.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appLight_System PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appLight_System
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appLight_System
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Charts
)

include(GNUInstallDirs)
install(TARGETS appLight_System
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
