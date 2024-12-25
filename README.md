# C++ CMake Project Template

Remake of `cpp-base` with CMake support. The source files go to `src/source/` and the header files go to `src/include/`. To compile, simply run

```sh
./build.sh
```

which will compile the code with debug flags, which are available in the `CMakeLists.txt`. To compile the code with release flags you can use `./build.sh release`. The compiled object files will be placed in `build/debug` and `build/release` respectively. See `./build.sh` for all the make options available.

## Getting started

You simply need `git` and `cmake` installed, along with a C++ compiler. Copy the repository with the following command:

```sh
git clone https://github.com/Amir1453/cpp-base-cmake.git
```

and change the CMakeLists as needed.

If using `clangd`, utilize [bear](https://github.com/rizsotto/Bear) as follows:

```sh
./build.sh clean
bear -- ./build.sh
```

This will create the file `compile_commands.json`, which will fix the erroneous `clangd` messages.
