@echo off
REM ————————————————————————————————
REM build.bat: configure → build → test your CMake project on Windows
REM ————————————————————————————————

REM 1) choose your build directory
set BUILD_DIR=build

REM 2) if it doesn't exist, make it
if not exist "%BUILD_DIR%" (
    echo Creating build directory "%BUILD_DIR%"...
    mkdir "%BUILD_DIR%"
)

REM 3) switch into it
pushd "%BUILD_DIR%"

REM 4) configure with CMake
echo.
echo ===== Configuring project =====
cmake .. 
if errorlevel 1 (
    echo.
    echo [ERROR] CMake configuration failed.
    popd
    exit /b 1
)

REM 5) build the project
echo.
echo ===== Building project =====
cmake --build . --config Debug
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed.
    popd
    exit /b 1
)

REM 6) run unit tests
echo.
echo ===== Running unit tests =====
ctest -C Debug --output-on-failure
if errorlevel 1 (
    echo.
    echo [ERROR] Some tests failed.
    popd
    exit /b 1
)

echo.
echo ===== All done! =====
echo Executables are in "%BUILD_DIR%"\bin (or "%BUILD_DIR%" for single-config generators).
popd
exit /b 0
