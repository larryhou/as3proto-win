@echo off
title Protobuf for Actionscript 3
color 0a
cls

call setup.bat

rem DO NOT MODIFY IT
set SDK=.\framework
set PROTOC=%SDK%\protoc.exe

rem Make a directory for output if not exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:LOOP
echo ----------------------------
echo Type proto file name:
set /p PROTO_FILE=

if not "%PROTO_FILE:~-6%" == ".proto" (
	set PROTO_FILE=%PROTO_FILE%.proto
)

set PROTO_FILE=%PROTO_DIR%\%PROTO_FILE%

echo\
echo ... ... ...

@echo on
@rem Generate AS3 code from *.proto file
%PROTOC% --proto_path="%PROTO_DIR%" --plugin=protoc-gen-as3="%SDK%\protoc-gen-as3.bat" --as3_out="%OUTPUT_DIR%" "%PROTO_FILE%"
@echo off

echo\
echo DONE! Press any key to process another proto file...
pause>nul

cls
call:LOOP