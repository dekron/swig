$env:PATH=".\Tools\cmake-win64.3.15.5\bin;.\Tools\bison.3.7.4\bin;" + $env:PATH
$PCRE_ROOT=".\Tools\pcre2.10.39.0"
$PCRE_PLATFORM="x64"
$WORKING_DIR=(Get-Location).ToString() -replace "\\","/"
cmake -G "Visual Studio 16 2019" -A "x64" `
-DCMAKE_INSTALL_PREFIX="$WORKING_DIR/install2" `
-DCMAKE_C_FLAGS="/DPCRE2_STATIC" `
-DCMAKE_CXX_FLAGS="/DPCRE2_STATIC" `
-DPCRE2_INCLUDE_DIR="$PCRE_ROOT/include" `
-DPCRE2_LIBRARY="$PCRE_ROOT/lib/pcre2-8-static.lib" `
-S . -B build
cmake --build build --config Release
cmake --install build --config Release