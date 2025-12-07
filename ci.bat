@echo off
REM CI Script for Windows - Build and Test
REM This script builds the project and runs tests

echo ========================================
echo Starting CI Build Process
echo ========================================

REM Step 1: Create build directory if it doesn't exist
if not exist build (
    echo Creating build directory...
    mkdir build
) else (
    echo Build directory already exists
)

REM Step 2: Navigate to build directory
echo Navigating to build directory...
cd build

REM Step 3: Configure the project with CMake
echo ========================================
echo Configuring project with CMake...
echo ========================================
cmake ..
if %ERRORLEVEL% NEQ 0 (
    echo CMake configuration failed!
    cd ..
    exit /b 1
)

REM Step 4: Build the project
echo ========================================
echo Building project...
echo ========================================
cmake --build .
if %ERRORLEVEL% NEQ 0 (
    echo Build failed!
    cd ..
    exit /b 1
)

REM Step 5: Run tests with CTest
echo ========================================
echo Running tests with CTest...
echo ========================================
ctest --output-on-failure
if %ERRORLEVEL% NEQ 0 (
    echo Tests failed!
    cd ..
    exit /b 1
)

REM Return to project root
cd ..

echo ========================================
echo CI Build Process Completed Successfully!
echo ========================================
echo Executable: build\bin\HelloWorld.exe
echo Test executable: build\bin\RunTests.exe
echo ========================================

exit /b 0
