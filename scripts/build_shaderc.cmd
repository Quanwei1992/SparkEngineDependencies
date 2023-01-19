pushd .

cd ..
echo Building shaderc

python extern/shaderc/utils/git-sync-deps
cmake -S ./extern/shaderc -B build/shaderc -DSHADERC_SKIP_TESTS=ON -DSHADERC_SKIP_EXAMPLES=ON -DSHADERC_SKIP_COPYRIGHT_CHECK=ON
cmake --build build/shaderc --config Debug
cmake --build build/shaderc --config Release
cmake --install build/shaderc --config Debug --prefix tmp/shaderc_win64_debug
cmake --install build/shaderc --config Release --prefix tmp/shaderc_win64_release

xcopy .\tmp\shaderc_win64_debug\include .\archive\shaderc\include\ /f /e /y
echo f | xcopy .\tmp\shaderc_win64_debug\lib\shaderc_combined.lib .\archive\shaderc\lib\win64\debug\shaderc_combined.lib /f /e /y 
echo f | xcopy .\tmp\shaderc_win64_release\lib\shaderc_combined.lib .\archive\shaderc\lib\win64\release\shaderc_combined.lib /f /e /y

popd