cmake_minimum_required(VERSION 3.13)
project(Gears_Vk_Starter)

set(CMAKE_CXX_STANDARD 20)

include(FetchContent)

option(gvkStarter_CreateDependencySymlinks
        "Create symbolic links instead of copying dependencies of examples, i.e. DLLs (Windows only) & assets."
        ON)

add_executable(${PROJECT_NAME}
    src/main.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC
    include/)

# Dependencies
## Gears-Vk
include(cmake/gvk.cmake)
target_include_directories(${PROJECT_NAME} PUBLIC Gears_Vk)
target_link_libraries(${PROJECT_NAME} PUBLIC Gears_Vk)

# Assets
include(${Gears_Vk_SOURCE_DIR}/cmake/post_build_helper/add_post_build_commands.cmake)

add_post_build_commands(${PROJECT_NAME}
    ${PROJECT_SOURCE_DIR}/shaders
    $<TARGET_FILE_DIR:${PROJECT_NAME}>/shaders
    $<TARGET_FILE_DIR:${PROJECT_NAME}>/assets
    "${PROJECT_SOURCE_DIR}/assets"
    ${gvkStarter_CreateDependencySymlinks})
