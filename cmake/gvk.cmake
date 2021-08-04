cmake_minimum_required(VERSION 3.14)

include(FetchContent)

set(avk_UseVMA ON)
add_compile_definitions(AVK_USE_VMA)
if (UNIX)
    add_compile_definitions(GVK_CMAKE_BUILD)
endif(UNIX)

FetchContent_Declare(
    gvk
    GIT_REPOSITORY      https://github.com/cg-tuwien/Gears-Vk.git
    GIT_TAG             gcc
    GIT_SUBMODULES      "auto_vk"
)

FetchContent_MakeAvailable(gvk)
