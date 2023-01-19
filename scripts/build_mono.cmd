pushd .

cd ..
echo Building mono

call .\extern\mono\msvc\run-msbuild.bat build x86_64 debug
call .\extern\mono\msvc\run-msbuild.bat release
xcopy .\extern\mono\msvc\include .\archive\mono\include\ /f /e /y /i
xcopy .\extern\mono\msvc\build\sgen\x64\lib\release .\archive\mono\lib\win64\release /f /e /y /i
xcopy .\extern\mono\msvc\build\sgen\x64\lib\debug .\archive\mono\lib\win64\debug /f /e /y /i
popd