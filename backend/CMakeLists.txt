include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(
    Lightbackend_SRCS
    modules/Light/backend.cpp
    modules/Light/mytype.cpp
    modules/Light/trafficlight.cpp
    modules/Light/piechart.cpp
)

add_library(Lightbackend MODULE
    ${Lightbackend_SRCS}
)

set_target_properties(Lightbackend PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY Light)

qt5_use_modules(Lightbackend Gui Qml Quick)

# Copy qmldir file to build dir for running in QtCreator
add_custom_target(Lightbackend-qmldir ALL
    COMMAND cp ${CMAKE_CURRENT_SOURCE_DIR}/modules/Light/qmldir ${CMAKE_CURRENT_BINARY_DIR}/Light
    DEPENDS ${QMLFILES}
)

# Install plugin file
install(TARGETS Lightbackend DESTINATION ${QT_IMPORTS_DIR}/Light/)
install(FILES   modules/Light/qmldir DESTINATION ${QT_IMPORTS_DIR}/Light/)

