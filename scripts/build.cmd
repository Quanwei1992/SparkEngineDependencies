@echo off
pushd .

@echo cleanup
IF exist ..\archive ( rmdir ..\archive /s /q )
mkdir ..\archive

IF exist ..\tmp ( rmdir ..\tmp /s /q )
IF exist ..\archive.7z ( DEL /F ..\archive.7z )


@echo Bulding
call build_shaderc.cmd
call build_mono.cmd
call build_assimp.cmd

@echo Archiving 

..\tools\7zr a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ..\archive.7z ..\archive

popd



@echo Done.