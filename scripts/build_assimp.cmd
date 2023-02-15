pushd .

cd ..
echo Building Assimp

cmake -S ./extern/assimp -B build/assimp -DBUILD_SHARED_LIBS=OFF -DASSIMP_BUILD_TESTS=OFF -DUSE_STATIC_CRT=ON
cmake --build build/assimp --config Debug
cmake --build build/assimp --config Release
cmake --install build/assimp --config Debug --prefix tmp/assimp_win64_debug
cmake --install build/assimp --config Release --prefix tmp/assimp_win64_release

rem headers
xcopy .\tmp\assimp_win64_debug\include .\archive\assimp\include\ /f /e /y

rem Debug
echo f | xcopy .\tmp\assimp_win64_debug\lib\assimp-vc143-mtd.lib .\archive\assimp\lib\win64\debug\assimp-vc143-mtd.lib /f /e /y 
echo f | xcopy .\tmp\assimp_win64_debug\lib\assimp-vc143-mtd.pdb .\archive\assimp\lib\win64\debug\assimp-vc143-mtd.pdb /f /e /y 
echo f | xcopy .\tmp\assimp_win64_debug\lib\zlibstaticd.lib .\archive\assimp\lib\win64\debug\zlibstaticd.lib /f /e /y 

rem Release
echo f | xcopy .\tmp\assimp_win64_release\lib\assimp-vc143-mt.lib .\archive\assimp\lib\win64\release\assimp-vc143-mt.lib /f /e /y
echo f | xcopy .\tmp\assimp_win64_release\lib\zlibstatic.lib .\archive\assimp\lib\win64\release\zlibstatic.lib /f /e /y

popd