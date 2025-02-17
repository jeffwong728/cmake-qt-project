$env:VCPKG_DIR=$env:VCPKG_ROOT_DIR + "/installed/x64-windows"
$env:CTF=$env:VCPKG_ROOT_DIR + "/scripts/buildsystems/vcpkg.cmake"
$env:IDIR=$env:SPAM_ROOT_DIR + "/cmake-qt-project/install/laserx"
$env:HDIR=$env:SPAM_ROOT_DIR + "/cmake-qt-project"
$env:BDIR=$env:SPAM_ROOT_DIR + "/cmake-qt-project/build/msvs"

cmake --no-warn-unused-cli -DCMAKE_TOOLCHAIN_FILE:STRING=$env:CTF -DCMAKE_VERBOSE_MAKEFILE:BOOL=FALSE -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_SKIP_RPATH:BOOL=FALSE -DCMAKE_SKIP_INSTALL_RPATH:BOOL=FALSE -DCMAKE_DEBUG_POSTFIX:STRING=_d -DCMAKE_MINSIZEREL_POSTFIX:STRING=_minsize -DCMAKE_RELWITHDEBINFO_POSTFIX:STRING=_debinfo -DCMAKE_CXX_STANDARD:STRING=17 -DCMAKE_CXX_STANDARD_REQUIRED:BOOL=TRUE -DCMAKE_CXX_EXTENSIONS:BOOL=FALSE -DCMAKE_INSTALL_PREFIX:STRING=$env:IDIR -S $env:HDIR -B $env:BDIR -G"Visual Studio 15 2017 Win64"

cmake --open $env:BDIR
