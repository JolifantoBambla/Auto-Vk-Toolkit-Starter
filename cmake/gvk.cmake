cmake_minimum_required(VERSION 3.14)

include(FetchContent)

set(avk_UseVMA ON)

FetchContent_Declare(
    gvk
    GIT_REPOSITORY      https://github.com/cg-tuwien/Gears-Vk.git
    GIT_TAG             master
    GIT_SUBMODULES      "auto_vk"
)

FetchContent_MakeAvailable(gvk)
