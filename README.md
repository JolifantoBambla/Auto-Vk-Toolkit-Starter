# Gears-Vk-Starter
A template for [Gears-Vk](https://github.com/cg-tuwien/Gears-Vk) projects.

## Post Build Actions
There are two special directories in this project for which post build actions are configured for the executable: `<project root>/shaders` and `<project root>/assets`
In your source code you can treat them as if these directories were in the same location as your executable.
Even more so: you can treat all GLSL shaders as if they were SPIR-V binaries.

All GLSL shader files in the `<project root>/shaders` directory are compiled to SPIR-V and written to `<dir containing executable>/shaders`.
For all files and directories in the `<project root>/assets` symbolic links will be created in `<dir containing executable>/assets`.

On Windows, symbolic links are also created for all DLLs required by **Gears-Vk** in the same manner.
Use the CMake option `gvk_ReleaseDLLs` to enforce the use of release DLLs even in debug builds.

### Publishing your project
If you want to project, you can configure the post build actions to copy dependencies, i.e. DLLs (Windows only) & assets, instead of creating symbolic links, by turning off the CMake option `gvkStarter_CreateDependencySymlinks`.

### Limitations
Since these are post build actions, changes to the content of the `shaders` or `assets` directories does not trigger shaders to be recompiled or new assets to be copied.
This will change in the near future.
For now, if you're using an IDE (e.g. CLion or Visual Studio 2019), you can use the fact that changes to `CMakeLists.txt` will trigger Makefiles to be recreated, which in turn will trigger only the post build actions to be executed if the executable is already built and linked.
