@echo off

rem Where the Spotlight images (and other unrelated images) are stored
cd /d "%userprofile%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"

rem Where to extract the Spotlight pictures to
set tempFolder=tempPictures

rem delete the %tempFolder% if it exists
rem "/s" = Remove all directories and files in addition to the directory itiself
rem "/q" = Quiet mode. Don't ask to remove.
rem It will show "the system cannof find the file specified" if %tempFolder% doesn't exist
rmdir /s /q %tempFolder%

rem Make the directory to place the Spotlight pictures
mkdir %tempFolder%

rem Copy everything from the current folder to %tempFolder%
rem We use xcopy since Windows doesn't have Linux's cp
rem "/v" means to verify the copied file. It's a bit costly though
rem "*" means all files in this folder
xcopy /v * %tempFolder%

rem Go to the folder where we extracted the Spotlight pictures
cd %tempFolder%

rem Rename everything to everything.jpg
ren * *.jpg

rem Start an instance of Explorer at the current window (tempFolder)
start .

rem Go back to the parent directory
cd ..

rem We pause execution so that the cmd screen doesn't immediately close
pause