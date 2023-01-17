@echo off
pushd
cd ..
echo Build shaderc

python extern/shaderc/utils/git-sync-deps
cmake -S ./extern/shaderc -B build/shaderc -DSHADERC_SKIP_TESTS=ON -DSHADERC_SKIP_EXAMPLES=ON -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
cmake --build build/shaderc --config Debug
cmake --build build/shaderc --config Release
cmake --install build/shaderc --config Debug --prefix archive/shaderc_win64_debug
cmake --install build/shaderc --config Release --prefix archive/shaderc_win64_release
popd