#!/bin/bash
# Script for configuring SPIRV-Tools C++ dependency from scratch. Use this to
# update the dependency to a newer version.
PACKAGE_DIR=$(pwd)

# 'build' directory aliases '.build' from SwiftPM. It is recognized by the
# '.gitignore', so you won't push unwanted files to the Git repository.
mkdir .build
cd .build

# Download online repositories.
git clone "https://github.com/KhronosGroup/SPIRV-Tools.git" "spirv-tools"
cd spirv-tools
git clone "https://github.com/KhronosGroup/SPIRV-Headers.git" "external/spirv-headers"

# Prepare compilation of SPIRV-Tools.
mkdir build
cd build
cmake ..
if [[ $? != 0 ]]; then
  exit $?
fi

# Compile SPIRV-Tools.
make
if [[ $? != 0 ]]; then
  exit $?
fi

# Prepare destinations for copying.
cd $PACKAGE_DIR
SRC=".build/spirv-tools"
DEST="Sources/SPIRVTools"
rm -rf $DEST
mkdir $DEST
mkdir "${DEST}/include"
mkdir "${DEST}/include/preprocessed"

# Copy files into "Sources/SPIRVTools".
cp -r "${SRC}/source" "${DEST}/source"
cp -r "${SRC}/external/spirv-headers/include/spirv" "${DEST}/include/spirv"
cp -r "${SRC}/spirv-tools" "${DEST}/include/spirv-tools"

# Copy preprocessed files from build folder.
FILES_DIR="${SRC}/build"
PREPROCESSED_DIR="${DEST}/include/preprocessed"

cd $FILES_DIR
INC_FILES=$(find . -name \*.inc)
cd $PACKAGE_DIR
for file in INC_FILES; do
  cp "${FILES_DIR}/${file}" "${PREPROCESSED_DIR}/${file}"
done

cd $FILES_DIR
H_FILES=$(find . -name \*.h)
cd $PACKAGE_DIR
for file in H_FILES; do
  cp "${FILES_DIR}/${file}" "${PREPROCESSED_DIR}/${file}"
done

# Create modulemap.
MODULEMAP_SRC='
module SPIRVTools {
  header "spirv-tools/libspirv.h"
  export *
}
'
echo $MODULEMAP_SRC > "${DEST}/include/module.modulemap"
