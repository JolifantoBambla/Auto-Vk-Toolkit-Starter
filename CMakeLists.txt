cmake_minimum_required(VERSION 3.13)
project(Gears_Vk_Starter)

if (MSVC)
    # <ranges> support requires /std:c++latest on MSVC
    set(CMAKE_CXX_STANDARD 23)
else (MSVC)
    set(CMAKE_CXX_STANDARD 20)
endif (MSVC)

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

get_target_property(gvkStarter_BINARY_DIR ${PROJECT_NAME} BINARY_DIR)
add_post_build_commands(${PROJECT_NAME}
    ${PROJECT_SOURCE_DIR}/shaders
    ${gvkStarter_BINARY_DIR}/shaders
    $<TARGET_FILE_DIR:${PROJECT_NAME}>/assets
    "${PROJECT_SOURCE_DIR}/assets"
    ${gvkStarter_CreateDependencySymlinks})
