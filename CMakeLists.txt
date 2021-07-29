cmake_minimum_required(VERSION 3.13)
project(Gears_Vk_Starter)

set(CMAKE_CXX_STANDARD 20)

include(FetchContent)

add_executable(${PROJECT_NAME}
    src/main.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC
    include/)

# Dependencies
## Gears-Vk
set(avk_UseVMA ON)
add_compile_definitions(AVK_USE_VMA)
add_compile_definitions(GVK_CMAKE_BUILD)
include(cmake/gvk.cmake)
target_include_directories(${PROJECT_NAME} PUBLIC Gears_Vk)
target_link_libraries(${PROJECT_NAME} PUBLIC Gears_Vk)

# Assets
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/shaders/  $<TARGET_FILE_DIR:${PROJECT_NAME}>/shaders)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_SOURCE_DIR}/assets/  $<TARGET_FILE_DIR:${PROJECT_NAME}>/assets)
