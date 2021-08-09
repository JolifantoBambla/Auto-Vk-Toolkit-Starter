# Gears-Vk-Starter
A template for [Gears-Vk](https://github.com/cg-tuwien/Gears-Vk) projects.

## Setup

### Use this template
Click on the [Button](https://github.com/lHerzberger/Gears-Vk-Starter/generate) near the top of the page to generate your own project using this template.
Then simply clone your newly created project.

### Install dependencies
* A [Vulkan 1.1 SDK](https://vulkan.lunarg.com/sdk/home) or newer
* A C++20 compiler (GCC and MSVC are currently supported)
* [CMake 3.13](https://cmake.org/) or newer

## Build & Run

### Linux
Within the directory to which you cloned your project and run the following commands:
```
mkdir build
cd build
cmake .. && make
./Gears-Vk-Starter
```

### Windows/Visual Studio 2019
Make sure you have installed [CMake tools for Visual Studio](https://docs.microsoft.com/en-us/cpp/build/cmake-projects-in-visual-studio?view=msvc-160#installation).

Open the directory which contains your project with Visual Studio, wait for Visual Studio to run the `CMake` configuration and then select `Gears_Vk_Starter.exe`/`<Your Project Name>.exe` as `Startup Item` and run it by pressing the "play" button.

## Post Build Actions
There are two special directories in this project for which post build actions are configured for the executable: `<project root>/shaders` and `<project root>/assets`
In your source code you can treat them as if these directories were in the same location as your executable.
Even more so: you can treat all GLSL shaders as if they were SPIR-V binaries.

All GLSL shader files in the `<project root>/shaders` directory are compiled to SPIR-V and written to `<dir containing executable>/shaders`.
For all files and directories in the `<project root>/assets` symbolic links will be created in `<dir containing executable>/assets`.

On Windows, symbolic links are also created for all DLLs required by **Gears-Vk** in the same manner.
Use the CMake option `gvk_ReleaseDLLsOnly` to enforce the use of release DLLs even in debug builds.

### Publishing your project
If you want to project, you can configure the post build actions to copy dependencies, i.e. DLLs (Windows only) & assets, instead of creating symbolic links, by turning off the CMake option `gvkStarter_CreateDependencySymlinks`.

### Limitations
Since these are post build actions, changes to the content of the `shaders` or `assets` directories does not trigger shaders to be recompiled or new assets to be copied.
This will change in the near future.
For now, if you're using an IDE (e.g. CLion or Visual Studio 2019), you can use the fact that changes to `CMakeLists.txt` will trigger Makefiles to be recreated, which in turn will trigger only the post build actions to be executed if the executable is already built and linked.

## Found a bug?
If you found a bug in the template (i.e. in the provided `src/main.cpp`, the `CMake` or GitHub workflow files) please open an issue directly in the template project.

However, if the bug you found is in [Gears-Vk](https://github.com/cg-tuwien/Gears-Vk), please create the issue directly over there.

## See also
* [Auto-Vk](https://github.com/cg-tuwien/Auto-Vk): A low-level convenience and productivity layer atop [Vulkan-Hpp](https://github.com/KhronosGroup/Vulkan-Hpp).
* [Gears-Vk](https://github.com/cg-tuwien/Gears-Vk): A larger real-time rendering framework built on top of [Auto-Vk](https://github.com/cg-tuwien/Auto-Vk).

