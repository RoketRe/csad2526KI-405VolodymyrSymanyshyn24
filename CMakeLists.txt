cmake_minimum_required(VERSION 3.10)

# Project name and version
project(HelloWorld VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the main executable
add_executable(HelloWorld main.cpp math_operations.cpp)

# Optional: Set output directory
set_target_properties(HelloWorld PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

# ====================================
# Google Test Configuration
# ====================================

# Enable testing
enable_testing()

# Fetch Google Test from GitHub
include(FetchContent)
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Make Google Test available
FetchContent_MakeAvailable(googletest)

# Add test executable
add_executable(RunTests
    tests/unit_tests.cpp
    math_operations.cpp
)

# Link Google Test libraries to the test executable
target_link_libraries(RunTests
    gtest
    gtest_main
)

# Include directories for tests
target_include_directories(RunTests PRIVATE ${CMAKE_SOURCE_DIR})

# Discover and register tests with CTest
include(GoogleTest)
gtest_discover_tests(RunTests)
