cmake_minimum_required(VERSION 3.15...3.31)

# Project configuration
project(template
  VERSION 0.0.0
  LANGUAGES CXX)

# Message to confirm configuration
message(STATUS "Configuring project: ${PROJECT_NAME} version ${PROJECT_VERSION}")

# Get the source files and create target
file(GLOB_RECURSE SOURCES "src/*.cpp")  # Use GLOB_RECURSE for nested directories
add_executable(${PROJECT_NAME} ${SOURCES})

# Include directories (all targets need them)
include_directories(src/include)

# Set the cpp standard
set_target_properties(${PROJECT_NAME} PROPERTIES
  CXX_STANDARD 14
  CXX_STANDARD_REQUIRED YES
  CXX_EXTENSIONS NO
)

# Compiler flags for debug and release builds
target_compile_options(${PROJECT_NAME} PRIVATE
  "-Wall" "-Wextra" "-fexceptions"
  "$<$<CONFIG:DEBUG>:-O0;-g3;-ggdb;-fsanitize=address;-fsanitize=undefined;-fno-omit-frame-pointer;-fno-inline>"
  "$<$<CONFIG:RELEASE>:-O3;-flto;-finline-functions;-fomit-frame-pointer;-fmerge-all-constants;-fstrict-aliasing;-march=native;-mtune=native>"
)

# Linker options to detect ASan
target_link_options(${PROJECT_NAME} PRIVATE
  "$<$<CONFIG:Debug>:-fsanitize=address;-fsanitize=undefined>"
)
