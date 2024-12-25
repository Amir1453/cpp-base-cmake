#!/bin/bash

# Exit if any command fails
set -e

# Basic Usage:
# ./build.sh or ./build.sh debug -> builds with debug flags
#   binary at -> ./build/debug/pawnstar
# ./build.sh release -> builds with release flags
#   binary at -> ./build/release/pawnstar
# ./build.sh clean -> removes ./build
# ./build.sh test -> runs test executable at ./build/debug/pawnstar_tests

DEBUG="./build/debug/"
RELEASE="./build/release/"

if [ "$1" == "debug" ] || [ -z "$1" ]; then
  mkdir -p "$DEBUG"
  cd "$DEBUG" || {
    echo "Failed to change directory to $DEBUG"
    exit 1
  }
  cmake -DCMAKE_BUILD_TYPE=Debug ../.. || {
    echo "CMake configuration failed!"
    exit 1
  }
  make || {
    echo "Make failed!"
    exit 1
  }

elif [ "$1" == "release" ]; then
  mkdir -p "$RELEASE"
  cd "$RELEASE" || {
    echo "Failed to change directory to $RELEASE"
  }
  cmake -DCMAKE_BUILD_TYPE=Release ../.. || {
    echo "CMake configuration failed!"
    exit 1
  }
  make || {
    echo "Make failed!"
    exit 1
  }

elif [ "$1" == "test" ]; then
  cd "$DEBUG" || {
    echo "Failed to change directory to $DEBUG. Make sure to it is built!"
  }
  ./pawnstar_tests

elif [ "$1" == "clean" ]; then
  rm -rf ./build || {
    echo "Removing ./build failed!"
    exit 1
  }

else
  echo "Invalid arguments!"

fi
