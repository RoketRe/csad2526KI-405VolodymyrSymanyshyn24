#!/bin/bash
# CI Script for Linux/macOS - Build and Test
# This script builds the project and runs tests

set -e  # Exit on any error

echo "========================================"
echo "Starting CI Build Process"
echo "========================================"

# Step 1: Create build directory if it doesn't exist
if [ ! -d "build" ]; then
    echo "Creating build directory..."
    mkdir build
else
    echo "Build directory already exists"
fi

# Step 2: Navigate to build directory
echo "Navigating to build directory..."
cd build

# Step 3: Configure the project with CMake
echo "========================================"
echo "Configuring project with CMake..."
echo "========================================"
cmake ..

# Step 4: Build the project
echo "========================================"
echo "Building project..."
echo "========================================"
cmake --build .

# Step 5: Run tests with CTest
echo "========================================"
echo "Running tests with CTest..."
echo "========================================"
ctest --output-on-failure

# Return to project root
cd ..

echo "========================================"
echo "CI Build Process Completed Successfully!"
echo "========================================"
echo "Executable: build/bin/HelloWorld"
echo "Test executable: build/bin/RunTests"
echo "========================================"

exit 0
