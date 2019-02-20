@echo off
SETLOCAL EnableDelayedExpansion
::--------------------------------------------------------------------------------------------------------------------------------------------------------
for /f "tokens=4 delims=[.] " %%a in ('ver') do set ver=%%a
if %ver% equ 10 (for /f "tokens=1-9" %%e in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "UBR" ^| find "REG_DWORD"') do set /a UBR=%%g )
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLabEx"') do set BuildLabEx=%%b
for /f "tokens=1,2 delims=." %%b in ("%BuildLabEx%") do set BuildLabExFinal=%%b.%%c
for /f "tokens=2*" %%c in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName" 2^>nul') do set ProductName=%%d
for /f "tokens=2*" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild" 2^>nul') do set CurrentBuild=%%b
for /f "tokens=2*" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId" 2^>nul') do set ReleaseId=%%b
for /f "tokens=2*" %%a in ('"reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId" 2^>nul') do set ReleaseId=%%b
::-------------------------------------------------------------------------------------------------------------------------------------------------------
cd %~dp0\
chcp 65001
title [BangMaple] Bộ cài đặt Adobe CC Portable
cls
:createvbs
if exist "%temp%\browse.vbs" ( del "%temp%\browse.vbs" /s /q >nul )
cls
echo Option Explicit >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo Const BIF_returnonlyfsdirs   = ^&H0001 >> "%temp%\browse.vbs"
echo Const BIF_dontgobelowdomain  = ^&H0002 >> "%temp%\browse.vbs"
echo Const BIF_statustext         = ^&H0004 >> "%temp%\browse.vbs"
echo Const BIF_returnfsancestors  = ^&H0008 >> "%temp%\browse.vbs"
echo Const BIF_editbox            = ^&H0010 >> "%temp%\browse.vbs"
echo Const BIF_validate           = ^&H0020 >> "%temp%\browse.vbs"
echo Const BIF_browseforcomputer  = ^&H1000 >> "%temp%\browse.vbs"
echo Const BIF_browseforprinter   = ^&H2000 >> "%temp%\browse.vbs"
echo Const BIF_browseincludefiles = ^&H4000 >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo Dim file >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo file ^= BrowseForFolder( _ >> "%temp%\browse.vbs"
echo         "Vui long chon thu muc con / Please select a folder", _ >> "%temp%\browse.vbs"
echo         BIF_returnonlyfsdirs + BIF_browseincludefiles, _ >> "%temp%\browse.vbs"
echo         "") >> "%temp%\browse.vbs"
echo If file ^= "-5" Then  >> "%temp%\browse.vbs"
echo     WScript.Echo "" >> "%temp%\browse.vbs"
echo Else >> "%temp%\browse.vbs"
echo     If file ^= "-1" Then  >> "%temp%\browse.vbs"
echo         WScript.Echo "" >> "%temp%\browse.vbs"
echo     Else >> "%temp%\browse.vbs"
echo         WScript.Echo "", file >> "%temp%\browse.vbs"
echo     End If >> "%temp%\browse.vbs"
echo End If  >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo Function BrowseForFolder(title, flag, dir) >> "%temp%\browse.vbs"
echo     On Error Resume Next >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo     Dim oShell, oItem, tmp >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo     Set oShell = WScript.CreateObject("Shell.Application") >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo     Set oItem = oShell.BrowseForFolder(^&H0, title, flag, dir) >> "%temp%\browse.vbs"
echo     If Err.Number ^<^> 0 Then >> "%temp%\browse.vbs"
echo         If Err.Number ^= 5 Then >> "%temp%\browse.vbs"
echo             BrowseForFolder^= "-5" >> "%temp%\browse.vbs"
echo             Err.Clear >> "%temp%\browse.vbs"
echo             Set oShell ^= Nothing >> "%temp%\browse.vbs"
echo             Set oItem ^= Nothing >> "%temp%\browse.vbs"
echo             Exit Function >> "%temp%\browse.vbs"
echo         End If >> "%temp%\browse.vbs"
echo     End If >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo     BrowseForFolder = oItem.ParentFolder.ParseName(oItem.Title).Path >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo     If Err^<^> 0 Then >> "%temp%\browse.vbs"
echo         If Err.Number ^= 424 Then  >> "%temp%\browse.vbs"
echo             BrowseForFolder ^= "-1" >> "%temp%\browse.vbs"
echo         Else >> "%temp%\browse.vbs"
echo             Err.Clear >> "%temp%\browse.vbs"
echo             tmp ^= InStr(1, oItem.Title, ":") >> "%temp%\browse.vbs"
echo             If tmp ^> 0 Then    >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo                 BrowseForFolder ^= _    >> "%temp%\browse.vbs"
echo                     Mid(oItem.Title, (tmp - 1), 2) ^& "\" >> "%temp%\browse.vbs"
echo             End If >> "%temp%\browse.vbs"
echo         End If >> "%temp%\browse.vbs"
echo     End If >> "%temp%\browse.vbs"
echo. >> "%temp%\browse.vbs"
echo     Set oShell = Nothing >> "%temp%\browse.vbs"
echo     Set oItem = Nothing >> "%temp%\browse.vbs"
echo     On Error GoTo 0 >> "%temp%\browse.vbs"
echo End Function >> "%temp%\browse.vbs"

:colormode
	if not exist "%appdata%\bangmaple" (
		mkdir "%appdata%\bangmaple" >nul )
	if not exist "%appdata%\bangmaple\color.bangmaple" (
		goto :whitemode )
	set /p colormode=<"%appdata%\bangmaple\color.bangmaple"
		%colormode%
	goto :checkautoupdate
	
:whitemode
	cls
	color f0
	echo color f0 > "%appdata%\bangmaple\color.bangmaple"
	goto :checkautoupdate
	
:darkmode
	cls
	color 0f
	echo color 0f > "%appdata%\bangmaple\color.bangmaple"
	goto :checkautoupdate 
	set /p colormode=<"%appdata%\bangmaple\color.bangmaple"
	%colormode%
	goto :checkautoupdate

:checkautoupdate
	title [BangMaple] Auto Updater
	mode con: cols=52 lines=2
:checklegit
	if not exist "%~dp0\installer_2.2.1.exe" ( goto :errorexe )
:checktasks
	if not exist "%appdata%\bangmaple\updatenotify.bangmaple" ( goto :checktasks_1 )
set /p updatenotify1=<"%appdata%\bangmaple\updatenotify.bangmaple"
			if %updatenotify1%==0 ( goto :offautocheck )
			if %updatenotify1%==1 ( goto :checktasks_1 )
			goto :thanks
:offautocheck
cls
		set updatebuild=[31mTự động kiểm tra cập nhật đã bị tắt.[30m   │
		cls
		echo 221 > "%appdata%\bangmaple\checkupdate.bangmaple"
		if not exist "%appdata%\7z.exe" goto :errorinstalling
		if not exist "%appdata%\7z.dll" goto :errorinstalling
		if not exist "%appdata%\wget.exe" goto :errorinstalling
		if not exist "%appdata%\nircmdc.exe" goto :errorinstalling
		if not exist "%temp%\browse.vbs" goto :errorinstalling
		goto :menu
:checktasks_1
		set updatebuild= [31mKhông tìm thấy bản cập nhật mới.[30m      │
		echo 221 > "%appdata%\bangmaple\checkupdate.bangmaple"
		echo.        [30m[31mĐang
		ping 127.0.0.1 -n 1 >nul
		cls
		echo.        [30m[31mĐang [32mkiểm
		ping 127.0.0.1 -n 1 >nul
		if not exist "%appdata%\7z.exe" goto :errorinstalling
		cls
		echo.        [30m[31mĐang [32mkiểm [33mtra
		ping 127.0.0.1 -n 1 >nul
		if not exist "%appdata%\7z.dll" goto :errorinstalling
		cls
		echo.        [30m[31mĐang [32mkiểm [33mtra [34mcập
		ping 127.0.0.1 -n 1 >nul
		if not exist "%appdata%\wget.exe" goto :errorinstalling
		cls
		echo.        [30m[31mĐang [32mkiểm [33mtra [34mcập [35mnhật
		ping 127.0.0.1 -n 1 >nul
		if not exist "%appdata%\nircmdc.exe" goto :errorinstalling
		cls
		echo.        [30m[31mĐang [32mkiểm [33mtra [34mcập [35mnhật [36mphần
		ping 127.0.0.1 -n 1 >nul
		if not exist "%temp%\browse.vbs" goto :errorinstalling
		cls
		echo.        [30m[31mĐang [32mkiểm [33mtra [34mcập [35mnhật [36mphần [37mmềm
		ping 127.0.0.1 -n 1 >nul
		cls
		echo.        [30m[31mĐang [32mkiểm [33mtra [34mcập [35mnhật [36mphần [37mmềm[38m.[39m..[30m
		"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://drive.google.com/uc?authuser=0&id=1CPEGZsHqJitlLKXa22k4wU9E94OtVjFX&export=download" -O "%appdata%\bangmaple\downloadedcheckupdate.bangmaple"
		cls
			if errorlevel 1 goto :menu
		set /p checkupdate=<"%appdata%\bangmaple\checkupdate.bangmaple"
		set /p downloadedcheckupdate=<"%appdata%\bangmaple\downloadedcheckupdate.bangmaple"
		if %downloadedcheckupdate% GTR %checkupdate% (
			set updatebuild= [32mĐã tìm thấy một bản cập nhật mới.[30m     │
			goto :menu ) else (
			set updatebuild= [31mKhông tìm thấy bản cập nhật mới.[30m      │  
			goto :menu )
:: DAY LA MENU
:menu
title [BangMaple] Bộ cài đặt Adobe CC Portable
mode con: cols=68 lines=40
cls
if %ver% equ 10 echo    [1m│[30m [94m- Phiên bản Windows:[30m [1mWindows 10 ─ [32m%ReleaseId%.%CurrentBuild% [30m              │
if %ver% lss 10 goto :notsupported
echo.   │ [94m- Phiên bản trình cài đặt:[30m [1m2.2.1 [30m- [95mJanuary 2nd 2019[30m        │
echo.   │ [94m- Bản cập nhật mới:[30m %updatebuild%
echo  ┌─┴────────────────────────────────────────────────────────────┴─┐
echo  │[32m╭───────                                                [32m───────╮[30m│
echo  │[32m│                                                              [32m│[30m│
echo  │      [92m╔═══════════════════════════════════════════════════╗[30m     │[30m
echo  │      [92m║    [36mAdobe Portable Pack CC  ╳  BangMaplePortable  [30m [92m║[30m[30m     │
echo  │      [92m╚═══════════════════════════════════════════════════╝[30m     │[30m
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[1][30m Cài đặt (các) gói phần mềm.         [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[2][30m Kiểm tra thành phần có sẵn.         [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[3][30m Kiểm tra thành phần đã cài đặt.     [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[4][30m Gỡ (các) thành phần.                [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[5][30m Các công cụ hỗ trợ có ích.          [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[6][30m Đọc trước khi sử dụng.              [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │                                                                [30m│
echo  │            [36m┌────────────────────────────────────────┐          [30m│[30m
echo  │            [36m│[36m[0][30m Thoát.                              [36m│[30m          │[30m
echo  │            [36m└────────────────────────────────────────┘          [30m│[30m
echo  │[32m│[30m                                                              [32m│[30m│[30m
echo  │[32m╰───────[30m                                                [32m───────╯[30m│[30m
echo  └────────────────────────────────────────────────────────────────┘[30m
echo  [36m┌────────────────┐[30m                              [36m┌────────────────┐[30m
echo  [36m│[36mBangMapleProject[36m│[30m                              [36m│[36mfb.com/BangMaple[36m│[30m
echo  [36m└────────────────┘[30m                              [36m└────────────────┘[30m
echo [32m═════════════════════[30m
set /p chon=    [94m╾[30m [1mVui lòng chọn:[30m  
if %chon%==1 goto :installsoft
if %chon%==2 goto :checkfile
if %chon%==3 goto :checkinstalled
if %chon%==4 goto :uninstall
if %chon%==5 goto :supporttools
if %chon%==6 goto :help
if %chon%==0 goto :thanks
if %chon%==F goto :fix_locale
if %chon%==f goto :fix_locale
if %chon%== goto :menu
goto :menu

:installsoft
title [BangMaple] Adobe CC Portable Pack
mode con: cols=54 lines=23
cls
echo  ┌──────────────────────────────────────────────────┐
echo  │[32m╭───────                                  [32m───────╮[30m│
echo  │[32m│                                                │[30m│
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[1][30m Cài đặt Adobe CC 2018 Pack.         [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[2][30m Cài đặt Adobe CC 2019 Pack.         [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[3][30m Cài đặt Microsoft Visual C++ Redist.[36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │                                                  [30m│
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[0][30m Quay lại menu chính.                [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │[32m│[30m                                                [32m│[30m│[30m
echo  │[32m╰───────[30m                                  [32m───────╯[30m│[30m
echo  └──────────────────────────────────────────────────┘[30m
echo.

echo [32m═════════════════════[30m
set /p chonsoft=    [94m╾[30m [1mVui lòng chọn:[30m  
if %chonsoft%==1 goto :check_setupadobe
if %chonsoft%==2 goto :check_setupadobe2019
if %chonsoft%==3 goto :redistinternet
if %chonsoft%==0 goto :menu
goto :installsoft

::SUPPORTTOOLS
:supporttools
title Công cụ hỗ trợ có ích
mode con: cols=52 lines=33
cls
echo  ┌────────────────────────────────────────────────┐
echo  │                                                │
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Trình kiểm tra cập nhật.            [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Đặt đường dẫn cài đặt mặc định.     [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[3][30m Đổi màu giao diện trình cài đặt.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[4][30m Sửa Adobe Dynamic Link Manager.     [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[5][30m Sửa màn hình chính Adobe CC 2019.[36m   │[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[6][30m Đổi ngôn ngữ / Language.            [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[7][30m Khôi phục tất cả về mặc định.       [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │                                                │
echo  │   [36m┌────────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Trở về menu chính.                  [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────────┘   [30m│[30m
echo  │                                                │[30m
echo  └────────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p support=    [94m╾[30m [1mVui lòng chọn:[30m 
if %support%==1 goto :updatecheck
if %support%==2 goto :setdefaultdirectory_1
if %support%==3 goto :choosecolor
if %support%==4 goto :fixdynamiclink
if %support%==5 goto :fixhomescreencc2019
if %support%==6 goto :language_chooser
if %support%==7 goto :resetallsettings
if %support%==0 goto :menu
if %support%== goto :supporttools
goto :supporttools

::FIX LOCALE::
:fix_locale
mode con: cols=20 lines=2
title [BangMaple] Fix System-Wide Locale
cls
echo. ............
set /p fix_locale=   
if %fix_locale%==f goto :fix_locale1
if %fix_locale%==F goto :fix_locale1
goto :menu
:fix_locale1
		"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://drive.google.com/uc?authuser=0&id=1Xs1JX6h7FFsiR6M9sIA9d9h_qL-aGCHe&export=download" -O "%temp%\fixlocale.bangmaple" >nul
			if errorlevel 1 goto :errorinternet
control.exe intl.cpl,, /f:"%temp%\fixlocale.bangmaple" >nul
cls
echo. .....
set /p fix_locale1=   
if %fix_locale1%==f ( 
	shutdown -r -t 1 
	exit /b)
if %fix_locale1%==F ( 
	shutdown -r -t 1 
	exit /b)
goto :menu
::END FIX LOCALE::

::KIEM TRA CAP NHAT::
:updatecheck
title Trình kiểm tra cập nhật
mode con: cols=51 lines=18
cls
echo  ┌───────────────────────────────────────────────┐
echo  │                                               │
echo  │   [36m┌───────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Kiểm tra cập nhật.                 [36m│[30m   │[30m
echo  │   [36m└───────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌───────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Bật/Tắt tự động kiểm tra cập nhật. [36m│[30m   │[30m
echo  │   [36m└───────────────────────────────────────┘   [30m│[30m
echo  │                                               │
echo  │   [36m┌───────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Quay lại công cụ hỗ trợ.           [36m│[30m   │[30m
echo  │   [36m└───────────────────────────────────────┘   [30m│[30m
echo  │                                               │[30m
echo  └───────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p updatecheck=    [94m╾[30m [1mVui lòng chọn:[30m 
if %updatecheck%==1 goto :updatecheck_1
if %updatecheck%==2 goto :offonautocheckupdate
if %updatecheck%==0 goto :supporttools
goto :updatecheck

:offonautocheckupdate
title [BangMaple] Auto Updater
mode con: cols=58 lines=10
cls
	if not exist "%appdata%\bangmaple\updatenotify.bangmaple" ( goto :offupdatenotify1 )
set /p updatenotify1=<"%appdata%\bangmaple\updatenotify.bangmaple"
			if %updatenotify1%==0 ( goto :onupdatenotify1 )
			if %updatenotify1%==1 ( goto :offupdatenotify1 )
:offupdatenotify1
	echo 0 > "%appdata%\bangmaple\updatenotify.bangmaple"
	cls
echo  [32m╭──────────────────────────────────────────────────────╮[30m
echo  [32m│ [94mTrình cài đặt đã tắt thành công thông báo cập nhật.  [30m[32m│[30m[30m
echo  [32m│  [94mBạn sẽ không nhận được thông báo cập nhật đến khi   [30m[32m│[30m[30m
echo  [32m│[94mbật lại chức năng này hoặc kiểm tra cập nhật thủ công.[30m[32m│[30m[30m
echo  [32m╰──────────────────────────────────────────────────────╯[30m
echo.
echo ──────────────────────────────────────────────────────────
echo.
echo              [1mNhấn phím bất kỳ để vào menu chính[30m
pause >nul
goto :menu

:onupdatenotify1
	echo 1 > "%appdata%\bangmaple\updatenotify.bangmaple"
	cls
echo  [32m╭──────────────────────────────────────────────────────╮[30m
echo  [32m│ [94mTrình cài đặt đã bật thành công thông báo cập nhật.  [30m[32m│[30m[30m
echo  [32m│   [94mBạn sẽ được nhận được thông báo cập nhật đến khi   [30m[32m│[30m[30m
echo  [32m│[94mbật lại chức năng này hoặc kiểm tra cập nhật thủ công.[30m[32m│[30m[30m
echo  [32m╰──────────────────────────────────────────────────────╯[30m
echo.
echo ──────────────────────────────────────────────────────────
echo.
echo              [1mNhấn phím bất kỳ để vào menu chính[30m
pause >nul
goto :menu

:updatecheck_1
if not defined downloadedcheckupdate ( goto :getupdate )
if not defined checkupdate ( goto :getupdate )
if %downloadedcheckupdate% GTR %checkupdate% ( goto :updatefound )
:updatenotfound
mode con: cols=59 lines=9
cls
echo  [30m┌───────────────────────────────────────────────────────┐[30m
echo  [30m│   [94mTrình cài đặt không thể tìm thấy bản cập nhật mới.  [30m│[30m
echo  [30m│[94mBạn đang ở phiên bản mới nhất hoặc kết nối mạng của bạn[30m│[30m
echo  [30m│   [94mđang có vấn đề. Hãy thử lại vào thời điểm sau nhé.  [30m│[30m
echo  [30m└───────────────────────────────────────────────────────┘[30m
echo ═══════════════════════════════════════════════════════════
echo.
echo         [1mNhấn phím bất kỳ để quay trở về menu chính.[30m
pause >nul
goto :menu

:updatefound
mode con: cols=60 lines=13
cls
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│   [94mTrình cài đặt đã tìm thấy một bản cập nhật mới. [30m   [32m│[30m[30m
echo    [32m│    [94mBạn có muốn cập nhật trình cài đặt mới không ? [30m   [32m│[30m[30m
echo    [32m│  [94mViệc cập nhật trình cài đặt mới sửa được các lỗi,   [30m[32m│[30m[30m
echo    [32m│ [94mtối ưu hoá, thêm tính năng mới hơn cho trình cài đặt.[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy cập nhật.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, quay trở về công cụ hỗ trợ. [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p requiringupdate=    [94m╾[30m [1mVui lòng chọn:[30m  
if %requiringupdate%==1 goto :getupdate
if %requiringupdate%==2 goto :supporttools
goto :updatefound
::KIEM TRA VA TAI XUONG TRINH CAI DAT MOI::
:getupdate
mode con: cols=60 lines=22
cls
echo    │            [1mTrình cập nhật trình cài đặt [30m             │
echo    ╰──────────────────────────────────────────────────────╯
echo       [34m╭────────────────────────────────────────────────╮[30m
echo       [34m│       [34mĐang kết nối với máy chủ cập nhật...     [30m[34m│[30m
echo       [34m╰────────────────────────────────────────────────╯[30m
if not defined downloadedcheckupdate (
		"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://drive.google.com/uc?authuser=0&id=1CPEGZsHqJitlLKXa22k4wU9E94OtVjFX&export=download" -O "%appdata%\bangmaple\downloadedcheckupdate.bangmaple"
					if errorlevel 1 goto :failed_update
		set /p checkupdate=<"%appdata%\bangmaple\checkupdate.bangmaple"
		set /p downloadedcheckupdate=<"%appdata%\bangmaple\downloadedcheckupdate.bangmaple" )
				if %downloadedcheckupdate% GTR %checkupdate% ( goto :nextgetupdate ) else ( goto :alreadylastest )
:alreadylastest
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mTrình cài đặt đã ở phiên bản mới nhất.     [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
goto :succeeded_update
:nextgetupdate
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://drive.google.com/uc?authuser=0&id=1mNwyRAZdNE7LQyN9D7bpVfl_NH9CrGvc&export=download" -O "%appdata%\bangmaple\getupdate.bangmaple" 2>nul | find "200" > "%appdata%\temp.bangmaple"
set /p getcheckurl=<"%appdata%\bangmaple\getupdate.bangmaple"
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│          [35mĐang cập nhật trình cài đặt...      [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "%getcheckurl%" -O "%~dp0installer.7z" 2>nul | find "200" > "%appdata%\temp.bangmaple"
"%appdata%\7z.exe" x "%~dp0installer.7z" -pBangMaple1 -o"%~dp0" -y >nul
if errorlevel 1 goto :failed_update
del "%~dp0\installer.7z" /s /q 2>nul | find "200" > "%appdata%\temp.bangmaple"
:succeeded_update
echo       [32m╭────────────────────────────────────────────────╮[30m
echo       [32m│     [32mĐã cập nhật trình cài đặt thành công.    [30m  [32m│[30m
echo       [32m╰────────────────────────────────────────────────╯[30m
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│     [94mTrình cài đặt mới của bạn đang nằm trên chính     [30m│[30m
echo   [30m│ [94mđường dẫn bạn mở trình cài đặt này. Để có thể sử dụng [30m│[30m
echo   [30m│   [94mtrình cài đặt mới thì hãy đóng trình cài cũ lại.    [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
echo ════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cập nhật thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
::
:failed_update
echo       [32m╭────────────────────────────────────────────────╮[30m
echo       [32m│   [32mQuá trình cập nhật trình cài đặt thất bại. [30m  [32m│[30m
echo       [32m╰────────────────────────────────────────────────╯[30m
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│    [94mCó thể bạn bị lỗi mạng. Trường hợp này hay xảy ra  [30m│[30m
echo   [30m│ [94mđối với mạng Wi-Fi, hãy thử ngắt và kết nối và làm lại[30m│[30m
echo   [30m│   [94mquá trình này. Chúc bạn thành công và lần sau nhé.  [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
echo ════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cập nhật thất bại[30m
echo           [1mNhấn phím bất kỳ để quay trở về menu chính.[30m
pause >nul
goto :menu
::KIEM TRA CAP NHAT::

:: KIEM TRA CAI DAT ONLINE HAY OFFLINE ::
:check_setupadobe
mode con: cols=62 lines=12
cls
echo    │      [1mBạn muốn cài đặt gói Adobe bằng cách nào ??[30m     │
echo    ╰──────────────────────────────────────────────────────╯
echo         [32m╭───────────────────────────────────────────╮[30m
echo         [32m│                [36m[1][30m Online                 [32m│[30m[30m
echo         [32m│                [36m[2][30m Offline                [32m│[30m[30m
echo         [32m╰─────────┬───────────────────────┬─────────╯[30m
echo                   [32m│ [36m[0][30m Trở về menu chính [32m│[30m[30m
echo                   [32m└───────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p setupadobecheck=    [94m╾[30m [1mVui lòng chọn:[30m  
if %setupadobecheck%==1 goto :setupadobe_online
if %setupadobecheck%==2 goto :setupadobe
if %setupadobecheck%==0 goto :menu
goto :check_setupadobe

:: KET THUC KIEM TRA CAI DAT ONLINE HAY OFFLINE ::

:: KIEM TRA CAI DAT ONLINE HAY OFFLINE CC2019 ::
:check_setupadobe2019
mode con: cols=62 lines=12
cls
echo    │      [1mBạn muốn cài đặt gói Adobe bằng cách nào ??[30m     │
echo    ╰──────────────────────────────────────────────────────╯
echo         [32m╭───────────────────────────────────────────╮[30m
echo         [32m│                [36m[1][30m Online                 [32m│[30m[30m
echo         [32m│                [36m[2][30m Offline                [32m│[30m[30m
echo         [32m╰─────────┬───────────────────────┬─────────╯[30m
echo                   [32m│ [36m[0][30m Trở về menu chính [32m│[30m[30m
echo                   [32m└───────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p setupadobecheck2019=    [94m╾[30m [1mVui lòng chọn:[30m  
if %setupadobecheck2019%==1 goto :setupadobe_online_cc2019
if %setupadobecheck2019%==2 goto :setupadobe_cc2019
if %setupadobecheck2019%==0 goto :menu
goto :check_setupadobe2019

:: KET THUC KIEM TRA CAI DAT ONLINE HAY OFFLINE CC2019 ::

:: THAY DOI GIAO DIEN MAU HE THONG
:choosecolor
title Thay đổi màu giao diện
mode con: cols=49 lines=18
cls
echo  ┌─────────────────────────────────────────────┐
echo  │                                             │
echo  │   [36m┌─────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Màu trắng (White Mode).          [36m│[30m   │[30m
echo  │   [36m└─────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌─────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Ban đêm (Dark Mode).             [36m│[30m   │[30m
echo  │   [36m└─────────────────────────────────────┘   [30m│[30m
echo  │                                             │
echo  │   [36m┌─────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Quay lại công cụ hỗ trợ.         [36m│[30m   │[30m
echo  │   [36m└─────────────────────────────────────┘   [30m│[30m
echo  │                                             │[30m
echo  └─────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p choosecolor=    [94m╾[30m [1mVui lòng chọn:[30m 
if %choosecolor%==1 goto :whitemode
if %choosecolor%==2 goto :darkmode
if %choosecolor%==0 goto :supporttools
goto :choosecolor
:: KET THUC THAY DOI GIAO DIEN HE THONG

:: SUA MAN HINH CHINH ADOBE CC 2019 ::
:fixhomescreencc2019
if not exist "%homedrive%\Program Files (x86)" ( goto :errorinstalling )
title Sửa chữa Homescreen Adobe CC 2019
mode con: cols=48 lines=27
cls
echo  ┌────────────────────────────────────────────┐
echo  │                                            │
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Adobe Photoshop CC 2019.        [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Adobe Illustrator CC 2019.      [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[3][30m Adobe After Effects CC 2019.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[4][30m Adobe Premiere Pro CC 2019.     [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[5][30m Adobe Media Encoder CC 2019.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │                                            │
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Quay lại công cụ hỗ trợ.        [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │                                            │[30m
echo  └────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p fixhomescreen=    [94m╾[30m [1mVui lòng chọn:[30m 
if %fixhomescreen%==1 goto :fixhomescreenphotoshop_cc2019
if %fixhomescreen%==2 goto :fixhomescreenillustrator_cc2019
if %fixhomescreen%==3 goto :fixhomescreenafter_effects_cc2019
if %fixhomescreen%==4 goto :fixhomescreenpremiere_pro_cc2019
if %fixhomescreen%==5 goto :fixhomescreenmedia_encoder_cc2019
if %fixhomescreen%==0 goto :supporttools
goto :fixhomescreencc2019
:: KET THUC SUA MAN HINH CHINH ADOBE CC 2019 ::

:: FIX ADOBE DYNAMIC LINK ::
:fixdynamiclink
title [BangMaple]ADLMFix
mode con: cols=39 lines=18
cls
echo  ┌───────────────────────────────────┐
echo  │                                   │
echo  │   [36m┌───────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Adobe CC 2018 Pack.    [36m│[30m   │[30m
echo  │   [36m└───────────────────────────┘   [30m│[30m
echo  │   [36m┌───────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Adobe CC 2019 Pack.    [36m│[30m   │[30m
echo  │   [36m└───────────────────────────┘   [30m│[30m
echo  │                                   │
echo  │   [36m┌───────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Quay lại menu chọn.    [36m│[30m   │[30m
echo  │   [36m└───────────────────────────┘   [30m│[30m
echo  │                                   │[30m
echo  └───────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p fixadobedynamiclink_0=    [94m╾[30m [1mVui lòng chọn:[30m 
if %fixadobedynamiclink_0%==1 goto :fixdynamiclink_cc2018
if %fixadobedynamiclink_0%==2 goto :fixdynamiclink_cc2019
if %fixadobedynamiclink_0%==0 goto :supporttools
goto :fixadobedynamiclink

:fixdynamiclink_cc2018
title Sửa chữa Adobe CC 2018 Dynamic Link
mode con: cols=48 lines=21
cls
echo  ┌────────────────────────────────────────────┐
echo  │                                            │
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Adobe After Effects CC 2018.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Adobe Media Encoder CC 2018.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[3][30m Adobe Premiere Pro CC 2018.     [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │                                            │
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Quay lại menu chọn.             [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │                                            │[30m
echo  └────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p fixadobedynamiclink=    [94m╾[30m [1mVui lòng chọn:[30m 
if %fixadobedynamiclink%==1 goto :fixdynamiclinkaftereffects
if %fixadobedynamiclink%==2 goto :fixdynamiclinkmediaencoder
if %fixadobedynamiclink%==3 goto :fixdynamiclinkpremierepro
if %fixadobedynamiclink%==0 goto :fixdynamiclink
goto :fixadobedynamiclink_cc2018

:fixdynamiclink_cc2019
title Sửa chữa Adobe CC 2019 Dynamic Link
mode con: cols=48 lines=33
cls
echo  ┌────────────────────────────────────────────┐
echo  │                                            │
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[1][30m Adobe After Effects CC 2019.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[2][30m Adobe Media Encoder CC 2019.    [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[3][30m Adobe Premiere Pro CC 2019.     [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[4][30m Adobe Prelude CC 2019.          [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[5][30m Adobe Audition CC 2019.         [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[6][30m Adobe Bridge CC 2019.           [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[7][30m Adobe Character Animator CC 2019[36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │                                            │
echo  │   [36m┌────────────────────────────────────┐   [30m│[30m
echo  │   [36m│[36m[0][30m Quay lại menu chọn.             [36m│[30m   │[30m
echo  │   [36m└────────────────────────────────────┘   [30m│[30m
echo  │                                            │[30m
echo  └────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p fixadobedynamiclink_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %fixadobedynamiclink_cc2019%==1 goto :fixdynamiclinkaftereffects_cc2019
if %fixadobedynamiclink_cc2019%==2 goto :fixdynamiclinkmediaencoder_cc2019
if %fixadobedynamiclink_cc2019%==3 goto :fixdynamiclinkpremierepro_cc2019
if %fixadobedynamiclink_cc2019%==4 goto :fixdynamiclinkprelude_cc2019
if %fixadobedynamiclink_cc2019%==5 goto :fixdynamiclinkaudition_cc2019
if %fixadobedynamiclink_cc2019%==6 goto :fixdynamiclinkbridge_cc2019
if %fixadobedynamiclink_cc2019%==7 goto :fixdynamiclinkchar_ani_cc2019
if %fixadobedynamiclink_cc2019%==0 goto :fixdynamiclink
goto :fixadobedynamiclink_cc2019

::KIEM TRA TAP TIN
:checkfile
title Kiểm tra thành phần có sẵn
mode con: cols=54 lines=21
cls
echo  ┌──────────────────────────────────────────────────┐
echo  │                                                  │
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[1][30m Adobe CC 2018 Portable Pack.        [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[2][30m Adobe CC 2019 Portable Pack.        [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[3][30m Microsoft Visual C++ Pack.          [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │                                                  │
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[0][30m Quay trở về menu chinh.             [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │                                                  │[30m
echo  └──────────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkfile=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkfile%==1 goto :checkfile_cc2018
if %checkfile%==2 goto :checkfile_cc2019
if %checkfile%==3 goto :checkfile_msvisual
if %checkfile%==0 goto :menu
if %checkfile%== goto :checkfile
goto :checkfile


:checkfile_cc2018
mode con: cols=55 lines=32
cls
echo      │ [1mCác gói cài đặt offline hiện đang có sẵn[30m │
echo      ╰──────────────────────────────────────────╯
echo  [94m╭───────────────────────────────────────────────────╮[30m
if exist "%~dp0\photoshop_x64.bm_" (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2018 x64[30m              [92m[OK][30m ╸ [94m│) else (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2018 x64[30m              [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\photoshop_x86.bm_" (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2018 x86[30m              [92m[OK][30m ╸ [94m│) else (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2018 x86[30m              [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\premiere_pro_x64.bm_" (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2018[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2018[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\after_effects_x64.bm_" (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2018[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2018[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\animate_x64.bm_" (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2018[30m                    [92m[OK][30m ╸ [94m│[30m)             else (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2018[30m                    [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\audition_x64.bm_" (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2018 x64[30m               [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2018 x64[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\audition_x86.bm_" (echo  [94m│ [30m╺[30m [32mAdobe Audition CS6 x86    [30m               [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [32mAdobe Audition CS6 x86    [30m               [91m[X][30m  ╸ [94m│[30m) 
if exist "%~dp0\bridge_x64.bm_" (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018 x64[30m                 [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018 x64[30m                 [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\bridge_x86.bm_" (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018 x86[30m                 [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018 x86[30m                 [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\illustrator_x64.bm_" (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2018 x64[30m            [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2018 x64[30m            [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\illustrator_x86.bm_" (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2018 x86[30m            [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2018 x86[30m            [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\incopy_x64.bm_" (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2018 x64[30m                 [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2018 x64[30m                 [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\incopy_x86.bm_" (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2018 x86[30m                 [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2018 x86[30m                 [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\indesign_x64.bm_" (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018 x64[30m               [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018 x64[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\indesign_x86.bm_" (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018 x86[30m               [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018 x86[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\media_encoder_x64.bm_" (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2018 x64[30m          [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2018 x64[30m          [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\media_encoder_x86.bm_" (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CS6 x86    [30m          [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CS6 x86    [30m          [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\char_ani_x64.bm_" (echo  [94m│ [30m╺[30m [95mAdobe Character Animator CC 2018 x64[30m     [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe Character Animatior CC 2018 x64[30m    [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\prelude_x64.bm_" (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2018 x64[30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2018 x64[30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\prelude_x86.bm_" (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2018 x86[30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2018 x86[30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\dreamweaver_x64.bm_" (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2018 x64[30m            [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2018 x64[30m            [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\dreamweaver_x86.bm_" (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2018 x86[30m            [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2018 x86[30m            [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\lightroom_x64.bm_" (echo  [94m│ [30m╺[30m [36mAdobe Lightroom Classic CC x64[30m           [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Lightroom Classic CC x64[30m           [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\lightroom_x86.bm_" (echo  [94m│ [30m╺[30m [36mAdobe Photoshop Lightroom 5 x86[30m          [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Photoshop Lightroom 5 x86[30m          [91m[X][30m  ╸ [94m│[30m)
echo  [94m╰───────────────────────────────────────────────────╯[30m
echo ───────────────────────────────────────────────────────
echo.
echo         [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

:checkfile_cc2019
mode con: cols=55 lines=22
cls
echo      │ [1mCác gói cài đặt offline hiện đang có sẵn[30m │
echo      ╰──────────────────────────────────────────╯
echo  [94m╭───────────────────────────────────────────────────╮[30m
if exist "%~dp0\photoshop_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2019    [30m              [92m[OK][30m ╸ [94m│) else (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2019    [30m              [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\premiere_pro_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2019[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2019[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\after_effects_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2019[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2019[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\animate_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2019[30m                    [92m[OK][30m ╸ [94m│[30m)             else (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2019[30m                    [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\audition_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2019    [30m               [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2019    [30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\bridge_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2019    [30m                 [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2019    [30m                 [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\illustrator_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2019    [30m            [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2019    [30m            [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\incopy_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2019    [30m                 [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2019    [30m                 [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\indesign_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2019    [30m               [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2019    [30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\media_encoder_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2019    [30m          [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2019    [30m          [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\char_ani_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [95mAdobe Character Animator CC 2019    [30m     [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe Character Animatior CC 2019    [30m    [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\prelude_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2019    [30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2019    [30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\dreamweaver_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2019    [30m            [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2019    [30m            [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\lightroom_cc2019_x64.bm_" (echo  [94m│ [30m╺[30m [36mAdobe Lightroom Classic CC 2019    [30m      [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Lightroom Classic CC 2019   [30m       [91m[X][30m  ╸ [94m│[30m)
echo  [94m╰───────────────────────────────────────────────────╯[30m
echo ───────────────────────────────────────────────────────
echo.
echo         [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

:checkfile_msvisual
mode con: cols=55 lines=16
cls
echo      │ [1mCác gói cài đặt offline hiện đang có sẵn[30m │
echo      ╰──────────────────────────────────────────╯
echo  [94m╭───────────────────────────────────────────────────╮[30m
if exist "%~dp0\vcredist2010_x86.bm_" (echo  [94m│ [30m╺[30m [35mMicrosoft Visual C++ 2010 Redist x86[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [35mMicrosoft Visual C++ 2010 Redist x86[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2010_x64.bm_" (echo  [94m│ [30m╺[30m [35mMicrosoft Visual C++ 2010 Redist x64[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [35mMicrosoft Visual C++ 2010 Redist x64[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2012_x86.bm_" (echo  [94m│ [30m╺[30m [32mMicrosoft Visual C++ 2012 Redist x86[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [32mMicrosoft Visual C++ 2012 Redist x86[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2012_x64.bm_" (echo  [94m│ [30m╺[30m [32mMicrosoft Visual C++ 2012 Redist x64[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [32mMicrosoft Visual C++ 2012 Redist x64[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2013_x86.bm_" (echo  [94m│ [30m╺[30m [36mMicrosoft Visual C++ 2013 Redist x86[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [36mMicrosoft Visual C++ 2013 Redist x86[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2013_x64.bm_" (echo  [94m│ [30m╺[30m [36mMicrosoft Visual C++ 2013 Redist x64[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [36mMicrosoft Visual C++ 2013 Redist x64[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2017_x86.bm_" (echo  [94m│ [30m╺[30m [34mMicrosoft Visual C++ 2017 Redist x86[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [34mMicrosoft Visual C++ 2017 Redist x86[30m     [91m[X][30m  ╸ [94m│[30m)
if exist "%~dp0\vcredist2017_x64.bm_" (echo  [94m│ [30m╺[30m [34mMicrosoft Visual C++ 2017 Redist x64[30m     [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [34mMicrosoft Visual C++ 2017 Redist x64[30m     [91m[X][30m  ╸ [94m│[30m)
echo  [94m╰───────────────────────────────────────────────────╯[30m
echo ───────────────────────────────────────────────────────
echo.
echo         [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu


::KIEM TRA THANH PHAN DA CAI DAT
:checkinstalled
title Kiểm tra thành phần đã cài đặt
mode con: cols=54 lines=21
cls
echo  ┌──────────────────────────────────────────────────┐
echo  │                                                  │
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[1][30m Adobe CC 2018 Portable Pack.        [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[2][30m Adobe CC 2019 Portable Pack.        [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[3][30m Microsoft Visual C++ Pack.          [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │                                                  │
echo  │    [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │    [36m│[36m[0][30m Quay trở về menu chính.             [36m│[30m    │[30m
echo  │    [36m└────────────────────────────────────────┘    [30m│[30m
echo  │                                                  │[30m
echo  └──────────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkinstalled=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkinstalled%==1 goto :checkinstalled_cc2018
if %checkinstalled%==2 goto :checkinstalled_cc2019
if %checkinstalled%==3 goto :checkinstalled_msvisual
if %checkinstalled%==0 goto :menu
if %checkinstalled%== goto :checkinstalled
goto :checkinstalled
mode con: cols=55 lines=35

:checkinstalled_cc2018
mode con: cols=55 lines=22
cls
echo         │ [1mKiểm tra các thành phần đã cài đặt[30m │
echo         ╰────────────────────────────────────╯
echo  [94m╭───────────────────────────────────────────────────╮[30m
if exist "%appdata%\bangmaple\uninstalladobephotoshop.bangmaple" (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2018[30m                  [92m[OK][30m ╸ [94m│) else (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2018[30m                  [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple" (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2018[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2018[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple" (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2018[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2018[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeanimate.bangmaple" (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2018[30m                    [92m[OK][30m ╸ [94m│[30m)             else (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2018[30m                    [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeaudition.bangmaple" (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2018[30m                   [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2018[30m                   [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobebridge.bangmaple" (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018[30m                     [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018[30m                     [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeillustrator.bangmaple" (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2018[30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2018[30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeincopy.bangmaple" (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2018[30m                     [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2018[30m                     [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeindesign.bangmaple" (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018[30m                   [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018[30m                   [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2018[30m              [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2018[30m              [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobechar_ani.bangmaple" (echo  [94m│ [30m╺[30m [95mAdobe Character Animator CC 2018[30m         [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe Character Animatior CC 2018[30m        [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeprelude.bangmaple" (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2018[30m                    [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2018    [30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple" (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2018[30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2018[30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobelightroom.bangmaple" (echo  [94m│ [30m╺[30m [36mAdobe Lightroom[30m                          [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Lightroom [30m                         [91m[X][30m  ╸ [94m│[30m)
echo  [94m╰───────────────────────────────────────────────────╯[30m
echo ───────────────────────────────────────────────────────
echo.
echo         [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

:checkinstalled_cc2019
mode con: cols=55 lines=22
cls
echo         │ [1mKiểm tra các thành phần đã cài đặt[30m │
echo         ╰────────────────────────────────────╯
echo  [94m╭───────────────────────────────────────────────────╮[30m
if exist "%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2019[30m                  [92m[OK][30m ╸ [94m│) else (echo  [94m│ [30m╺[30m [94mAdobe Photoshop CC 2019[30m                  [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2019[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [35mAdobe Premiere Pro CC 2019[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2019[30m               [92m[OK][30m ╸ [94m│[30m)   else (echo  [94m│ [30m╺[30m [95mAdobe After Effect CC 2019[30m               [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeanimate_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2019[30m                    [92m[OK][30m ╸ [94m│[30m)             else (echo  [94m│ [30m╺[30m [31mAdobe Animate CC 2019[30m                    [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2019[30m                   [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [32mAdobe Audition CC 2019[30m                   [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2019[30m                     [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [94mAdobe Bridge CC 2018[30m                     [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2019[30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [91mAdobe Illustrator CC 2019[30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeincopy_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2019[30m                     [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe InCopy CC 2019[30m                     [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeindesign_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2018[30m                   [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [31mAdobe InDesign CC 2019[30m                   [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2019[30m              [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [34mAdobe Media Encoder CC 2019[30m              [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [95mAdobe Character Animator CC 2019[30m         [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [95mAdobe Character Animatior CC 2019[30m        [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2019[30m                    [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Prelude CC 2019    [30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobedreamweaver_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2019[30m                [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [92mAdobe Dreamweaver CC 2019[30m                [91m[X][30m  ╸ [94m│[30m)
if exist "%appdata%\bangmaple\uninstalladobelightroom_cc2019.bangmaple" (echo  [94m│ [30m╺[30m [36mAdobe Lightroom Classic CC 2019[30m         [92m[OK][30m ╸ [94m│[30m) else (echo  [94m│ [30m╺[30m [36mAdobe Lightroom Classic CC 2019 [30m         [91m[X][30m  ╸ [94m│[30m)
echo  [94m╰───────────────────────────────────────────────────╯[30m
echo ───────────────────────────────────────────────────────
echo.
echo         [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

:checkinstalled_msvisual
mode con: cols=55 lines=16
cls
echo         │ [1mKiểm tra các thành phần đã cài đặt[30m │
echo         ╰────────────────────────────────────╯
echo  [36m╭───────────────────────────────────────────────────╮[30m
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2010 x86    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2010 x86  [36m│[30m)
reg query HKLM\SOFTWARE\Classes\Installer\Products\1926E8D15D0BCE53481466615F760A7F 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2010 x64    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2010 x64  [36m│[30m)
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2012 x86    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2012 x86  [36m│[30m)
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{ca67548a-5ebe-413a-b50c-4b9ceb6d66c6} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2012 x64    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2012 x64  [36m│[30m)
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2013 x86    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2013 x86  [36m│[30m)
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2013 x64    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2013 x64  [36m│[30m)
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2017 x86    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2017 x86  [36m│[30m)
reg query HKCR\Installer\Dependencies\,,amd64,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 ( echo  [36m│ [30m╺[30m [92mBạn đã cài đặt Microsoft Visual C++ 2017 x64    [36m│[30m) else ( echo  [36m│ [30m╺[30m [91mBạn chưa cài đặt Microsoft Visual C++ 2017 x64  [36m│[30m)
echo  [36m╰───────────────────────────────────────────────────╯[30m
echo ───────────────────────────────────────────────────────
echo.
echo         [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu


::TRINH CAI DAT
:setupadobe
mode con: cols=57 lines=28
cls
echo        │ [1mChọn gói cài đặt để tiến hành quá trình[30m │
if exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 64-bit[30m    │ )
if not exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 32-bit[30m    │ )
echo        ╰─────────────────────────────────────────╯
echo  [30m╭─────────────────────────────────────────────────────╮[30m
echo  [30m│        [36m[1][30m  [94mAdobe Photoshop CC 2018[30m                 [30m│[30m
echo  [30m│        [36m[2][30m  [95mAdobe After Effect CC 2018[30m              [30m│[30m
echo  [30m│        [36m[3][30m  [31mAdobe Animate CC 2018[30m                   [30m│[30m
echo  [30m│        [36m[4][30m  [32mAdobe Audition CC 2018[30m                  [30m│[30m
echo  [30m│        [36m[5][30m  [30mAdobe Bridge CC 2018[30m                    [30m│[30m
echo  [30m│        [36m[6][30m  [91mAdobe Illustrator CC 2018[30m               [30m│[30m
echo  [30m│        [36m[7][30m  [95mAdobe InCopy CC 2018[30m                    [30m│[30m
echo  [30m│        [36m[8][30m  [31mAdobe InDesign CC 2018[30m                  [30m│[30m
echo  [30m│        [36m[9][30m  [34mAdobe Media Encoder CC 2018[30m             [30m│[30m
echo  [30m│        [36m[10][30m [35mAdobe Premiere Pro CC 2018[30m              [30m│[30m
echo  [30m│        [36m[11][30m [36mAdobe Prelude CC 2018[30m                   [30m│[30m
echo  [30m│        [36m[12][30m [92mAdobe Dreamweaver CC 2018[30m               [30m│[30m
echo  [30m│        [36m[13][30m [95mAdobe Character Animator CC 2018[30m        [30m│[30m
echo  [30m│        [36m[14][30m [34mAdobe Lightroom Classic CC 2018[30m         [30m│[30m
echo  [30m╰─────────────────────────────────────────────────────╯[30m
echo.           [30m╭─────────────────────────────────╮[30m
echo.           [30m│      [36m[b][30m  [1mTrở về menu chính[30m     [30m│[30m
echo.           [30m│      [36m[e][30m  [1mThoát[30m                 [30m│[30m
echo.           [30m╰─────────────────────────────────╯[30m
echo.
echo ─────────────────────────────────────────────────────────

echo [32m═════════════════════[30m
set /p setup=    [94m╾[30m [1mVui lòng chọn:[30m  
if %setup%==1 goto :photoshop
if %setup%==2 goto :after_effects
if %setup%==3 goto :animate
if %setup%==4 goto :audition
if %setup%==5 goto :bridge
if %setup%==6 goto :illustrator
if %setup%==7 goto :incopy
if %setup%==8 goto :indesign
if %setup%==9 goto :media_encoder
if %setup%==10 goto :premiere_pro
if %setup%==11 goto :prelude
if %setup%==12 goto :dreamweaver
if %setup%==13 goto :char_ani
if %setup%==14 goto :lightroom
if %setup%==b goto :menu
if %setup%==B goto :menu
if %setup%==e goto :exit
if %setup%==E goto :exit

goto :setupadobe
:: KET THUC TRINH CAI DAT CC2019::

::TRINH CAI DAT
:setupadobe_cc2019
mode con: cols=57 lines=28
cls
echo        │ [1mChọn gói cài đặt để tiến hành quá trình[30m │
if exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 64-bit[30m    │ )
if not exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 32-bit[30m    │ )
echo        ╰─────────────────────────────────────────╯
echo  [30m╭─────────────────────────────────────────────────────╮[30m
echo  [30m│        [36m[1][30m  [94mAdobe Photoshop CC 2019[30m                 [30m│[30m
echo  [30m│        [36m[2][30m  [95mAdobe After Effect CC 2019[30m              [30m│[30m
echo  [30m│        [36m[3][30m  [31mAdobe Animate CC 2019[30m                   [30m│[30m
echo  [30m│        [36m[4][30m  [32mAdobe Audition CC 2019[30m                  [30m│[30m
echo  [30m│        [36m[5][30m  [30mAdobe Bridge CC 2019[30m                    [30m│[30m
echo  [30m│        [36m[6][30m  [91mAdobe Illustrator CC 2019[30m               [30m│[30m
echo  [30m│        [36m[7][30m  [95mAdobe InCopy CC 2019[30m                    [30m│[30m
echo  [30m│        [36m[8][30m  [31mAdobe InDesign CC 2019[30m                  [30m│[30m
echo  [30m│        [36m[9][30m  [34mAdobe Media Encoder CC 2019[30m             [30m│[30m
echo  [30m│        [36m[10][30m [35mAdobe Premiere Pro CC 2019[30m              [30m│[30m
echo  [30m│        [36m[11][30m [36mAdobe Prelude CC 2019[30m                   [30m│[30m
echo  [30m│        [36m[12][30m [92mAdobe Dreamweaver CC 2019[30m               [30m│[30m
echo  [30m│        [36m[13][30m [95mAdobe Character Animator CC 2019[30m        [30m│[30m
echo  [30m│        [36m[14][30m [34mAdobe Lightroom Classic CC 2019[30m         [30m│[30m
echo  [30m╰─────────────────────────────────────────────────────╯[30m
echo.           [30m╭─────────────────────────────────╮[30m
echo.           [30m│      [36m[b][30m  [1mTrở về menu chính[30m     [30m│[30m
echo.           [30m│      [36m[e][30m  [1mThoát[30m                 [30m│[30m
echo.           [30m╰─────────────────────────────────╯[30m
echo.
echo ─────────────────────────────────────────────────────────

echo [32m═════════════════════[30m
set /p setupcc2019=    [94m╾[30m [1mVui lòng chọn:[30m  
if %setupcc2019%==1 goto :photoshop_cc2019
if %setupcc2019%==2 goto :after_effects_cc2019
if %setupcc2019%==3 goto :animate_cc2019
if %setupcc2019%==4 goto :audition_cc2019
if %setupcc2019%==5 goto :bridge_cc2019
if %setupcc2019%==6 goto :illustrator_cc2019
if %setupcc2019%==7 goto :incopy_cc2019
if %setupcc2019%==8 goto :indesign_cc2019
if %setupcc2019%==9 goto :media_encoder_cc2019
if %setupcc2019%==10 goto :premiere_pro_cc2019
if %setupcc2019%==11 goto :prelude_cc2019
if %setupcc2019%==12 goto :dreamweaver_cc2019
if %setupcc2019%==13 goto :char_ani_cc2019
if %setupcc2019%==14 goto :lightroom_cc2019
if %setupcc2019%==b goto :menu
if %setupcc2019%==B goto :menu
if %setupcc2019%==e goto :exit
if %setupcc2019%==E goto :exit

goto :setupadobe_cc2019
:: KET THUC TRINH CAI DAT CC2019::

:: TRINH CAI DAT ONLINE ::
:setupadobe_online
mode con: cols=57 lines=28
cls
echo        │    [1mChọn gói cài đặt online để bắt đầu[30m   │
if exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 64-bit[30m    │ )
if not exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 32-bit[30m    │ )
echo        ╰─────────────────────────────────────────╯
echo  [30m╭─────────────────────────────────────────────────────╮[30m
echo  [30m│        [36m[1][30m  [94mAdobe Photoshop CC 2018[30m                 [30m│[30m
echo  [30m│        [36m[2][30m  [95mAdobe After Effect CC 2018[30m              [30m│[30m
echo  [30m│        [36m[3][30m  [31mAdobe Animate CC 2018[30m                   [30m│[30m
echo  [30m│        [36m[4][30m  [32mAdobe Audition CC 2018[30m                  [30m│[30m
echo  [30m│        [36m[5][30m  [30mAdobe Bridge CC 2018[30m                    [30m│[30m
echo  [30m│        [36m[6][30m  [91mAdobe Illustrator CC 2018[30m               [30m│[30m
echo  [30m│        [36m[7][30m  [95mAdobe InCopy CC 2018[30m                    [30m│[30m
echo  [30m│        [36m[8][30m  [31mAdobe InDesign CC 2018[30m                  [30m│[30m
echo  [30m│        [36m[9][30m  [34mAdobe Media Encoder CC 2018[30m             [30m│[30m
echo  [30m│        [36m[10][30m [35mAdobe Premiere Pro CC 2018[30m              [30m│[30m
echo  [30m│        [36m[11][30m [36mAdobe Prelude CC 2018[30m                   [30m│[30m
echo  [30m│        [36m[12][30m [92mAdobe Dreamweaver CC 2018[30m               [30m│[30m
echo  [30m│        [36m[13][30m [95mAdobe Character Animator CC 2018[30m        [30m│[30m
echo  [30m│        [36m[14][30m [34mAdobe Lightroom Classic CC 2018[30m         [30m│[30m
echo  [30m╰─────────────────────────────────────────────────────╯[30m
echo.           [30m╭─────────────────────────────────╮[30m
echo.           [30m│      [36m[b][30m  [1mTrở về menu chính[30m     [30m│[30m
echo.           [30m│      [36m[e][30m  [1mThoát[30m                 [30m│[30m
echo.           [30m╰─────────────────────────────────╯[30m
echo.
echo ─────────────────────────────────────────────────────────
echo [32m═════════════════════[30m
set /p setup_online=    [94m╾[30m [1mVui lòng chọn:[30m  
if %setup_online%==1 goto :photoshop_online
if %setup_online%==2 goto :after_effects_online
if %setup_online%==3 goto :animate_online
if %setup_online%==4 goto :audition_online
if %setup_online%==5 goto :bridge_online
if %setup_online%==6 goto :illustrator_online
if %setup_online%==7 goto :incopy_online
if %setup_online%==8 goto :indesign_online
if %setup_online%==9 goto :media_encoder_online
if %setup_online%==10 goto :premiere_pro_online
if %setup_online%==11 goto :prelude_online
if %setup_online%==12 goto :dreamweaver_online
if %setup_online%==13 goto :char_ani_online
if %setup_online%==14 goto :lightroom_online
if %setup_online%==b goto :menu
if %setup_online%==B goto :menu
if %setup_online%==e goto :exit
if %setup_online%==E goto :exit
goto :setupadobe_online

:: TRINH CAI DAT ONLINE CC2019::
:setupadobe_online_cc2019
mode con: cols=57 lines=28
cls
echo        │    [1mChọn gói cài đặt online để bắt đầu[30m   │
if exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 64-bit[30m    │ )
if not exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 32-bit[30m    │ )
echo        ╰─────────────────────────────────────────╯
echo  [30m╭─────────────────────────────────────────────────────╮[30m
echo  [30m│        [36m[1][30m  [94mAdobe Photoshop CC 2019[30m                 [30m│[30m
echo  [30m│        [36m[2][30m  [95mAdobe After Effect CC 2019[30m              [30m│[30m
echo  [30m│        [36m[3][30m  [31mAdobe Animate CC 2019[30m                   [30m│[30m
echo  [30m│        [36m[4][30m  [32mAdobe Audition CC 2019[30m                  [30m│[30m
echo  [30m│        [36m[5][30m  [30mAdobe Bridge CC 2019[30m                    [30m│[30m
echo  [30m│        [36m[6][30m  [91mAdobe Illustrator CC 2019[30m               [30m│[30m
echo  [30m│        [36m[7][30m  [95mAdobe InCopy CC 2019[30m                    [30m│[30m
echo  [30m│        [36m[8][30m  [31mAdobe InDesign CC 2019[30m                  [30m│[30m
echo  [30m│        [36m[9][30m  [34mAdobe Media Encoder CC 2019[30m             [30m│[30m
echo  [30m│        [36m[10][30m [35mAdobe Premiere Pro CC 2019[30m              [30m│[30m
echo  [30m│        [36m[11][30m [36mAdobe Prelude CC 2019[30m                   [30m│[30m
echo  [30m│        [36m[12][30m [92mAdobe Dreamweaver CC 2019[30m               [30m│[30m
echo  [30m│        [36m[13][30m [95mAdobe Character Animator CC 2019[30m        [30m│[30m
echo  [30m│        [36m[14][30m [34mAdobe Lightroom Classic CC 2019[30m         [30m│[30m
echo  [30m╰─────────────────────────────────────────────────────╯[30m
echo.           [30m╭─────────────────────────────────╮[30m
echo.           [30m│      [36m[b][30m  [1mTrở về menu chính[30m     [30m│[30m
echo.           [30m│      [36m[e][30m  [1mThoát[30m                 [30m│[30m
echo.           [30m╰─────────────────────────────────╯[30m
echo.
echo ─────────────────────────────────────────────────────────
echo [32m═════════════════════[30m
set /p setup_online=    [94m╾[30m [1mVui lòng chọn:[30m  
if %setup_online%==1 goto :photoshop_online_cc2019
if %setup_online%==2 goto :after_effects_online_cc2019
if %setup_online%==3 goto :animate_online_cc2019
if %setup_online%==4 goto :audition_online_cc2019
if %setup_online%==5 goto :bridge_online_cc2019
if %setup_online%==6 goto :illustrator_online_cc2019
if %setup_online%==7 goto :incopy_online_cc2019
if %setup_online%==8 goto :indesign_online_cc2019
if %setup_online%==9 goto :media_encoder_online_cc2019
if %setup_online%==10 goto :premiere_pro_online_cc2019
if %setup_online%==11 goto :prelude_online_cc2019
if %setup_online%==12 goto :dreamweaver_online_cc2019
if %setup_online%==13 goto :char_ani_online_cc2019
if %setup_online%==14 goto :lightroom_online_cc2019
if %setup_online%==b goto :menu
if %setup_online%==B goto :menu
if %setup_online%==e goto :exit
if %setup_online%==E goto :exit
goto :setupadobe_online_cc2019

:: BAT DAU FIX HOMESCREEN ADOBE CC 2019 ::
:fixhomescreenphotoshop_cc2019
mode con: cols=62 lines=17
cls
echo   │    [1mSửa chữa Homescreen - Adobe Photoshop CC 2019... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple" ( goto :errorinstalling )
set /p fixhomescreenphotoshop_cc2019directory=<"%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple"
if not defined fixhomescreenphotoshop_cc2019directory ( goto :errorinstalling )
if not exist "%fixhomescreenphotoshop_cc2019directory%\Required\CEP\extensions\com.adobe.ccx.start" ( goto :alreadyfixedhomescreenphotoshop_cc2019 )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│         [35mĐang sửa chữa màn hình chính...      [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%fixhomescreenphotoshop_cc2019directory%\Required\CEP\extensions\com.adobe.ccx.start" /s /q >nul
goto :fixhomescreenphotoshop_cc2019_1
:alreadyfixedhomescreenphotoshop_cc2019
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã sửa chữa từ trước. Bỏ qua. [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
goto :fixhomescreenphotoshop_cc2019_2
:fixhomescreenphotoshop_cc2019_1
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
:fixhomescreenphotoshop_cc2019_2
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo           [1mNhấn phím bất kỳ để quay lại menu chính.[30m
pause >nul
goto :menu

:fixhomescreenillustrator_cc2019
mode con: cols=62 lines=17
cls
echo   │   [1mSửa chữa Homescreen - Adobe Illustrator CC 2019... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple" ( goto :errorinstalling )
set /p fixhomescreenillustrator_cc2019directory=<"%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple"
if not defined fixhomescreenillustrator_cc2019directory ( goto :errorinstalling )
if not exist "%fixhomescreenillustrator_cc2019directory%\Support Files\Required\CEP\extensions\com.adobe.ccx.start" ( goto :alreadyfixedhomescreenillustrator_cc2019 )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│         [35mĐang sửa chữa màn hình chính...      [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%fixhomescreenillustrator_cc2019directory%\Support Files\Required\CEP\extensions\com.adobe.ccx.start" /s /q 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
goto :fixhomescreenillustrator_cc2019_1
:alreadyfixedhomescreenillustrator_cc2019
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã sửa chữa từ trước. Bỏ qua. [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
goto :fixhomescreenillustrator_cc2019_2
:fixhomescreenillustrator_cc2019_1
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
:fixhomescreenillustrator_cc2019_2
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo           [1mNhấn phím bất kỳ để quay lại menu chính.[30m
pause >nul
goto :menu

:fixhomescreenafter_effects_cc2019
mode con: cols=62 lines=17
cls
echo   │  [1mSửa chữa Homescreen - Adobe After Effects CC 2019...  [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" ( goto :errorinstalling )
set /p fixhomescreenafter_effects_cc2019directory=<"%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple"
if not defined fixhomescreenafter_effects_cc2019directory ( goto :errorinstalling )
if not exist "%fixhomescreenafter_effects_cc2019directory%\Support Files\com.adobe.ccx.start" ( goto :alreadyfixedhomescreenafter_effects_cc2019 )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│         [35mĐang sửa chữa màn hình chính...      [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%fixhomescreenafter_effects_cc2019directory%\Support Files\com.adobe.ccx.start" /s /q 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
goto :fixhomescreenafter_effects_cc2019_1
:alreadyfixedhomescreenafter_effects_cc2019
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã sửa chữa từ trước. Bỏ qua. [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
goto :fixhomescreenafter_effects_cc2019_2
:fixhomescreenafter_effects_cc2019_1
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
:fixhomescreenafter_effects_cc2019_2
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo           [1mNhấn phím bất kỳ để quay lại menu chính.[30m
pause >nul
goto :menu

:fixhomescreenpremiere_pro_cc2019
mode con: cols=62 lines=17
cls
echo   │  [1mSửa chữa Homescreen - Adobe Premiere Pro CC 2019...   [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" ( goto :errorinstalling )
set /p fixhomescreenpremiere_pro_cc2019directory=<"%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple"
if not defined fixhomescreenpremiere_pro_cc2019directory ( goto :errorinstalling )
if not exist "%fixhomescreenpremiere_pro_cc2019directory%\CEP\extensions\com.adobe.ccx.start" ( goto :alreadyfixedhomescreenpremiere_pro_cc2019 )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│         [35mĐang sửa chữa màn hình chính...      [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%fixhomescreenpremiere_pro_cc2019directory%\CEP\extensions\com.adobe.ccx.start" /s /q 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
goto :fixhomescreenpremiere_pro_cc2019_1
:alreadyfixedhomescreenpremiere_pro_cc2019
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã sửa chữa từ trước. Bỏ qua. [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
goto :fixhomescreenpremiere_pro_cc2019_2
:fixhomescreenpremiere_pro_cc2019_1
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
:fixhomescreenpremiere_pro_cc2019_2
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo           [1mNhấn phím bất kỳ để quay lại menu chính.[30m
pause >nul
goto :menu

:fixhomescreenmedia_encoder_cc2019
mode con: cols=62 lines=17
cls
echo   │  [1mSửa chữa Homescreen - Adobe Media Encoder CC 2019...  [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" ( goto :errorinstalling )
set /p fixhomescreenmedia_encoder_cc2019directory=<"%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple"
if not defined fixhomescreenmedia_encoder_cc2019directory ( goto :errorinstalling )
if not exist "%fixhomescreenmedia_encoder_cc2019directory%\CEP\extensions\com.adobe.ccx.start" ( goto :alreadyfixedhomescreenmedia_encoder_cc2019 )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│         [35mĐang sửa chữa màn hình chính...      [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%fixhomescreenpremiere_pro_cc2019directory%\CEP\extensions\com.adobe.ccx.start" /s /q 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
goto :fixhomescreenpremiere_pro_cc2019_1
:alreadyfixedhomescreenpremiere_pro_cc2019
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã sửa chữa từ trước. Bỏ qua. [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
goto :fixhomescreenpremiere_pro_cc2019_2
:fixhomescreenpremiere_pro_cc2019_1
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
:fixhomescreenpremiere_pro_cc2019_2
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo           [1mNhấn phím bất kỳ để quay lại menu chính.[30m
pause >nul
goto :menu

:: KET THUC FIX HOMESCREEN ADOBE CC 2019 ::

:: BAT DAU DYNAMIC LINKS
:fixdynamiclinkaftereffects
mode con: cols=62 lines=18
cls
echo   │ [1mSửa chữa Dynamic Link - Adobe After Effects CC 2018... [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple" (
set /p fixdynamiclinkaftereffectsdirectory=<"%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkaftereffectsdirectory ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe After Effects CC 2018" "%fixdynamiclinkaftereffectsdirectory%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkmediaencoder
mode con: cols=62 lines=18
cls
echo   │ [1mSửa chữa Dynamic Link - Adobe Media Encoder CC 2018... [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" (
set /p fixdynamiclinkmediaencoderdirectory=<"%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkmediaencoderdirectory ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Media Encoder CC 2018" "%fixdynamiclinkmediaencoderdirectory%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkpremierepro
mode con: cols=62 lines=18
cls
echo   │ [1mSửa chữa Dynamic Link - Adobe Premiere Pro CC 2018...  [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple" (
set /p fixdynamiclinkpremiere_prodirectory=<"%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkpremiere_prodirectory ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Premiere Pro CC 2018" "%fixdynamiclinkpremiere_prodirectory%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC FIX ADOBE DYNAMIC LINK ::

:: BAT DAU DYNAMIC LINKS CC 2019 ::
:fixdynamiclinkaftereffects_cc2019
mode con: cols=62 lines=18
cls
echo   │ [1mSửa chữa Dynamic Link - Adobe After Effects CC 2019... [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" (
set /p fixdynamiclinkaftereffectsdirectory_cc2019=<"%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkaftereffectsdirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe After Effects CC 2019" "%fixdynamiclinkaftereffectsdirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkmediaencoder_cc2019
mode con: cols=62 lines=18
cls
echo   │ [1mSửa chữa Dynamic Link - Adobe Media Encoder CC 2019... [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" (
set /p fixdynamiclinkmediaencoderdirectory_cc2019=<"%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkmediaencoderdirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Media Encoder CC 2019" "%fixdynamiclinkmediaencoderdirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkpremierepro_cc2019
mode con: cols=62 lines=18
cls
echo   │ [1mSửa chữa Dynamic Link - Adobe Premiere Pro CC 2019...  [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" (
set /p fixdynamiclinkpremiere_prodirectory_cc2019=<"%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkpremiere_prodirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Premiere Pro CC 2019" "%fixdynamiclinkpremiere_prodirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkprelude_cc2019
mode con: cols=62 lines=18
cls
echo   │    [1mSửa chữa Dynamic Link - Adobe Prelude CC 2019...    [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple" (
set /p fixdynamiclinkpreludedirectory_cc2019=<"%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkpreludedirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Prelude CC 2019" "%fixdynamiclinkpreludedirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkaudition_cc2019
mode con: cols=62 lines=18
cls
echo   │   [1mSửa chữa Dynamic Link - Adobe Audition CC 2019...    [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple" (
set /p fixdynamiclinkauditiondirectory_cc2019=<"%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkauditiondirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Audition CC 2019" "%fixdynamiclinkauditiondirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkbridge_cc2019
mode con: cols=62 lines=18
cls
echo   │     [1mSửa chữa Dynamic Link - Adobe Bridge CC 2019...    [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple" (
set /p fixdynamiclinkbridgedirectory_cc2019=<"%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkbridgedirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Bridge CC 2019" "%fixdynamiclinkbridgedirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:fixdynamiclinkchar_ani_cc2019
mode con: cols=62 lines=18
cls
echo   │[1mSửa chữa Dynamic Link - Adobe Character Animator CC 2019[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang tìm kiếm thư mục...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if not exist "%homedrive%\Program Files\Adobe" ( mkdir "%homedrive%\Program Files\Adobe" )
if exist "%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple" (
set /p fixdynamiclinkchar_anidirectory_cc2019=<"%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple" ) else ( goto :errorinstalling )
if defined fixdynamiclinkchar_anidirectory_cc2019 ( echo. ) else ( goto :errorinstalling )
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│       [35mĐang sửa chữa Adobe Dynamic Link...    [30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
mklink /j "%homedrive%\Program Files\Adobe\Adobe Character Animator CC 2019" "%fixdynamiclinkchar_anidirectory_cc2019%" >nul
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│     [94mĐã sửa chữa thành công.    [30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình sửa chữa thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC FIX ADOBE DYNAMIC LINK CC 2019 ::


:: THIET LAP DUONG DAN MAC DINH CHO CAI DAT
:setnewdirectory
SET SRET=0
goto :setdefaultdirectory
:setdefaultdirectory_1
if exist "%appdata%\bangmaple\defaultdirectory.bangmaple" ( goto :duplicatedefaultdirectory )
SET SRET=0
:setdefaultdirectory
IF "%SRET%" GEQ "2" ( goto :errorsetdefaultdirectory )
mode con: cols=62 lines=10
cls
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mCửa sổ thiết lập đường dẫn đã được[30m    [94m│[30m
echo          [94m│     [94mmở ra. Hãy tìm và chọn ra đường dẫn,[30m   [94m│[30m
echo          [94m│       [94mthư mục mặc định dành cho việc[30m       [94m│[30m
echo          [94m│        [94mcài đặt liên tục về sau này.[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :setdefaultdirectory
mode con: cols=62 lines=16
IF DEFINED defaultWS (
cls
echo        │    [1mThiết lập đường dẫn mặc định thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt mặc định của bạn sẽ[30m    [94m│[30m
echo          [94m│    [94mđược lưu vĩnh viễn đến khi bạn xoá[30m      [94m│[30m
echo          [94m│   [94mvà thiết lập cái mới sau này cũng được.[30m  [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo %defaultWS%> ""%appdata%\bangmaple\defaultdirectory.bangmaple""
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình thiết lập thành công![30m
echo            [1mNhấn phím bất kỳ để quay lại menu chọn.[30m
pause >nul
goto :supporttools )
:: KET THUC THIET LAP DUONG DAN MAC DINH CHO CAI DAT

:: BAT DAU THIET LAP DE LEN DUONG DAN MAC DINH ::
:duplicatedefaultdirectory
mode con: cols=62 lines=15
cls
echo    │    [1mĐường dẫn mặc định đặt trước được tìm thấy ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│   [94mTrình cài đặt nhận ra bạn đã thiết lập đường dẫn[30m   [32m│[30m[30m
echo    [32m│    [94mmặc định từ trước đó. Bạn có muốn thiết lập lại[30m   [32m│[30m[30m
echo    [32m│        [94mkhông hoặc tiếp tục với đường dẫn này và[30m      [32m│[30m[30m
echo    [32m│               [94mquay trở về menu chính ?[30m               [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy thiết lập mới.             [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, vẫn sử dụng đường dẫn cũ.   [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p duplicateWS=    [94m╾[30m [1mVui lòng chọn:[30m  
if %duplicateWS%==1 goto :setnewdirectory
if %duplicateWS%==2 goto :menu
goto :duplicatedefaultdirectory
:: KET THUC THIET LAP DE LEN DUONG DAN MAC DINH ::

:: BAO LOI KHI DAT SAI DUONG DAN MAC DINH CHO CAI DAT
:errorsetdefaultdirectory
mode con: cols=62 lines=13
cls
echo      │     [1mThiết lập đường dẫn mặc định thất bại ...[30m   │
echo      ╰─────────────────────────────────────────────────╯
echo         [91m╭────────────────────────────────────────────╮[30m
echo         [91m│       [91mBạn đã không thiết lập chính xác[30m     [91m│[30m
echo         [91m│        [91mđường dẫn mặc định để cài đặt.[30m      [91m│[30m
echo         [91m│       [91mBạn có thể thiết lập sau hoặc[30m        [91m│[30m
echo         [91m│         [91mthử thiết lập lại lần nữa.[30m         [91m│[30m
echo         [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                [1mQuá trình thiết lập thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chọn.[30m
pause >nul
goto :supporttools
:: KET THUC BAO LOI KHI DAT SAI DUONG DAN MAC DINH CHO CAI DAT

:: BAT DAU TRINH CAI DAT ONLINE
:photoshop_online
mode con: cols=62 lines=19
if exist "%~dp0\photoshop_x64.bm_" ( goto :photoshop )
if exist "%~dp0\photoshop_x86.bm_" ( goto :photoshop )
if exist "%homedrive%\Program Files (x86)" ( goto :photoshop_online_x64 ) else ( goto :photoshop_online_x86 )
:photoshop_online_x64
cls
echo    │    [1mĐang tải xuống Adobe Photoshop CC 2018 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1slwlKWZQfwuPc1TnN6FduBEI_yCoPfUI" -O photoshop_x64.bm_
if not exist "%~dp0\photoshop_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :photoshop
:photoshop_online_x86
cls
echo    │    [1mĐang tải xuống Adobe Photoshop CC 2018 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=18Fvs_mPT_WOofbaOo5K8qhGQOAcO_UAs" -O photoshop_x86.bm_
if not exist "%~dp0\photoshop_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :photoshop

:photoshop_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\photoshop_cc2019_x64.bm_" ( goto :photoshop_cc2019 )
:photoshop_online_cc2019_x64
cls
echo    │    [1mĐang tải xuống Adobe Photoshop CC 2019 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1iM4ywsHmxdRXDhentIyQ06PzaBxMumPk" -O photoshop_cc2019_x64.bm_
if not exist "%~dp0\photoshop_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :photoshop_cc2019


:after_effects_online
mode con: cols=62 lines=19
if exist "%~dp0\after_effects_x64.bm_" ( goto :after_effects )
if exist "%homedrive%\Program Files (x86)" ( goto :after_effects_online_x64 ) else ( goto :errorinstalling )
:after_effects_online_x64
cls
echo   │   [1mĐang tải xuống Adobe After Effects CC 2018 x64 ... [30m   │
echo   ╰─────────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1wdRuIAAZm4F5521oTCMhhiqutrK6GjhG" -O after_effects_x64.bm_
if not exist "%~dp0\after_effects_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :after_effects

:after_effects_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\after_effects_cc2019_x64.bm_" ( goto :after_effects_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :after_effects_online_cc2019_x64 ) else ( goto :errorinstalling )
:after_effects_online_cc2019_x64
cls
echo   │   [1mĐang tải xuống Adobe After Effects CC 2019 x64 ... [30m   │
echo   ╰─────────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1rEoqa_dTIQ5gBEaLTR1J0X9Vh05W51TM" -O after_effects_cc2019_x64.bm_
if not exist "%~dp0\after_effects_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :after_effects_cc2019


:animate_online
mode con: cols=62 lines=19
if exist "%~dp0\animate_x64.bm_" ( goto :animate )
if exist "%homedrive%\Program Files (x86)" ( goto :animate_online_x64 ) else ( goto :errorinstalling )
:animate_online_x64
cls
echo      │   [1mĐang tải xuống Adobe Animate CC 2018 x64 ... [30m   │
echo      ╰───────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1rgBq-C-z1vwgzE4UBcnGTCpyj3BA6tH6" -O animate_x64.bm_
if not exist "%~dp0\animate_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :animate

:animate_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\animate_cc2019_x64.bm_" ( goto :animate_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :animate_online_cc2019_x64 ) else ( goto :errorinstalling )
:animate_online_cc2019_x64
cls
echo      │   [1mĐang tải xuống Adobe Animate CC 2019 x64 ... [30m   │
echo      ╰───────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1hon2iUj70JgZa_EbVpoCga_rA_TrDPAm" -O animate_cc2019_x64.bm_
if not exist "%~dp0\animate_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :animate_cc2019

:audition_online
mode con: cols=62 lines=19
if exist "%~dp0\audition_x64.bm_" ( goto :audition )
if exist "%~dp0\audition_x86.bm_" ( goto :audition_x86 )
:audition_online_x64
cls
echo    │     [1mĐang tải xuống Adobe Audition CC 2018 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1Yt68W6_BUPkrmub4aTXmltrhdn26PD2i" -O audition_x64.bm_
if not exist "%~dp0\audition_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :audition
:audition_online_x86
cls
echo    │     [1mĐang tải xuống Adobe Audition CC 2018 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1aPnx0vNou7kMt3lovA5WHJQe9m0gVZNF" -O audition_x86.bm_
if not exist %~dp0\audition_x86.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :audition


:audition_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\audition_cc2019_x64.bm_" ( goto :audition_cc2019 )
:audition_online_cc2019_x64
cls
echo    │     [1mĐang tải xuống Adobe Audition CC 2019 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1hkJeO94ug2gq-3xYGjLZOyONB6EXIBSb" -O audition_cc2019_x64.bm_
if not exist "%~dp0\audition_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :audition_cc2019


:bridge_online
mode con: cols=62 lines=19
if exist %~dp0\bridge_x64.bm_ ( goto :bridge )
if exist %~dp0\bridge_x86.bm_ ( goto :bridge )
if exist "%homedrive%\Program Files (x86)" ( goto :bridge_online_x64 ) else ( goto :bridge_online_x86 )
:bridge_online_x64
cls
echo    │      [1mĐang tải xuống Adobe Bridge CC 2018 x64 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1KEMkTlVVwWE45xhLfffgNrKc29iIZUSq" -O bridge_x64.bm_
if not exist "%~dp0\bridge_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :bridge
:bridge_online_x86
cls
echo    │      [1mĐang tải xuống Adobe Bridge CC 2018 x86 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1jLHEpHeM8ypQCg4WRGUpiBfiXonSbAsq" -O bridge_x86.bm_
if not exist %~dp0\bridge_x86.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :bridge

:bridge_online_cc2019
mode con: cols=62 lines=19
if exist %~dp0\bridge_cc2019_x64.bm_ ( goto :bridge_cc2019 )
:bridge_online_cc2019_x64
cls
echo    │      [1mĐang tải xuống Adobe Bridge CC 2019 x64 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1QFVOfC9MhOdv-HJ0oNcGZYopqVz1EiFL" -O bridge_cc2019_x64.bm_
if not exist "%~dp0\bridge_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :bridge_cc2019


:illustrator_online
mode con: cols=62 lines=19
if exist "%~dp0\illustrator_x64.bm_" ( goto :illustrator )
if exist "%~dp0\illustrator_x86.bm_" ( goto :illustrator )
if exist "%homedrive%\Program Files (x86)" ( goto :illustrator_online_x64 ) else ( goto :illustrator_online_x86 )
:illustrator_online_x64
cls
echo    │   [1mĐang tải xuống Adobe Illustrator CC 2018 x64 ... [30m  │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1C7sGhAlUzvpS0X_iK8d1HQoBL2sL5cx3" -O illustrator_x64.bm_
if not exist "%~dp0\illustrator_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :illustrator
:illustrator_online_x86
cls
echo    │   [1mĐang tải xuống Adobe Illustrator CC 2018 x86 ... [30m  │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1UxRA_4mRhsp7aCKnmkDhj3J5RnD1Qvhw" -O illustrator_x86.bm_
if not exist "%~dp0\illustrator_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :illustrator

:illustrator_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\illustrator_cc2019_x64.bm_" ( goto :illustrator_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :illustrator_online_cc2019_x64 ) else ( goto :errorinstalling )
:illustrator_online_cc2019_x64
cls
echo    │   [1mĐang tải xuống Adobe Illustrator CC 2019 x64 ... [30m  │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1Hjho0w_nzntyxI_0PpYySkiYwpDYTVQk" -O illustrator_cc2019_x64.bm_
if not exist "%~dp0\illustrator_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :illustrator_cc2019

:incopy_online
mode con: cols=62 lines=19
if exist %~dp0\incopy_x64.bm_ ( goto :incopy )
if exist "%~dp0\incopy_x86.bm_" ( goto :incopy )
if exist "%homedrive%\Program Files (x86)" ( goto :incopy_online_x64 ) else ( goto :incopy_online_x86 )
:incopy_online_x64
cls
echo    │      [1mĐang tải xuống Adobe InCopy CC 2018 x64 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1572fcH3YIdJBqtPZATBSbhXH2kR-Htbk" -O incopy_x64.bm_
if not exist %~dp0\incopy_x64.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :incopy
:incopy_online_x86
cls
echo    │      [1mĐang tải xuống Adobe InCopy CC 2018 x86 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1Hf44USA34zLK_XG0-gJWkLTzqAz3lsiX" -O incopy_x86.bm_
if not exist "%~dp0\incopy_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :incopy

:incopy_online_cc2019
mode con: cols=62 lines=19
if exist %~dp0\incopy_cc2019_x64.bm_ ( goto :incopy_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :incopy_online_cc2019_x64 ) else ( goto :errorinstalling )
:incopy_online_cc2019_x64
cls
echo    │      [1mĐang tải xuống Adobe InCopy CC 2019 x64 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1jJ9Xt6Ogp8aOzOaLm-T6CiqKbrn7H-AA" -O incopy_cc2019_x64.bm_
if not exist %~dp0\incopy_cc2019_x64.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :incopy_cc2019


:indesign_online
mode con: cols=62 lines=19
if exist "%~dp0\indesign_x64.bm_" ( goto :indesign )
if exist "%~dp0\indesign_x86.bm_" ( goto :indesign )
if exist "%homedrive%\Program Files (x86)" ( goto :indesign_online_x64 ) else ( goto :indesign_online_x86 )
:indesign_online_x64
cls
echo    │     [1mĐang tải xuống Adobe InDesign CC 2018 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1zaKHyPqeRqJHO8rFI4YmtWcvWW7nMcdB" -O indesign_x64.bm_
if not exist "%~dp0\indesign_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :indesign
:indesign_online_x86
cls
echo    │     [1mĐang tải xuống Adobe InDesign CC 2018 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1iJjKTjTmtlLZAjmgWn3V6yJ64w5KhB-1" -O indesign_x86.bm_
if not exist "%~dp0\indesign_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :indesign

:indesign_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\indesign_cc2019_x64.bm_" ( goto :indesign_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :indesign_online_cc2019_x64 ) else ( goto :errorinstalling )
:indesign_online_cc2019_x64
cls
echo    │     [1mĐang tải xuống Adobe InDesign CC 2019 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1ssPEqLofkiWaQlnZrbrgnEkiwTyj8N_r" -O indesign_cc2019_x64.bm_
if not exist "%~dp0\indesign_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :indesign_cc2019

:media_encoder_online
mode con: cols=62 lines=19
if exist "%~dp0\media_encoder_x64.bm_" ( goto :media_encoder )
if exist "%~dp0\media_encoder_x86.bm_" ( goto :media_encoder )
if exist "%homedrive%\Program Files (x86)" ( goto :media_encoder_online_x64 ) else ( goto :media_encoder_online_x86 )
:media_encoder_online_x64
cls
echo    │  [1mĐang tải xuống Adobe Media Encoder CC 2018 x64 ... [30m │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1FnIPqnmaDxfZFZzPBA8XRTLFrlzaCPBg" -O media_encoder_x64.bm_
if not exist "%~dp0\media_encoder_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :media_encoder
:media_encoder_online_x86
cls
echo    │  [1mĐang tải xuống Adobe Media Encoder CC 2018 x86 ... [30m │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1t0FsySyMdDcaakdQMu1NqsSQh0A7TWw0" -O media_encoder_x86.bm_
if not exist "%~dp0\media_encoder_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :media_encoder

:media_encoder_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\media_encoder_cc2019_x64.bm_" ( goto :media_encoder_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :media_encoder_online_cc2019_x64 ) else ( goto :errorinstalling )
:media_encoder_online_cc2019_x64
cls
echo    │  [1mĐang tải xuống Adobe Media Encoder CC 2019 x64 ... [30m │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1CJ9v7YV96vtNAZcAuJvvRwo5l-o3a7gG" -O media_encoder_cc2019_x64.bm_
if not exist "%~dp0\media_encoder_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :media_encoder_cc2019


:premiere_pro_online
mode con: cols=62 lines=19
if exist "%~dp0\premiere_pro_x64.bm_" ( goto :premiere_pro )
if exist "%homedrive%\Program Files (x86)" ( goto :premiere_pro_online_x64 ) else ( goto :errorinstalling )
:premiere_pro_online_x64
cls
echo   │    [1mĐang tải xuống Adobe Premiere Pro CC 2018 x64 ... [30m   │
echo   ╰─────────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1Vd5PNooi12IO2Hlqwzo5dRQOfXBj2uxe" -O premiere_pro_x64.bm_
if not exist "%~dp0\premiere_pro_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :premiere_pro

:premiere_pro_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\premiere_pro_cc2019_x64.bm_" ( goto :premiere_pro_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :premiere_pro_online_cc2019_x64 ) else ( goto :errorinstalling )
:premiere_pro_online_cc2019_x64
cls
echo   │    [1mĐang tải xuống Adobe Premiere Pro CC 2019 x64 ... [30m   │
echo   ╰─────────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1qzCm9Phfjf_bhXQeK4yD6tnZLrF9e0WI" -O premiere_pro_cc2019_x64.bm_
if not exist "%~dp0\premiere_pro_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :premiere_pro_cc2019

:prelude_online
mode con: cols=62 lines=19
if exist "%~dp0\prelude_x64.bm_" ( goto :prelude )
if exist "%~dp0\prelude_x86.bm_" ( goto :prelude )
if exist "%homedrive%\Program Files (x86)" ( goto :prelude_online_x64 ) else ( goto :prelude_online_x86 )
:prelude_online_x64
cls
echo    │     [1mĐang tải xuống Adobe Prelude CC 2018 x64 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1RFFHiJ-opZrNhp-xzYgZBQ_tvgjfRciZ" -O prelude_x64.bm_
if not exist "%~dp0\prelude_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :prelude
:prelude_online_x86
cls
echo    │     [1mĐang tải xuống Adobe Prelude CC 2018 x86 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1KDraHiU1ATEsTD0ICUmZAYh270VvdVOM" -O prelude_x86.bm_
if not exist "%~dp0\prelude_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :prelude

:prelude_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\prelude_cc2019_x64.bm_" ( goto :prelude_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :prelude_online_cc2019_x64 ) else ( goto :errorinstalling )
:prelude_online_cc2019_x64
cls
echo    │     [1mĐang tải xuống Adobe Prelude CC 2019 x64 ... [30m    │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1fdwL3dUHqlOATVoWQq5dWXlZ8IyUaKNs" -O prelude_cc2019_x64.bm_
if not exist "%~dp0\prelude_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :prelude_cc2019

:dreamweaver_online
mode con: cols=62 lines=19
if exist "%~dp0\dreamweaver_x64.bm_" ( goto :dreamweaver )
if exist %~dp0\dreamweaver_x86.bm_ ( goto :dreamweaver )
if exist "%homedrive%\Program Files (x86)" ( goto :dreamweaver_online_x64 ) else ( goto :dreamweaver_online_x86 )
:dreamweaver_online_x64
cls
echo    │   [1mĐang tải xuống Adobe Dreamweaver CC 2018 x64 ... [30m  │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1zzw6YoL-jTFdOH8PtDzd2wOVp0t7fRSj" -O dreamweaver_x64.bm_
if not exist "%~dp0\dreamweaver_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :dreamweaver
:dreamweaver_online_x86
cls
echo    │   [1mĐang tải xuống Adobe Dreamweaver CC 2018 x86 ... [30m  │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1e1acYCyiZ6WT7zmHSEx2SSHhM1Isyqdj" -O dreamweaver_x86.bm_
if not exist %~dp0\dreamweaver_x86.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :dreamweaver

:dreamweaver_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\dreamweaver_cc2019_x64.bm_" ( goto :dreamweaver_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :dreamweaver_online_cc2019_x64 ) else ( goto :errorinstalling )
:dreamweaver_online_cc2019_x64
cls
echo    │   [1mĐang tải xuống Adobe Dreamweaver CC 2019 x64 ... [30m  │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1ehxESEbLz5SFr7WC_HAGPNG5FecHozwX" -O dreamweaver_cc2019_x64.bm_
if not exist "%~dp0\dreamweaver_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :dreamweaver_cc2019


:char_ani_online
mode con: cols=62 lines=19
if exist %~dp0\char_ani_x64.bm_ ( goto :char_ani )
if exist "%homedrive%\Program Files (x86)" ( goto :char_ani_online_x64 ) else ( goto :errorinstalling )
:char_ani_online_x64
cls
echo   │   [1mĐang tải xuống Adobe Character Animator CC 2018 ... [30m  │
echo   ╰─────────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1-g9YsP2BZMmzoTI0qgOazMod84FpQj3U" -O char_ani_x64.bm_
if not exist %~dp0\char_ani_x64.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :char_ani

:char_ani_online_cc2019
mode con: cols=62 lines=19
if exist %~dp0\char_ani_cc2019_x64.bm_ ( goto :char_ani_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :char_ani_online_cc2019_x64 ) else ( goto :errorinstalling )
:char_ani_online_cc2019_x64
cls
echo   │   [1mĐang tải xuống Adobe Character Animator CC 2019 ... [30m  │
echo   ╰─────────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1Fz4uagJwq2RGkDfR6VHObKcI7991YkbV" -O char_ani_cc2019_x64.bm_
if not exist %~dp0\char_ani_cc2019_x64.bm_ ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :char_ani_cc2019


:lightroom_online
mode con: cols=62 lines=19
if exist "%~dp0\lightroom_x64.bm_" ( goto :lightroom )
if exist "%~dp0\lightroom_x86.bm_" ( goto :lightroom )
if exist "%homedrive%\Program Files (x86)" ( goto :lightroom_online_x64 ) else ( goto :lightroom_online_x86 )
:lightroom_online_x64
cls
echo    │    [1mĐang tải xuống Adobe Lightroom CC 2018 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1zn6_5fcVa70PqrWWKHJg2KGGDqN2oAS4" -O lightroom_x64.bm_
if not exist "%~dp0\lightroom_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :lightroom
:lightroom_online_x86
cls
echo    │    [1mĐang tải xuống Adobe Lightroom CC 2018 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=110cGpZILjCHWxOoFaVhFOanmvsg2mHg5" -O lightroom_x86.bm_
if not exist "%~dp0\lightroom_x86.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :lightroom

:lightroom_online_cc2019
mode con: cols=62 lines=19
if exist "%~dp0\lightroom_cc2019_x64.bm_" ( goto :lightroom_cc2019 )
if exist "%homedrive%\Program Files (x86)" ( goto :lightroom_online_cc2019_x64 ) else ( goto :errorinstalling )
:lightroom_online_cc2019_x64
cls
echo    │    [1mĐang tải xuống Adobe Lightroom CC 2019 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" --no-check-certificate -nv -r --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://docs.google.com/uc?export=download&id=1H7fqBE13PGDF5_vcSOz91mi1g1DppNm5" -O lightroom_cc2019_x64.bm_
if not exist "%~dp0\lightroom_cc2019_x64.bm_" ( goto :errorinternet )
echo      [32m╭─────────────────────────────────────────────────╮[30m
echo      [32m│ [32mTiến trình đã hoàn tất. Đang chuẩn bị cài đặt..[30m [32m│[30m
echo      [32m╰─────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 3 >nul
goto :lightroom_cc2019

:: KET THUC TRINH CAI DAT ONLINE ::


::TRINH GO CAI DAT
:uninstall
title Gỡ cài đặt (các) thành phần
mode con: cols=55 lines=20
cls
echo  ┌───────────────────────────────────────────────────┐
echo  │[32m╭───────                                   [32m───────╮[30m│
echo  │[32m│                                                 │[30m│
echo  │     [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │     [36m│[36m[1][30m Gỡ cài đặt Adobe CC 2018 Pack.      [36m│[30m    │[30m
echo  │     [36m└────────────────────────────────────────┘    [30m│[30m
echo  │     [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │     [36m│[36m[2][30m Gỡ cài đặt Adobe CC 2019 Pack.      [36m│[30m    │[30m
echo  │     [36m└────────────────────────────────────────┘    [30m│[30m
echo  │                                                   [30m│
echo  │     [36m┌────────────────────────────────────────┐    [30m│[30m
echo  │     [36m│[36m[0][30m Quay lại công cụ hỗ trợ.            [36m│[30m    │[30m
echo  │     [36m└────────────────────────────────────────┘    [30m│[30m
echo  │[32m│[30m                                                 [32m│[30m│[30m
echo  │[32m╰───────[30m                                   [32m───────╯[30m│[30m
echo  └───────────────────────────────────────────────────┘[30m
echo.

echo [32m═════════════════════[30m
set /p chonsoftuni=    [94m╾[30m [1mVui lòng chọn:[30m  
if %chonsoftuni%==1 goto :uninstall_adobecc2018
if %chonsoftuni%==2 goto :uninstall_adobecc2019
if %chonsoftuni%==0 goto :supporttools
if %chonsoftuni%== goto :uninstall
goto :uninstall


::CC2018
:uninstall_adobecc2018
title [BangMaple] Gỡ cài đặt Adobe CC 2018 Pack
mode con: cols=57 lines=28
cls
echo        │    [1mChọn phần mềm bạn đã cài đặt để gỡ [30m  │
if exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 64-bit[30m    │ )
if not exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 32-bit[30m    │ )
echo        ╰─────────────────────────────────────────╯
echo  [30m╭─────────────────────────────────────────────────────╮[30m
echo  [30m│        [36m[1][30m  [94mAdobe Photoshop CC 2018[30m                 [30m│[30m
echo  [30m│        [36m[2][30m  [95mAdobe After Effect CC 2018[30m              [30m│[30m
echo  [30m│        [36m[3][30m  [31mAdobe Animate CC 2018[30m                   [30m│[30m
echo  [30m│        [36m[4][30m  [32mAdobe Audition CC 2018[30m                  [30m│[30m
echo  [30m│        [36m[5][30m  [30mAdobe Bridge CC 2018[30m                    [30m│[30m
echo  [30m│        [36m[6][30m  [91mAdobe Illustrator CC 2018[30m               [30m│[30m
echo  [30m│        [36m[7][30m  [95mAdobe InCopy CC 2018[30m                    [30m│[30m
echo  [30m│        [36m[8][30m  [31mAdobe InDesign CC 2018[30m                  [30m│[30m
echo  [30m│        [36m[9][30m  [34mAdobe Media Encoder CC 2018[30m             [30m│[30m
echo  [30m│        [36m[10][30m [35mAdobe Premiere Pro CC 2018[30m              [30m│[30m
echo  [30m│        [36m[11][30m [36mAdobe Prelude CC 2018[30m                   [30m│[30m
echo  [30m│        [36m[12][30m [92mAdobe Dreamweaver CC 2018[30m               [30m│[30m
echo  [30m│        [36m[13][30m [95mAdobe Character Animator CC 2018[30m        [30m│[30m
echo  [30m│        [36m[14][30m [34mAdobe Lightroom[30m                         [30m│[30m
echo  [30m├─────────────────────────────────────────────────────[30m┤[30m
echo  [30m│        [36m[b][30m  [1mTrở về menu chính[30m                       [30m│[30m
echo  [30m│        [36m[e][30m  [1mThoát[30m                                   [30m│[30m
echo  [30m╰─────────────────────────────────────────────────────╯[30m
echo.
echo ─────────────────────────────────────────────────────────

echo [32m═════════════════════[30m
set /p uninstalladobe2018=    [94m╾[30m [1mVui lòng chọn:[30m  
if %uninstalladobe2018%==1 goto :uninstalladobephotoshop
if %uninstalladobe2018%==2 goto :uninstalladobeafter_effects
if %uninstalladobe2018%==3 goto :uninstalladobeanimate
if %uninstalladobe2018%==4 goto :uninstalladobeaudition
if %uninstalladobe2018%==5 goto :uninstalladobebridge
if %uninstalladobe2018%==6 goto :uninstalladobeillustrator
if %uninstalladobe2018%==7 goto :uninstalladobeincopy
if %uninstalladobe2018%==8 goto :uninstalladobeindesign
if %uninstalladobe2018%==9 goto :uninstalladobemedia_encoder
if %uninstalladobe2018%==10 goto :uninstalladobepremiere_pro
if %uninstalladobe2018%==11 goto :uninstalladobeprelude
if %uninstalladobe2018%==12 goto :uninstalladobedreamweaver
if %uninstalladobe2018%==13 goto :uninstalladobechar_ani
if %uninstalladobe2018%==14 goto :uninstalladobelightroom
if %uninstalladobe2018%==b goto :menu
if %uninstalladobe2018%==B goto :menu
if %uninstalladobe2018%==e goto :exit
if %uninstalladobe2018%==E goto :exit
if %uninstalladobe2018%== goto :menu
goto :uninstall_adobecc2018

::CC2018
:uninstall_adobecc2019
title [BangMaple] Gỡ cài đặt Adobe CC 2019 Pack
mode con: cols=57 lines=28
cls
echo        │    [1mChọn phần mềm bạn đã cài đặt để gỡ [30m  │
if exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 64-bit[30m    │ )
if not exist "%homedrive%\Program Files (x86)" (
echo        │      [35mBạn đang sử dụng Windows 32-bit[30m    │ )
echo        ╰─────────────────────────────────────────╯
echo  [30m╭─────────────────────────────────────────────────────╮[30m
echo  [30m│        [36m[1][30m  [94mAdobe Photoshop CC 2019[30m                 [30m│[30m
echo  [30m│        [36m[2][30m  [95mAdobe After Effect CC 2019[30m              [30m│[30m
echo  [30m│        [36m[3][30m  [31mAdobe Animate CC 2019[30m                   [30m│[30m
echo  [30m│        [36m[4][30m  [32mAdobe Audition CC 2019[30m                  [30m│[30m
echo  [30m│        [36m[5][30m  [30mAdobe Bridge CC 2019[30m                    [30m│[30m
echo  [30m│        [36m[6][30m  [91mAdobe Illustrator CC 2019[30m               [30m│[30m
echo  [30m│        [36m[7][30m  [95mAdobe InCopy CC 2019[30m                    [30m│[30m
echo  [30m│        [36m[8][30m  [31mAdobe InDesign CC 2019[30m                  [30m│[30m
echo  [30m│        [36m[9][30m  [34mAdobe Media Encoder CC 2019[30m             [30m│[30m
echo  [30m│        [36m[10][30m [35mAdobe Premiere Pro CC 2019[30m              [30m│[30m
echo  [30m│        [36m[11][30m [36mAdobe Prelude CC 2019[30m                   [30m│[30m
echo  [30m│        [36m[12][30m [92mAdobe Dreamweaver CC 2019[30m               [30m│[30m
echo  [30m│        [36m[13][30m [95mAdobe Character Animator CC 2019[30m        [30m│[30m
echo  [30m│        [36m[14][30m [34mAdobe Lightroom[30m                         [30m│[30m
echo  [30m├─────────────────────────────────────────────────────[30m┤[30m
echo  [30m│        [36m[b][30m  [1mTrở về menu chính[30m                       [30m│[30m
echo  [30m│        [36m[e][30m  [1mThoát[30m                                   [30m│[30m
echo  [30m╰─────────────────────────────────────────────────────╯[30m
echo.
echo ─────────────────────────────────────────────────────────

echo [32m═════════════════════[30m
set /p uninstalladobe2019=    [94m╾[30m [1mVui lòng chọn:[30m  
if %uninstalladobe2019%==1 goto :uninstalladobephotoshop_cc2019
if %uninstalladobe2019%==2 goto :uninstalladobeafter_effects_cc2019
if %uninstalladobe2019%==3 goto :uninstalladobeanimate_cc2019
if %uninstalladobe2019%==4 goto :uninstalladobeaudition_cc2019
if %uninstalladobe2019%==5 goto :uninstalladobebridge_cc2019
if %uninstalladobe2019%==6 goto :uninstalladobeillustrator_cc2019
if %uninstalladobe2019%==7 goto :uninstalladobeincopy_cc2019
if %uninstalladobe2019%==8 goto :uninstalladobeindesign_cc2019
if %uninstalladobe2019%==9 goto :uninstalladobemedia_encoder_cc2019
if %uninstalladobe2019%==10 goto :uninstalladobepremiere_pro_cc2019
if %uninstalladobe2019%==11 goto :uninstalladobeprelude_cc2019
if %uninstalladobe2019%==12 goto :uninstalladobedreamweaver_cc2019
if %uninstalladobe2019%==13 goto :uninstalladobechar_ani_cc2019
if %uninstalladobe2019%==14 goto :uninstalladobelightroom_cc2019
if %uninstalladobe2019%==b goto :menu
if %uninstalladobe2019%==B goto :menu
if %uninstalladobe2019%==e goto :exit
if %uninstalladobe2019%==E goto :exit
if %uninstalladobe2019%== goto :menu
goto :uninstall_adobecc2019
:: TRINH GO CAI DAT ::

:: BAT DAU CAI DAT REDIST ::
:redistinternet
mode con: cols=62 lines=12

cls
echo   │ [1mBạn muốn cài đặt MS Visual Redist C++ bằng cách nào ??[30m │
echo   ╰────────────────────────────────────────────────────────╯
echo         [32m╭───────────────────────────────────────────╮[30m
echo         [32m│                [36m[1][30m Online                 [32m│[30m[30m
echo         [32m│                [36m[2][30m Offline                [32m│[30m[30m
echo         [32m╰─────────┬───────────────────────┬─────────╯[30m
echo                   [32m│ [36m[0][30m Trở về menu chính [32m│[30m[30m
echo                   [32m└───────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p redistinternet=    [94m╾[30m [1mVui lòng chọn:[30m  
if %redistinternet%==1 goto :redistchooseinternet
if %redistinternet%==2 goto :redistoffline
if %redistinternet%==0 goto :menu
goto :redistinternet

::CAI DAT REDIST QUA INTERNET
:redistchooseinternet
mode con: cols=62 lines=20

cls
echo     │ [1mChọn phiên bản MS Visual C++ mà bạn muốn cài đặt ?[30m │
echo     ╰────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│        [36m[1][30m Microsoft Visual C++ Redist 2010 x86      [32m│[30m[30m
echo    [32m│        [36m[2][30m Microsoft Visual C++ Redist 2010 x64      [32m│[30m[30m
echo    [32m│        [36m[3][30m Microsoft Visual C++ Redist 2012 x86      [32m│[30m[30m
echo    [32m│        [36m[4][30m Microsoft Visual C++ Redist 2012 x64      [32m│[30m[30m
echo    [32m│        [36m[5][30m Microsoft Visual C++ Redist 2013 x86      [32m│[30m[30m
echo    [32m│        [36m[6][30m Microsoft Visual C++ Redist 2013 x64      [32m│[30m[30m
echo    [32m│        [36m[7][30m Microsoft Visual C++ Redist 2017 x86      [32m│[30m[30m
echo    [32m│        [36m[8][30m Microsoft Visual C++ Redist 2017 x64      [32m│[30m[30m
echo    [32m├──────────────────────────────────────────────────────┤[30m
echo    [32m│        [36m[A][30m Cài đặt tất cả thành phần trên.           [32m│[30m[30m
echo    [32m╰───────────────┬───────────────────────┬──────────────╯[30m
echo                    [32m│ [36m[0][30m Trở về menu chính [32m│[30m[30m
echo                    [32m└───────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p redistgo=    [94m╾[30m [1mVui lòng chọn:[30m  
if %redistgo%==1 goto :vc2010_x86_online
if %redistgo%==2 goto :vc2010_x64_online
if %redistgo%==3 goto :vc2012_x86_online
if %redistgo%==4 goto :vc2012_x64_online
if %redistgo%==5 goto :vc2013_x86_online
if %redistgo%==6 goto :vc2013_x64_online
if %redistgo%==7 goto :vc2017_x86_online
if %redistgo%==8 goto :vc2017_x64_online
if %redistgo%==a goto :all_online
if %redistgo%==A goto :all_online
if %redistgo%==0 goto :menu
goto :redistchooseinternet

::INSTALL REDIST OFFLINE DIRECTORY::
:redistoffline
if not exist "%homedrive%\Program Files (x86)" ( goto :offline32 ) else ( goto :offline64 )

::INSTALL MS VISUAL C++ 2010 X86::
:vc2010_x86_online
mode con: cols=62 lines=16
cls
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2010_x86_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2010 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2010x86onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2010x86onl%==1 goto :vc2010_x86_online_1
if %question2010x86onl%==2 goto :menu
goto :vc2010_x86_online
:vc2010_x86_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2010 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if exist vcredist2010_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2010x86 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -O vcredist2010_x86.bm_ )
if not exist "%~dp0\vcredist2010_x86.bm_" ( goto :errorinternet )
:installvs2010x86
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2010_x86.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL MS VISUAL C++ 2010 X64::
:vc2010_x64_online
mode con: cols=62 lines=16
cls
reg query HKLM\SOFTWARE\Classes\Installer\Products\1926E8D15D0BCE53481466615F760A7F 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2010_x64_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2010 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2010x64onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2010x64onl%==1 goto :vc2010_x64_online_1
if %question2010x64onl%==2 goto :menu
goto :vc2010_x64_online
:vc2010_x64_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2010 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if exist vcredist2010_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2010x64 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -O vcredist2010_x64.bm_ )
if not exist "%~dp0\vcredist2010_x64.bm_" ( goto :errorinternet )
:installvs2010x64
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2010_x64.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu


::INSTALL MS VISUAL C++ 2012 X86::
:vc2012_x86_online
mode con: cols=62 lines=16
cls
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2010_x86_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2012 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2012x86onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2012x86onl%==1 goto :vc2012_x86_online_1
if %question2012x86onl%==2 goto :menu
goto :vc2012_x86_online
:vc2012_x86_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2012 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if exist vcredist2012_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2012x86 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -O vcredist2012_x86.bm_ )
if not exist "%~dp0\vcredist2012_x86.bm_" ( goto :errorinternet )
:installvs2012x86
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2012_x86.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL MS VISUAL C++ 2012 X64::
:vc2012_x64_online
mode con: cols=62 lines=16
cls
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{ca67548a-5ebe-413a-b50c-4b9ceb6d66c6} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2012_x64_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2012 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2012x64onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2012x64onl%==1 goto :vc2012_x64_online_1
if %question2012x64onl%==2 goto :menu
goto :vc2012_x64_online
:vc2012_x64_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2012 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if exist vcredist2012_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2012x64 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -O vcredist2012_x64.bm_ )
if not exist "%~dp0\vcredist2012_x64.bm_" ( goto :errorinternet )
:installvs2012x64
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2012_x64.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL MS VISUAL C++ 2013 X86::
:vc2013_x86_online
mode con: cols=62 lines=16
cls
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2013_x86_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2013 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2013x86onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2013x86onl%==1 goto :vc2013_x86_online_1
if %question2013x86onl%==2 goto :menu
goto :vc2013_x86_online
:vc2013_x86_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2013 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if exist vcredist2013_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2013x86 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" -O vcredist2013_x86.bm_ )
if not exist "%~dp0\vcredist2013_x86.bm_" ( goto :errorinternet )
:installvs2013x86
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2013_x86.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL MS VISUAL C++ 2013 X64::
:vc2013_x64_online
mode con: cols=62 lines=16

cls
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2013_x64_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2013 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2013x64onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2013x64onl%==1 goto :vc2013_x64_online_1
if %question2013x64onl%==2 goto :menu
goto :vc2013_x64_online
:vc2013_x64_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2013 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if not exist "%homedrive%\Program Files (x86)" (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│         [91mXin lỗi về sự bất tiện này.[30m        [91m│[30m
echo          [91m│    [91mThành phần bạn đang cố gắng cài đặt[30m     [91m│[30m
echo          [91m│       [91mkhông tương thích với phiên bản.[30m     [91m│[30m
echo          [91m│     [91mhệ điều hành này. Quá trình cài đặt[30m    [91m│[30m
echo          [91m│            [91mkhông thể tiếp tục.[30m             [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )
if exist vcredist2013_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2013x64 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe" -O vcredist2013_x64.bm_ )
if not exist "%~dp0\vcredist2013_x64.bm_" ( goto :errorinternet )
:installvs2013x64
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2013_x64.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTAL MS VISUAL C++ 2017 X86::
:vc2017_x86_online
mode con: cols=62 lines=16

cls
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2017_x86_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2017 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2017x86onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2017x86onl%==1 goto :vc2017_x86_online_1
if %question2017x86onl%==2 goto :menu
goto :vc2017_x86_online
:vc2017_x86_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2017 x86 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯

if exist vcredist2017_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2017x86 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://aka.ms/vs/15/release/vc_redist.x86.exe" -O vcredist2017_x86.bm_ )
if not exist "%~dp0\vcredist2017_x86.bm_" ( goto :errorinternet )
:installvs2017x86
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2017_x86.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL MS VISUAL C++ 2017 X64::
:vc2017_x64_online
mode con: cols=62 lines=16

cls
reg query HKCR\Installer\Dependencies\,,amd64,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2017_x64_online_1 )
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2017 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2017x64onl=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2017x64onl%==1 goto :vc2017_x64_online_1
if %question2017x64onl%==2 goto :menu
goto :vc2017_x64_online
:vc2017_x64_online_1
mode con: cols=62 lines=19
cls
echo    │    [1mĐang cài đặt Microsoft Visual C++ 2017 x64 ... [30m   │
echo    ╰──────────────────────────────────────────────────────╯
if not exist "%homedrive%\Program Files (x86)" (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│         [91mXin lỗi về sự bất tiện này.[30m        [91m│[30m
echo          [91m│    [91mThành phần bạn đang cố gắng cài đặt[30m     [91m│[30m
echo          [91m│       [91mkhông tương thích với phiên bản.[30m     [91m│[30m
echo          [91m│     [91mhệ điều hành này. Quá trình cài đặt[30m    [91m│[30m
echo          [91m│            [91mkhông thể tiếp tục.[30m             [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )
if exist vcredist2017_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2017x64 ) else ( 
echo             [36m╭───────────────────────────────────╮[30m
echo             [36m│ [36mĐang tải xuống gói thành phần...[30m  [36m│[30m
echo             [36m╰───────────────────────────────────╯[30m
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://aka.ms/vs/15/release/vc_redist.x64.exe" -O vcredist2017_x64.bm_ )
if not exist "%~dp0\vcredist2017_x64.bm_" ( goto :errorinternet )
:installvs2017x64
echo                [35m╭─────────────────────────────╮[30m
echo                [35m│ [35mĐang cài đặt thành phần...[30m  [35m│[30m
echo                [35m╰─────────────────────────────╯[30m
"%~dp0\vcredist2017_x64.bm_" /s /q /norestart >nul
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL ALL MS VISUAL C++::
:all_online
cls
if not exist "%homedrive%\Program Files (x86)" ( goto :all_online_x86 ) else ( goto :all_online_x64 )
goto :menu

::ONLINE MICROSOFT VISUAL C++ REDIST X86::
:all_online_x86
mode con: cols=62 lines=36
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2010 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :12x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2010 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2010_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :12x86
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -O vcredist2010_x86.bm_ )
if not exist "%~dp0\vcredist2010_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:12x86
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2012 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :13x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2012 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2012_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :13x86
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -O vcredist2012_x86.bm_ )
if not exist "%~dp0\vcredist2012_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:13x86
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2013 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :17x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2013 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2013_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :17x86
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" -O vcredist2013_x86.bm_ )
if not exist "%~dp0\vcredist2013_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:17x86
echo ──────────────────────────────────────────────────────────────
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2017 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :done17x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2017 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2017_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :finishdownloadingredist
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://aka.ms/vs/15/release/vc_redist.x86.exe" -O vcredist2017_x86.bm_ )
if not exist "%~dp0\vcredist2017_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:finishdownloadingredist
echo ══════════════════════════════════════════════════════════════
ping 127.0.0.1 -n 3 >nul
mode con: cols=62 lines=34
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2010 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2010_x86.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2012 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
vcredist2012_x86.bm_ /s /q /norestart >nul
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2013 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
vcredist2013_x86.bm_ /s /q /norestart >nul
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2017 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
vcredist2017_x86.bm_ /s /q /norestart >nul
:done17x86
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu


::ONLINE MICROSOFT VISUAL C++ REDIST X64::
:all_online_x64
mode con: cols=62 lines=20
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2010 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :10x64 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2010 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2010_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :10x64
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -O vcredist2010_x86.bm_ )
if not exist "%~dp0\vcredist2010_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:10x64
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Products\1926E8D15D0BCE53481466615F760A7F 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2010 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :12x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2010 x64...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2010_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :12x86
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -O vcredist2010_x64.bm_ )
if not exist "%~dp0\vcredist2010_x64.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:12x86
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2012 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :12x64 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2012 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2012_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :12x64
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -O vcredist2012_x86.bm_ )
if not exist "%~dp0\vcredist2012_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:12x64
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{ca67548a-5ebe-413a-b50c-4b9ceb6d66c6} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2012 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :13x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2012 x64...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2012_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :13x86
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -O vcredist2012_x64.bm_ )
if not exist "%~dp0\vcredist2012_x64.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:13x86
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2013 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :13x64 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2013 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2013_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :13x64
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" -O vcredist2013_x86.bm_ )
if not exist "%~dp0\vcredist2013_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:13x64
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2013 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :17x86 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2013 x64...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2013_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :17x86
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe" -O vcredist2013_x64.bm_ )
if not exist "%~dp0\vcredist2013_x64.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:17x86
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2017 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :17x64 )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2017 x86...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2017_x86.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :17x64
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://aka.ms/vs/15/release/vc_redist.x86.exe" -O vcredist2017_x86.bm_ )
if not exist "%~dp0\vcredist2017_x86.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:17x64
echo ──────────────────────────────────────────────────────────────
reg query HKCR\Installer\Dependencies\,,amd64,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2017 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :finishdownloadingredist )
echo      [36m╭──────────────────────────────────────────────────╮[30m
echo      [36m│ [36mĐang tải xuống Microsoft Visual C++ 2017 x64...[30m  [36m│[30m
echo      [36m╰──────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
if exist vcredist2017_x64.bm_ (
echo          [31m╭───────────────────────────────────────────╮[30m
echo          [31m│ [31mTập tin đã tồn tại. Không cần tải xuống.[30m  [31m│[30m
echo          [31m╰───────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :finishdownloadingredist
) else (
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://aka.ms/vs/15/release/vc_redist.x64.exe" -O vcredist2017_x64.bm_ )
if not exist "%~dp0\vcredist2017_x64.bm_" ( goto :errorinternet )
echo                  [32m╭─────────────────────────╮[30m
echo                  [32m│ [32mTiến trình đã hoàn tất.[30m [32m│[30m
echo                  [32m╰─────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:finishdownloadingredist
echo ══════════════════════════════════════════════════════════════
ping 127.0.0.1 -n 3 >nul
mode con: cols=62 lines=16
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2010 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2010_x86.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2010x64_online
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2010 x64...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Products\1926E8D15D0BCE53481466615F760A7F 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2010_x64.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2012x86_online
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2012 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2012_x86.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2012x64_online
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2012 x64...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{ca67548a-5ebe-413a-b50c-4b9ceb6d66c6} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2012_x64.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2013x86_online
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2013 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2013_x86.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2013x64_online
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2013 x64...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2013_x64.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2017x86_online
mode con: cols=62 lines=20
cls
echo       │  [1mĐang cài đặt Microsoft Visual C++ Online ... [30m │
echo       ╰────────────────────────────────────────────────╯
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2017 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2017_x64.bm_ /s /q /norestart >nul )
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
:installvs2017x64_online
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2017 x64...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
reg query HKCR\Installer\Dependencies\,,amd64,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 (
vcredist2017_x64.bm_ /s /q /norestart >nul )
:finishinstalllvconline_x64
echo              [94m╭──────────────────────────────────╮[30m
echo              [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m  [94m│[30m
echo              [94m╰──────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu


:offline32
mode con: cols=62 lines=16
cls
echo   │ [1mBạn đang chuẩn bị cài đặt gói phiên bản offline 32-bit[30m │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│        [36m[1][30m Microsoft Visual C++ Redist 2010 x86      [32m│[30m[30m
echo    [32m│        [36m[2][30m Microsoft Visual C++ Redist 2012 x86      [32m│[30m[30m
echo    [32m│        [36m[3][30m Microsoft Visual C++ Redist 2013 x86      [32m│[30m[30m
echo    [32m│        [36m[4][30m Microsoft Visual C++ Redist 2017 x86      [32m│[30m[30m
echo    [32m├──────────────────────────────────────────────────────┤[30m
echo    [32m│        [36m[A][30m Cài đặt tất cả thành phần trên.           [32m│[30m[30m
echo    [32m╰───────────────┬───────────────────────┬──────────────╯[30m
echo                    [32m│ [36m[0][30m Trở về menu chính [32m│[30m[30m
echo                    [32m└───────────────────────┘[30m
echo.
echo [32m═════════════════════[30m

set /p redistoff32=    [94m╾[30m [1mVui lòng chọn:[30m 
if %redistoff32%==1 goto :vcredist2010x86
if %redistoff32%==2 goto :vcredist2012x86 
if %redistoff32%==3 goto :vcredist2013x86
if %redistoff32%==4 goto :vcredist2017x86
if %redistoff32%==a goto :allx86redistoffline
if %redistoff32%==A goto :allx86redistoffline
if %redistoff32%==0 goto :menu
goto :offline32


:offline64
mode con: cols=62 lines=20
cls
echo   │ [1mBạn đang chuẩn bị cài đặt gói phiên bản offline 64-bit[30m │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│        [36m[1][30m Microsoft Visual C++ Redist 2010 x86      [32m│[30m[30m
echo    [32m│        [36m[2][30m Microsoft Visual C++ Redist 2010 x64      [32m│[30m[30m
echo    [32m│        [36m[3][30m Microsoft Visual C++ Redist 2012 x86      [32m│[30m[30m
echo    [32m│        [36m[4][30m Microsoft Visual C++ Redist 2012 x64      [32m│[30m[30m
echo    [32m│        [36m[5][30m Microsoft Visual C++ Redist 2013 x86      [32m│[30m[30m
echo    [32m│        [36m[6][30m Microsoft Visual C++ Redist 2013 x64      [32m│[30m[30m
echo    [32m│        [36m[7][30m Microsoft Visual C++ Redist 2017 x86      [32m│[30m[30m
echo    [32m│        [36m[8][30m Microsoft Visual C++ Redist 2017 x64      [32m│[30m[30m
echo    [32m├──────────────────────────────────────────────────────┤[30m
echo    [32m│        [36m[A][30m Cài đặt tất cả thành phần trên.           [32m│[30m[30m
echo    [32m╰───────────────┬───────────────────────┬──────────────╯[30m
echo                    [32m│ [36m[0][30m Trở về menu chính [32m│[30m[30m
echo                    [32m└───────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p redistoff64=    [94m╾[30m [1mVui lòng chọn:[30m  
if %redistoff64%==1 goto :vcredist2010x86
if %redistoff64%==2 goto :vcredist2010x64
if %redistoff64%==3 goto :vcredist2012x86
if %redistoff64%==4 goto :vcredist2012x64
if %redistoff64%==5 goto :vcredist2013x86
if %redistoff64%==6 goto :vcredist2013x64
if %redistoff64%==7 goto :vcredist2017x86
if %redistoff64%==8 goto :vcredist2017x64
if %redistoff64%==a goto :allx64redistoffline
if %redistoff64%==A goto :allx64redistoffline
if %redistoff64%==0 goto :menu
goto :offline64


:allx64redistoffline
mode con: cols=62 lines=36
cls
if not exist vcredist2010_x86.bm_ (goto :errorofflinex64redist)
if not exist vcredist2012_x86.bm_ (goto :errorofflinex64redist)
if not exist vcredist2013_x86.bm_ (goto :errorofflinex64redist)
if not exist vcredist2017_x86.bm_ (goto :errorofflinex64redist)
if not exist vcredist2010_x64.bm_ (goto :errorofflinex64redist)
if not exist vcredist2012_x64.bm_ (goto :errorofflinex64redist)
if not exist vcredist2013_x64.bm_ (goto :errorofflinex64redist)
if not exist vcredist2017_x64.bm_ (goto :errorofflinex64redist)
echo   │     [1mĐang cài đặt bộ Microsoft Visual x64 offline ...[30m   │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2010 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2010x64_offline )
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2010 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2010_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:installvs2010x64_offline
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Products\1926E8D15D0BCE53481466615F760A7F 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2010 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2012x86_offline )
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2010 x64...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2010_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2012 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2012x64_offline )
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2012 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2012_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:installvs2012x64_offline
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{ca67548a-5ebe-413a-b50c-4b9ceb6d66c6} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2012 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2013x86_offline )
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2012 x64...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2012_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2013 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2013x64_offline )
echo      [35m╭──────────────────────────────────────────────────╮[30m
echo      [35m│  [35mĐang cài đặt Microsoft Visual C++ 2013 x86...[30m   [35m│[30m
echo      [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2013_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:installvs2013x64_offline
echo ──────────────────────────────────────────────────────────────
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2013 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2017x86_offline )
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2013 x64...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2013_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:installvs2017x86_offline
echo ──────────────────────────────────────────────────────────────
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2017 x86. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :installvs2017x64_offline )
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2017 x86...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2017_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:installvs2017x64_offline
echo ──────────────────────────────────────────────────────────────
reg query HKCR\Installer\Dependencies\,,amd64,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 0 (
echo   [94m╭────────────────────────────────────────────────────────╮[30m
echo   [94m│ Đã cài đặt từ trước MS Visual C++ 2017 x64. Bỏ qua ... │[30m
echo   [94m╰────────────────────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
goto :finishinstalllvcoffline_x64 )
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2017 x64...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2017_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
:finishinstalllvcoffline_x64
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )


:errorofflinex64redist
mode con: cols=62 lines=14
cls
echo   │     [1mĐang cài đặt bộ Microsoft Visual x64 offline ...[30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu

::INSTALL VISUAL C++ 2010 X86 OFFLINE::
:vcredist2010x86
mode con: cols=62 lines=16
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2010 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Products\1D5E3C0FEDA1E123187686FED06E995A 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2010_x86_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2010x86off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2010x86off%==1 goto :vc2010_x86_offline_1
if %question2010x86off%==2 goto :menu
goto :vcredist2010x86
:vc2010_x86_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2010 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2010_x86.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2010_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

:vcredist2010x64
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2010 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Products\1926E8D15D0BCE53481466615F760A7F 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2010_x64_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2010x64off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2010x64off%==1 goto :vc2010_x64_offline_1
if %question2010x64off%==2 goto :menu
goto :vcredist2010x64
:vc2010_x64_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2010 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2010_x64.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2010_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

::INSTALL VISUAL C++ 2012 X86 OFFLINE::
:vcredist2012x86
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2012 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{33d1fd90-4274-48a1-9bc1-97e33d9c2d6f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2012_x86_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2012x86off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2012x86off%==1 goto :vc2012_x86_offline_1
if %question2012x86off%==2 goto :menu
goto :vcredist2012x86
:vc2012_x86_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2012 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2012_x86.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2012_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

:vcredist2012x64
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2012 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{ca67548a-5ebe-413a-b50c-4b9ceb6d66c6} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2012_x64_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2012x64off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2012x64off%==1 goto :vc2012_x64_offline_1
if %question2012x64off%==2 goto :menu
goto :vcredist2012x64
:vc2012_x64_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2012 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2012_x64.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2012_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

::INSTALL VISUAL C++ 2013 X86 OFFLINE::
:vcredist2013x86
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2013 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{f65db027-aff3-4070-886a-0d87064aabb1} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2013_x86_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2013x86off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2013x86off%==1 goto :vc2013_x86_offline_1
if %question2013x86off%==2 goto :menu
goto :vcredist2013x86
:vc2013_x86_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2013 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2013_x86.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2013_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

:vcredist2013x64
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2013 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKLM\SOFTWARE\Classes\Installer\Dependencies\{050d4fc8-5d48-4b8f-8972-47c82c46020f} 2>nul | find "HKEY_LOCAL_MACHINE" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2013_x64_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2013x64off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2013x64off%==1 goto :vc2013_x64_offline_1
if %question2013x64off%==2 goto :menu
goto :vcredist2013x64
:vc2013_x64_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2013 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2013_x64.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2013_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

:vcredist2017x86
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2017 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKCR\Installer\Dependencies\,,x86,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2017_x86_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2017x86off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2017x86off%==1 goto :vc2017_x86_offline_1
if %question2017x86off%==2 goto :menu
goto :vcredist2017x86
:vc2017_x86_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2017 x86 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2017_x86.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2017_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

:vcredist2017x64
mode con: cols=62 lines=14
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2017 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
reg query HKCR\Installer\Dependencies\,,amd64,14.0,bundle\Dependents\ /s 2>nul | find "HKEY_CLASSES_ROOT" > "%appdata%\temp.bangmaple"
if %errorlevel% equ 1 ( goto :vc2017_x64_offline_1 )
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận ra bạn đã cài đặt thành phần này[30m [32m│[30m[30m
echo    [32m│     [94mtừ trước đó. Bạn được khuyến cáo là không nên[30m    [32m│[30m[30m
echo    [32m│        [94mcài đặt lại. Bạn có chắc là muốn tiếp tục[30m     [32m│[30m[30m
echo    [32m│               [94mtiến trình cài đặt không ?[30m             [32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p question2017x64off=    [94m╾[30m [1mVui lòng chọn:[30m  
if %question2017x64off%==1 goto :vc2017_x64_offline_1
if %question2017x64off%==2 goto :menu
goto :vcredist2017x64
:vc2017_x64_offline_1
cls
echo   │ [1mĐang cài đặt Microsoft Visual C++ 2017 x64 offline ...[30m │
echo   ╰────────────────────────────────────────────────────────╯
if exist vcredist2017_x64.bm_ (
echo               [35m╭─────────────────────────────────╮[30m
echo               [35m│    [35mĐang cài đặt thành phần...[30m   [35m│[30m
echo               [35m╰─────────────────────────────────╯[30m
"%~dp0\vcredist2017_x64.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu ) else (
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )

:allx86redistoffline
mode con: cols=62 lines=20
cls
if not exist vcredist2010_x86.bm_ (goto :errorofflinex86redist)
if not exist vcredist2012_x86.bm_ (goto :errorofflinex86redist)
if not exist vcredist2013_x86.bm_ (goto :errorofflinex86redist)
if not exist vcredist2017_x86.bm_ (goto :errorofflinex86redist)
echo   │     [1mĐang cài đặt bộ Microsoft Visual x86 offline ...[30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2010 x86...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2010_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2012 x86...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2012_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2013 x86...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2013_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ──────────────────────────────────────────────────────────────
echo        [35m╭──────────────────────────────────────────────────╮[30m
echo        [35m│  [35mĐang cài đặt Microsoft Visual C++ 2017 x86...[30m   [35m│[30m
echo        [35m╰──────────────────────────────────────────────────╯[30m
"%~dp0\vcredist2017_x86.bm_" /s /q /norestart >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình cài đặt đã được hoàn tất.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu )


:errorofflinex86redist
mode con: cols=62 lines=14
cls
echo   │     [1mĐang cài đặt bộ Microsoft Visual x86 offline ...[30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│       [91mKhông tìm thấy tập tin cài đặt.[30m      [91m│[30m
echo          [91m│   [91mVui lòng tải xuống Online hoặc tải từ[30m    [91m│[30m
echo          [91m│         [91mtrình duyệt bên ngoài.[30m             [91m│[30m
echo          [91m│    [91mSau đó sao chép/di chuyển tập tin[30m       [91m│[30m
echo          [91m│     [91mvào thư mục này và thực hiện lại.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu
:: KET THUC CAI DAT REDIST ::


:: THONG BAO LOI MANG ::
:errorinternet
mode con: cols=62 lines=14
cls
echo         │  [1mQuá trình cài đặt bị kết thúc bất ngờ ...[30m   │
echo         ╰──────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│      [91mTrình cài đặt không thể tiếp tục[30m      [91m│[30m
echo          [91m│       [91mvì không tìm thấy kết nối mạng[30m       [91m│[30m
echo          [91m│       [91mtrên máy tính của bạn, vui lòng[30m      [91m│[30m
echo          [91m│       [91mkiểm tra kết nối mạng và sau đó[30m      [91m│[30m
echo          [91m│        [91mthực hiện lại quá trình nhé.[30m        [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu
:: THONG BAO LOI MANG ::

:: THONG BAO DANG CHAY CHUONG TRINH ::
:taskexist
mode con: cols=62 lines=14
cls
echo        [30m[1m │  [1mQuá trình cài đặt bị kết thúc bất ngờ ...[30m   │
echo         ╰──────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│  [91mTrình cài đặt không thể tiếp tục vì đang  [30m[91m│[30m
echo          [91m│ [91mcó trình cài đặt khác đang chạy song song [30m [91m│[30m
echo          [91m│ [91mtrên máy tính của bạn, tắt cửa sổ này hoặc[30m [91m│[30m
echo          [91m│ [91mtrình cài đặt kia để có thể trải nghiệm   [30m [91m│[30m
echo          [91m│            [91mtốt nhất từ tác giả.[30m            [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu
:: THONG BAO DANG CHAY CHUONG TRINH ::

:: THONG BAO LOI FILE EXE ::
:errorexe
mode con: cols=62 lines=13
cls
echo        [30m[1m │  [1mQuá trình cài đặt bị kết thúc bất ngờ ...[30m   │
echo         ╰──────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│   [91mTrình cài đặt không thể tiếp tục vì bạn  [30m[91m│[30m
echo          [91m│ [91mđã đổi tên tập tin trình cài đặt. Vui lòng[30m [91m│[30m
echo          [91m│ [91mđổi tên lại mặc định thì trình cài đặt mới[30m [91m│[30m
echo          [91m│ [91m      có thể tiếp tục được. Cảm ơn.       [30m [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
exit /b
:: THONG BAO LOI FILE EXE ::

:: THONG BAO CAI DAT THAT BAI ::
:errorinstalling
mode con: cols=62 lines=14
cls
echo         │  [1mQuá trình cài đặt bị kết thúc bất ngờ ...[30m   │
echo         ╰──────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│ [91mTrình cài đặt không thể tiếp tục vì có thể[30m [91m│[30m
echo          [91m│   [91mbạn không làm đúng như quá trình hoặc[30m    [91m│[30m
echo          [91m│ [91mtập tin bị lỗi do tải xuống không hoàn toàn[30m[91m│[30m
echo          [91m│ [91mhoặc các lỗi khác dẫn đến không thành công.[30m[91m│[30m
echo          [91m│   [91mVui lòng thử lại lần nữa hoặc báo lỗi.[30m   [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu
:: THONG BAO CAI DAT THAT BAI ::

:: PHIEN BAN HE DIEU HANH CHUA DUOC HO TRO ::
:notsupported
mode con: cols=62 lines=8
cls
echo        ================================================
echo       [ Trinh cai dat khong the tiep tuc vi phien ban  ]
echo       [  Windows cua ban hien tai chua duoc ho tro.    ]
echo       [  Vui long su dung/cap nhat len Windows 10 de   ]
echo       [      duoc ho tro va trai nghiem tot nhat.      ] 
echo       [ Phan mem se ho tro phien ban Windows khac som. ]
echo        ================================================
pause >nul
exit /b
:: PHIEN BAN HE DIEU HANH CHUA DUOC HO TRO ::


:: THONG BAO TINH NANG DANG DUOC CAP NHAT ::
:notavailable
mode con: cols=62 lines=13

cls 
echo         │         [1mTính năng này chưa có sẵn ...[30m        │
echo         ╰──────────────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│         [91mTính năng này chưa có sẵn..[30m        [91m│[30m
echo          [91m│       [91mVui lòng đợi ở bản cập nhật[30m          [91m│[30m
echo          [91m│         [91mtiếp theo nhé. Xin lỗi vì[30m          [91m│[30m
echo          [91m│              [91msự bất tiện này..[30m             [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                   [1mQuá trình cài đặt thất bại.[30m
echo            [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu
:: THONG BAO TINH NANG DANG DUOC CAP NHAT ::

:: THONG BAO CHUA CAI DAT PHAN MEM ::
:noinstalled
mode con: cols=62 lines=13
cls 
echo             │    [1mPhần mềm này chưa được cài đặt[30m   │
echo             ╰─────────────────────────────────────╯
echo          [91m╭────────────────────────────────────────────╮[30m
echo          [91m│      [91mBạn không thể tiếp tục quá trình [30m     [91m│[30m
echo          [91m│   [91mgỡ cài đặt phần mềm này vì phần mềm này[30m  [91m│[30m
echo          [91m│  [91mchưa được cài đặt. Vui lòng thử lại sau.[30m  [91m│[30m
echo          [91m│     [91mNếu đây là lỗi, vui lòng báo lỗi.[30m      [91m│[30m
echo          [91m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════════
echo.
echo                 [1mQuá trình gỡ cài đặt thất bại.[30m
echo             [1mNhấn phím bất kỳ để quay lại menu chính[30m
pause >nul
goto :menu
:: THONG BAO CHUA CAI DAT PHAN MEM ::


:: THIET LAP TAT CA CAI DAT VE MAC DINH ::
:resetallsettings
title Thiết lập cài đặt về mặc định
mode con: cols=58 lines=13
cls
echo  [32m╭──────────────────────────────────────────────────────╮[30m
echo  [32m│    [94mBạn có chắc là muốn khôi phục tất cả cài đặt[30m      [32m│[30m[30m
echo  [32m│      [94mvề mặc định không? Sau khi đồng ý, tất cả [30m      [32m│[30m[30m
echo  [32m│   [94mthiết lập, ghi nhớ sẽ bị xoá và không khôi phục[30m    [32m│[30m[30m
echo  [32m│[94mlại được. Điều này chỉ diễn ra trong phạm vi phần mềm.[30m[32m│[30m[30m
echo  [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo         [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo         [32m│ [36m[2][30m Không, hãy quay lại công cụ hỗ trợ.[32m│[30m[30m
echo         [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p resetsettings=    [94m╾[30m [1mVui lòng chọn:[30m  
if %resetsettings%==1 goto :acceptresetallsettings
if %resetsettings%==2 goto :menu
goto :resetallsettings

:acceptresetallsettings
mode con: cols=58 lines=11
cls
del "%appdata%\temp.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\7z.exe" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del %appdata%\7z.dll /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\wget.exe" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%temp%\browse.vbs" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\nircmdc.exe" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%appdata%\bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
cls
echo   │       [1mĐã khôi phục cài đặt gốc thành công ...[30m      │
echo   ╰────────────────────────────────────────────────────╯
echo       [95m╭────────────────────────────────────────────╮[30m
echo       [95m│   [92mTrình cài đặt đã khôi phục cài đặt gốc[30m   [95m│[30m
echo       [95m│  [92mthành công. Trình cài đặt sẽ tự động tắt[30m  [95m│[30m
echo       [95m│         [92mtrong 3 giây nữa để áp dụng.[30m       [95m│[30m
echo       [95m╰────────────────────────────────────────────╯[30m
echo ══════════════════════════════════════════════════════════
echo.
echo                 [1mĐang tiến hành quá trình...[30m
ping 127.0.0.1 -n 4 >nul
exit /b
goto :menu
:: THIET LAP TAT CA CAI DAT VE MAC DINH ::

:: BAT DAU CAI DAT LIGHTROOM ::
:lightroom
cls
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobelightroom.bangmaple" (
	goto :checklightroom ) else (
		goto :lightroom_1 )
:checklightroom
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checklightroom=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checklightroom%==1 goto :lightroom_1
if %checklightroom%==2 goto :menu
goto :checklightroom
::
:lightroom_1
if exist "%homedrive%\Program Files (x86)" ( goto :lightroom_x64 ) else ( goto :lightroom_x86 )
:lightroom_x64
if not exist "%~dp0\lightroom_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │      [1mCài đặt Adobe Lightroom Classic CC 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe Lightroom Classic CC 64-bit.   [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p lightroominstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %lightroominstallation_x64%==1 goto :lightroominstall_x64
if %lightroominstallation_x64%==2 goto :menu
goto :lightroom_x64
:lightroominstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :lightroominstall_x64
IF DEFINED defaultWS ( goto :continueinstallinglightroom_x64 ))
:continueinstallinglightroom_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mĐang cài đặt Adobe Lightroom Classic CC 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\lightroom_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Lightroom Classic CC\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Lightroom Classic CC\lightroom.exe" "~$folder.desktop$" "Adobe Lightroom Classic CC" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Lightroom Classic CC>"%appdata%\bangmaple\uninstalladobelightroom.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:lightroom_x86
if not exist "%~dp0\lightroom_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │    [1mCài đặt Adobe Photoshop Lightroom 5.7.1 32-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│     [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m     [32m│[30m[30m
echo    [32m│   [94mphần mềm Adobe Photoshop Lightroom 5.7.1 32-bit.   [30m[32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p lightroominstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %lightroominstallation_x86%==1 goto :lightroominstall_x86
if %lightroominstallation_x86%==2 goto :menu
goto :lightroom_x86
:lightroominstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :lightroominstall_x86
IF DEFINED defaultWS ( goto :continueinstallinglightroom_x86 ))
:continueinstallinglightroom_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mCài đặt Adobe Photoshop Lightroom 5.7.1 32-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\lightroom_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Photoshop Lightroom 5.7.1\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Photoshop Lightroom 5.7.1\lightroom.exe" "~$folder.desktop$" "Adobe Lightroom 5.7.1" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Photoshop Lightroom 5.7.1>"%appdata%\bangmaple\uninstalladobelightroom.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT LIGHTROOM ::

:: GO CAI DAT LIGHTROOM ::
:uninstalladobelightroom
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobelightroom_x64 ) else ( goto :uninstalladobelightroom_x86 )
goto :menu

:uninstalladobelightroom_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobelightroom.bangmaple" ( goto :noinstalled )
set /p lightroomuninstallx64=<"%appdata%\bangmaple\uninstalladobelightroom.bangmaple"
if not defined lightroomuninstallx64 ( goto :noinstalled )
if not exist %lightroomuninstallx64% ( goto :noinstalled )
echo   │    [1mGỡ cài đặt Adobe Lightroom Classic CC 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe Lightroom Classic CC 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobelightroom_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobelightroom_x64%==1 goto :continueuninstallinglightroom_x64
if %uninstalladobelightroom_x64%==2 goto :menu
goto :uninstalladobelightroom_x64

:continueuninstallinglightroom_x64
mode con: cols=62 lines=17
cls
echo   │    [1mGỡ cài đặt Adobe Lightroom Classic CC 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %lightroomuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobelightroom.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Lightroom Classic CC.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobelightroom_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobelightroom.bangmaple" ( goto :noinstalled )
set /p lightroomuninstallx86=<"%appdata%\bangmaple\uninstalladobelightroom.bangmaple"
if not defined lightroomuninstallx86 ( goto :noinstalled )
if not exist %lightroomuninstallx86% ( goto :noinstalled )
echo   │  [1mGỡ cài đặt Adobe Photoshop Lightroom 5.7.1 32-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│   [94mphần mềm Adobe Photoshop Lightroom 5.7.1 32-bit.   [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobelightroom_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobelightroom_x86%==1 goto :continueuninstallinglightroom_x86
if %uninstalladobelightroom_x86%==2 goto :menu
goto :uninstalladobelightroom_x86

:continueuninstallinglightroom_x86
mode con: cols=62 lines=18
cls
echo   │  [1mGỡ cài đặt Adobe Photoshop Lightroom 5.7.1 32-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %lightroomuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobelightroom.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Lightroom 5.7.1.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: GO CAI DAT LIGHTROOM ::

:: BAT DAU CAI DAT PRELUDE ::
:prelude
cls
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeprelude.bangmaple" (
	goto :checkprelude ) else (
		goto :prelude_1 )
:checkprelude
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkprelude=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkprelude%==1 goto :prelude_1
if %checkprelude%==2 goto :menu
goto :checkprelude
::
:prelude_1
if exist "%homedrive%\Program Files (x86)" ( goto :prelude_x64 ) else ( goto :prelude_x86 )
:prelude_x64
if not exist "%~dp0\prelude_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │         [1mCài đặt Adobe Prelude CC 2018 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Prelude CC 2018 64-bit.     [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p preludeinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %preludeinstallation_x64%==1 goto :preludeinstall_x64
if %preludeinstallation_x64%==2 goto :menu
goto :prelude_x64
:preludeinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :preludeinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingprelude_x64 ))
:continueinstallingprelude_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Prelude CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\prelude_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Prelude CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Prelude CC 2018\Adobe Prelude.exe" "~$folder.desktop$" "Adobe Prelude CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Prelude CC 2018>"%appdata%\bangmaple\uninstalladobeprelude.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:prelude_x86
if not exist "%~dp0\prelude_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │          [1mCài đặt Adobe Prelude CS6 32-bit... [30m          │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│           [94mphần mềm Adobe Prelude CS6 32-bit.       [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p preludeinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %preludeinstallation_x86%==1 goto :preludeinstall_x86
if %preludeinstallation_x86%==2 goto :menu
goto :prelude_x86
:preludeinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :preludeinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingprelude_x86 ))
:continueinstallingprelude_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │         [1mĐang cài đặt Adobe Prelude CS6 32-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\prelude_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Prelude CS6\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Audition CS6\Adobe Prelude.exe" "~$folder.desktop$" "Adobe Prelude CS6" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Prelude CS6>"%appdata%\bangmaple\uninstalladobeprelude.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PRELUDE ::

:: GO CAI PRELUDE ::
:uninstalladobeprelude
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeprelude_x64 ) else ( goto :uninstalladobeprelude_x86 )
goto :menu

:uninstalladobeprelude_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeprelude.bangmaple" ( goto :noinstalled )
set /p preludeuninstallx64=<"%appdata%\bangmaple\uninstalladobeprelude.bangmaple"
if not defined preludeuninstallx64 ( goto :noinstalled )
if not exist %preludeuninstallx64% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Prelude CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Prelude CC 2018 64-bit.       [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeprelude_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeprelude_x64%==1 goto :continueuninstallingprelude_x64
if %uninstalladobeprelude_x64%==2 goto :menu
goto :uninstalladobeprelude_x64

:continueuninstallingprelude_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Prelude CC 2018 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %preludeuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeprelude.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Prelude CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobeprelude_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeprelude.bangmaple" ( goto :noinstalled )
set /p preludeuninstallx86=<"%appdata%\bangmaple\uninstalladobeprelude.bangmaple"
if not defined preludeuninstallx86 ( goto :noinstalled )
if not exist %preludeuninstallx86% ( goto :noinstalled )
echo   │         [1mGỡ cài đặt Adobe Prelude CS6 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Prelude CC 2018 32-bit.        [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeprelude_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeprelude_x86%==1 goto :continueuninstallingprelude_x86
if %uninstalladobeprelude_x86%==2 goto :menu
goto :uninstalladobeprelude_x86

:continueuninstallingprelude_x86
mode con: cols=62 lines=18
cls
echo   │         [1mGỡ cài đặt Adobe Prelude CS6 32-bit... [30m         │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %preludeuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeprelude.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Prelude CS6.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: KET THUC CAI DAT PRELUDE ::

:: BAT DAU CAI DAT CHARACTER ANIMATOR ::
:char_ani
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobechar_ani.bangmaple" (
	goto :checkchar_ani ) else (
		goto :char_ani_1 )
:checkchar_ani
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkchar_ani=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkchar_ani%==1 goto :char_ani_1
if %checkchar_ani%==2 goto :menu
goto :checkchar_ani
::
:char_ani_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :char_ani_x64 ) else ( goto :errorinstalling )
:char_ani_x64
if not exist %~dp0\char_ani_x64.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │  [1mCài đặt Adobe Character Animator CC 2018 64-bit... [30m  │
echo   ╰───────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│  [94mphần mềm Adobe Character Animator CC 2018 64-bit. [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p char_aniinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %char_aniinstallation_x64%==1 goto :char_aniinstall_x64
if %char_aniinstallation_x64%==2 goto :menu
goto :char_ani_x64
:char_aniinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :char_aniinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingchar_ani_x64 ))
:continueinstallingchar_ani_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │ [1mĐang cài đặt Adobe Character Animator CC 2018 64-bit...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\char_ani_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Character Animator CC 2018\Support Files\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Character Animator CC 2018\Support Files\Character Animator.exe" "~$folder.desktop$" "Adobe Character Animator CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Character Animator CC 2018>"%appdata%\bangmaple\uninstalladobechar_ani.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobechar_ani
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobechar_ani_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobechar_ani_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobechar_ani.bangmaple" ( goto :noinstalled )
set /p char_aniuninstallx64=<"%appdata%\bangmaple\uninstalladobechar_ani.bangmaple"
if not defined char_aniuninstallx64 ( goto :noinstalled )
if not exist %char_aniuninstallx64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Character Animator CC 2018... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│     [94mphần mềm Adobe Character Animator CC 2018.     [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobechar_ani_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobechar_ani_x64%==1 goto :continueuninstallingchar_ani_x64
if %uninstalladobechar_ani_x64%==2 goto :menu
goto :uninstalladobechar_ani_x64

:continueuninstallingchar_ani_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe Character Animator CC 2018... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %char_aniuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobechar_ani.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Character Animator CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT CHARACTOR ANIMATOR ::

:: BAT DAU CAI DAT DREAMWEAVER ::
:dreamweaver
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple" (
	goto :checkdreamweaver ) else (
		goto :dreamweaver_1 )
:checkdreamweaver
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkdreamweaver=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkdreamweaver%==1 goto :dreamweaver_1
if %checkdreamweaver%==2 goto :menu
goto :dreamweaver
::
:dreamweaver_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :dreamweaver_x64 ) else ( goto :dreamweaver_x86 )
:dreamweaver_x64
if not exist "%~dp0\dreamweaver_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Dreamweaver CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Dreamweaver CC 2018 64-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p dreamweaverinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %dreamweaverinstallation_x64%==1 goto :dreamweaverinstall_x64
if %dreamweaverinstallation_x64%==2 goto :menu
goto :dreamweaver_x64
:dreamweaverinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :dreamweaverinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingdreamweaver_x64 ))
:continueinstallingdreamweaver_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Dreamweaver CC 2018 64-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\dreamweaver_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Dreamweaver CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Dreamweaver CC 2018\dreamweaver.exe" "~$folder.desktop$" "Adobe Dreamweaver CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Dreamweaver CC 2018>"%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:dreamweaver_x86
if not exist %~dp0\dreamweaver_x86.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Dreamweaver CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Dreamweaver CC 2018 32-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p dreamweaverinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %dreamweaverinstallation_x86%==1 goto :dreamweaverinstall_x86
if %dreamweaverinstallation_x86%==2 goto :menu
goto :dreamweaver_x86
:dreamweaverinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :dreamweaverinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingdreamweaver_x86 ))
:continueinstallingdreamweaver_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Dreamweaver CC 2018 32-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\dreamweaver_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Dreamweaver CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Dreamweaver CC 2018\dreamweaver.exe" "~$folder.desktop$" "Adobe Dreamweaver CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Dreamweaver CC 2018>"%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT DREAMWEAVER ::

:: GO CAI DREAMWEAVER ::
:uninstalladobedreamweaver
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobedreamweaver_x64 ) else ( goto :uninstalladobedreamweaver_x86 )
goto :menu
:uninstalladobedreamweaver_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple" ( goto :noinstalled )
set /p dreamweaveruninstallx64=<"%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple"
if not defined dreamweaveruninstallx64 ( goto :noinstalled )
if not exist %dreamweaveruninstallx64% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Dreamweaver CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Dreamweaver CC 2018 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobedreamweaver_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobedreamweaver_x64%==1 goto :continueuninstallingdreamweaver_x64
if %uninstalladobedreamweaver_x64%==2 goto :menu
goto :uninstalladobedreamweaver_x64

:continueuninstallingdreamweaver_x64
mode con: cols=62 lines=17
cls
echo   │      [1mGỡ cài đặt Adobe Dreamweaver CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %dreamweaveruninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Dreamweaver CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobedreamweaver_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple" ( goto :noinstalled )
set /p dreamweaveruninstallx86=<"%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple"
if not defined dreamweaveruninstallx86 ( goto :noinstalled )
if not exist %dreamweaveruninstallx86% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Dreamweaver CC 2018 32-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Dreamweaver CC 2018 32-bit.     [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobedreamweaver_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobedreamweaver_x86%==1 goto :continueuninstallingdreamweaver_x86
if %uninstalladobedreamweaver_x86%==2 goto :menu
goto :uninstalladobedreamweaver_x86

:continueuninstallingdreamweaver_x86
mode con: cols=62 lines=18
cls
echo   │      [1mGỡ cài đặt Adobe Dreamweaver CC 2018 32-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %dreamweaveruninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobedreamweaver.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Dreamweaver CC 2018 (32 Bit).lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT DREAMWEAVER ::

:: BAT DAU CAI DAT ANIMATE ::
:animate
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeanimate.bangmaple" (
	goto :checkanimate ) else (
		goto :animate_1 )
:checkanimate
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkanimate=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkanimate%==1 goto :animate_1
if %checkanimate%==2 goto :menu
goto :animate
::
:animate_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :animate_x64 ) else ( goto :errorinstalling )
:animate_x64
if not exist "%~dp0\animate_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo          │      [1mCài đặt Adobe Animate CC 2018... [30m    │
echo          ╰───────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│           [94mphần mềm Adobe Animate CC 2018.          [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p animateinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %animateinstallation_x64%==1 goto :animateinstall_x64
if %animateinstallation_x64%==2 goto :menu
goto :animate_x64
:animateinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :animateinstall_x64
IF DEFINED defaultWS ( goto :continueinstallinganimate_x64 ))
:continueinstallinganimate_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo          │    [1mĐang cài đặt Adobe Animate CC 2018... [30m │
echo          ╰───────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\animate_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Animate CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Animate CC 2018\Animate.exe" "~$folder.desktop$" "Adobe Animate CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Animate CC 2018>"%appdata%\bangmaple\uninstalladobeanimate.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: BAT DAU GO CAI DAT ANIMATE
:uninstalladobeanimate
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeanimate_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobeanimate_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeanimate.bangmaple" ( goto :noinstalled )
set /p animateuninstallx64=<"%appdata%\bangmaple\uninstalladobeanimate.bangmaple"
if not defined animateuninstallx64 ( goto :noinstalled )
if not exist %animateuninstallx64% ( goto :noinstalled )
echo          │     [1mGỡ cài đặt Adobe Animate CC 2018... [30m  │
echo          ╰───────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│          [94mphần mềm Adobe Animate CC 2018.           [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeanimate_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeanimate_x64%==1 goto :continueuninstallinganimate_x64
if %uninstalladobeanimate_x64%==2 goto :menu
goto :uninstalladobeanimate_x64

:continueuninstallinganimate_x64
mode con: cols=62 lines=17
cls
echo         │     [1mGỡ cài đặt Adobe Animate CC 2018... [30m  │
echo         ╰───────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %animateuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeanimate.bangmaple" /1s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Animate CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT ANIMATE ::

:: BAT DAU CAI DAT AFTER EFFECT ::
:after_effects
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple" (
	goto :checkafter_effects ) else (
		goto :after_effects_1 )
:checkafter_effects
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkafter_effects=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkafter_effects%==1 goto :after_effects_1
if %checkafter_effects%==2 goto :menu
goto :after_effects
::
:after_effects_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :after_effects_x64 ) else ( goto :errorinstalling )
:after_effects_x64
if not exist "%~dp0\after_effects_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │      [1mCài đặt Adobe After Effects CC 2018 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe After Effects CC 2018 64-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p after_effectsinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %after_effectsinstallation_x64%==1 goto :after_effectsinstall_x64
if %after_effectsinstallation_x64%==2 goto :menu
goto :after_effects_x64
:after_effectsinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :after_effectsinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingafter_effects_x64 ))
:continueinstallingafter_effects_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mĐang cài đặt Adobe After Effects CC 2018 64-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\after_effects_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe After Effects CC 2018\Support Files\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe After Effects CC 2018\Support Files\AfterFX.exe" "~$folder.desktop$" "Adobe After Effects CC 2018" >nul
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe After Effects CC 2018\Support Files\AfterFX-re.exe" "~$folder.desktop$" "Adobe After Effects Render Engine" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe After Effects CC 2018>"%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT AFTER EFFECTS ::

:: GO CAI AFTER EFFECTS ::
:uninstalladobeafter_effects
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeafter_effects_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobeafter_effects_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple" ( goto :noinstalled )
set /p after_effectsuninstallx64=<"%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple"
if not defined after_effectsuninstallx64 ( goto :noinstalled )
if not exist %after_effectsuninstallx64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe After Effects CC 2018 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│     [94mphần mềm Adobe After Effects CC 2018 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeafter_effects_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeafter_effects_x64%==1 goto :continueuninstallingafter_effects_x64
if %uninstalladobeafter_effects_x64%==2 goto :menu
goto :uninstalladobeafter_effects_x64

:continueuninstallingafter_effects_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe After Effects CC 2018 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %after_effectsuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeafter_effects.bangmaple" /1s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe After Effects CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe After Effects Render Engine.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT AFTER EFFECT ::

:: BAT DAU CAI DAT PREMIERE PRO ::
:premiere_pro
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple" (
	goto :checkpremiere_pro ) else (
		goto :premiere_pro_1 )
:checkpremiere_pro
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkpremiere_pro=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkpremiere_pro%==1 goto :premiere_pro_1
if %checkpremiere_pro%==2 goto :menu
goto :premiere_pro
::
:premiere_pro_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :premiere_pro_x64 ) else ( goto :errorinstalling )
:premiere_pro_x64
if not exist "%~dp0\premiere_pro_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │      [1mCài đặt Adobe Premiere Pro CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe Premiere Pro CC 2018 64-bit.   [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p premiere_proinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %premiere_proinstallation_x64%==1 goto :premiere_proinstall_x64
if %premiere_proinstallation_x64%==2 goto :menu
goto :premiere_pro_x64
:premiere_proinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :premiere_proinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingpremiere_pro_x64 ))
:continueinstallingpremiere_pro_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mĐang cài đặt Adobe Premiere Pro CC 2018 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\premiere_pro_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Premiere Pro CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Premiere Pro CC 2018\Adobe Premiere Pro.exe" "~$folder.desktop$" "Adobe Premiere Pro CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Premiere Pro CC 2018>"%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PREMIERE PRO ::

:: GO CAI PREMIERE PRO ::
:uninstalladobepremiere_pro
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobepremiere_pro_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobepremiere_pro_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple" ( goto :noinstalled )
set /p premiere_prouninstallx64=<"%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple"
if not defined premiere_prouninstallx64 ( goto :noinstalled )
if not exist %premiere_prouninstallx64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Premiere Pro CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│     [94mphần mềm Adobe Premiere Pro CC 2018 64-bit.    [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobepremiere_pro_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobepremiere_pro_x64%==1 goto :continueuninstallingpremiere_pro_x64
if %uninstalladobepremiere_pro_x64%==2 goto :menu
goto :uninstalladobepremiere_pro_x64

:continueuninstallingpremiere_pro_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe Premiere Pro CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %premiere_prouninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobepremiere_pro.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Premiere Pro CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: KET THUC CAI DAT PREMIERE PRO ::


:: BAT DAU CAI DAT AUDITION ::
:audition
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeaudition.bangmaple" (
	goto :checkaudition ) else (
		goto :audition_1 )
:checkaudition
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkaudition=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkaudition%==1 goto :audition_1
if %checkaudition%==2 goto :menu
goto :audition
::
:audition_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :audition_x64 ) else ( goto :audition_x86 )
:audition_x64
if not exist "%~dp0\audition_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │        [1mCài đặt Adobe Audition CC 2018 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Audition CC 2018 64-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p auditioninstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %auditioninstallation_x64%==1 goto :auditioninstall_x64
if %auditioninstallation_x64%==2 goto :menu
goto :audition_x64
:auditioninstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :auditioninstall_x64
IF DEFINED defaultWS ( goto :continueinstallingaudition_x64 ))
:continueinstallingaudition_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Audition CC 2018 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\audition_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Audition CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Audition CC 2018\Adobe Audition CC.exe" "~$folder.desktop$" "Adobe Audition CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Audition CC 2018>"%appdata%\bangmaple\uninstalladobeaudition.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:audition_x86
if not exist %~dp0\audition_x86.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │         [1mCài đặt Adobe Audition CS6 32-bit... [30m          │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│           [94mphần mềm Adobe Audition CS6 32-bit.      [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p auditioninstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %auditioninstallation_x86%==1 goto :auditioninstall_x86
if %auditioninstallation_x86%==2 goto :menu
goto :audition_x86
:auditioninstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :auditioninstall_x86
IF DEFINED defaultWS ( goto :continueinstallingaudition_x86 ))
:continueinstallingaudition_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │        [1mĐang cài đặt Adobe Audition CS6 32-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\audition_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Audition CS6\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Audition CS6\Adobe Audition CS6.exe" "~$folder.desktop$" "Adobe Audition CS6" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Audition CS6>"%appdata%\bangmaple\uninstalladobeaudition.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT AUDITION ::

:: GO CAI AUDITION ::
:uninstalladobeaudition
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeaudition_x64 ) else ( goto :uninstalladobeaudition_x86 )
goto :menu

:uninstalladobeaudition_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeaudition.bangmaple" ( goto :noinstalled )
set /p auditionuninstallx64=<"%appdata%\bangmaple\uninstalladobeaudition.bangmaple"
if not defined auditionuninstallx64 ( goto :noinstalled )
if not exist %auditionuninstallx64% ( goto :noinstalled )
echo   │       [1mGỡ cài đặt Adobe Audition CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Audition CC 2018 64-bit.      [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeaudition_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeaudition_x64%==1 goto :continueuninstallingaudition_x64
if %uninstalladobeaudition_x64%==2 goto :menu
goto :uninstalladobeaudition_x64

:continueuninstallingaudition_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Audition CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %auditionuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeaudition.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Audition CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobeaudition_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeaudition.bangmaple" ( goto :noinstalled )
set /p auditionuninstallx86=<"%appdata%\bangmaple\uninstalladobeaudition.bangmaple"
if not defined auditionuninstallx86 ( goto :noinstalled )
if not exist %auditionuninstallx86% ( goto :noinstalled )
echo   │         [1mGỡ cài đặt Adobe Audition CS6 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Audition CC 2018 32-bit.        [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeaudition_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeaudition_x86%==1 goto :continueuninstallingaudition_x86
if %uninstalladobeaudition_x86%==2 goto :menu
goto :uninstalladobeaudition_x86

:continueuninstallingaudition_x86
mode con: cols=62 lines=18
cls
echo   │         [1mGỡ cài đặt Adobe Audition CS6 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %auditionuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeaudition.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Audition CS6.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: KET THUC CAI DAT AUDITION ::


:: BAT DAU CAI DAT MEDIA ENCODER ::
:media_encoder
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" (
	goto :checkmedia_encoder ) else (
		goto :media_encoder_1 )
:checkmedia_encoder
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkmedia_encoder=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkmedia_encoder%==1 goto :media_encoder_1
if %checkmedia_encoder%==2 goto :menu
goto :media_encoder
::
:media_encoder_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :media_encoder_x64 ) else ( goto :media_encoder_x86 )
:media_encoder_x64
if not exist "%~dp0\media_encoder_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │     [1mCài đặt Adobe Media Encoder CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe Media Encoder CC 2018 64-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p media_encoderinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %media_encoderinstallation_x64%==1 goto :media_encoderinstall_x64
if %media_encoderinstallation_x64%==2 goto :menu
goto :media_encoder_x64
:media_encoderinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :media_encoderinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingmedia_encoder_x64 ))
:continueinstallingmedia_encoder_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │     [1mCài đặt Adobe Media Encoder CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\media_encoder_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Media Encoder CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Media Encoder CC 2018\Adobe Media Encoder.exe" "~$folder.desktop$" "Adobe Media Encoder CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Media Encoder CC 2018>"%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:media_encoder_x86
if not exist "%~dp0\media_encoder_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Media Encoder CS6 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Media Encoder CS6 32-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p media_encoderinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %media_encoderinstallation_x86%==1 goto :media_encoderinstall_x86
if %media_encoderinstallation_x86%==2 goto :menu
goto :media_encoder_x86
:media_encoderinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :media_encoderinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingmedia_encoder_x86 ))
:continueinstallingmedia_encoder_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Media Encoder CS6 32-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\media_encoder_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Media Encoder CS6\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Media Encoder CS6\Adobe Media Encoder.exe" "~$folder.desktop$" "Adobe Media Encoder CS6" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Media Encoder CS6>"%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT MEDIA ENCODER ::

:: GO CAI MEDIA ENCODER ::
:uninstalladobemedia_encoder
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobemedia_encoder_x64 ) else ( goto :uninstalladobemedia_encoder_x86 )
goto :menu

:uninstalladobemedia_encoder_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" ( goto :noinstalled )
set /p media_encoderuninstallx64=<"%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple"
if not defined media_encoderuninstallx64 ( goto :noinstalled )
if not exist %media_encoderuninstallx64% ( goto :noinstalled )
echo   │    [1mGỡ cài đặt Adobe Media Encoder CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│    [94mphần mềm Adobe Media Encoder CC 2018 64-bit.    [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobemedia_encoder_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobemedia_encoder_x64%==1 goto :continueuninstallingmedia_encoder_x64
if %uninstalladobemedia_encoder_x64%==2 goto :menu
goto :uninstalladobemedia_encoder_x64

:continueuninstallingmedia_encoder_x64
mode con: cols=62 lines=17
cls
echo   │    [1mGỡ cài đặt Adobe Media Encoder CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %media_encoderuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Media Encoder CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobemedia_encoder_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" ( goto :noinstalled )
set /p media_encoderuninstallx86=<"%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple"
if not defined media_encoderuninstallx86 ( goto :noinstalled )
if not exist %media_encoderuninstallx86% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Media Encoder CS6 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Media Encoder CS6 32-bit.       [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobemedia_encoder_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobemedia_encoder_x86%==1 goto :continueuninstallingmedia_encoder_x86
if %uninstalladobemedia_encoder_x86%==2 goto :menu
goto :uninstalladobemedia_encoder_x86

:continueuninstallingmedia_encoder_x86
mode con: cols=62 lines=18
cls
echo   │      [1mGỡ cài đặt Adobe Media Encoder CS6 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %media_encoderuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobemedia_encoder.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe media Encoder CS6.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT MEDIA ENCODER ::

:: BAT DAU CAI DAT PHOTOSHOP ::
:photoshop
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobephotoshop.bangmaple" (
	goto :checkphotoshop ) else (
		goto :photoshop_1 )
:checkphotoshop
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkphotoshop=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkphotoshop%==1 goto :photoshop_1
if %checkphotoshop%==2 goto :menu
goto :photoshop
::
:photoshop_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :photoshop_x64 ) else ( goto :photoshop_x86 )
:photoshop_x64
if not exist "%~dp0\photoshop_x64.bm_" ( goto :errorinstalling )
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Photoshop CC 2018 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Photoshop CC 2018 64-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p photoshopinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %photoshopinstallation_x64%==1 goto :photoshopinstall_x64
if %photoshopinstallation_x64%==2 goto :menu
goto :photoshop_x64
:photoshopinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :photoshopinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingphotoshop_x64 ))
:continueinstallingphotoshop_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Photoshop CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\photoshop_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Photoshop CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Photoshop CC 2018\photoshop.exe" "~$folder.desktop$" "Adobe Photoshop CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Photoshop CC 2018>"%appdata%\bangmaple\uninstalladobephotoshop.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:photoshop_x86
if not exist "%~dp0\photoshop_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Photoshop CC 2018 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Photoshop CC 2018 32-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p photoshopinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %photoshopinstallation_x86%==1 goto :photoshopinstall_x86
if %photoshopinstallation_x86%==2 goto :menu
goto :photoshop_x86
:photoshopinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :photoshopinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingphotoshop_x86 ))
:continueinstallingphotoshop_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Photoshop CC 2018 32-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\photoshop_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Photoshop CC 2018 (32 Bit)\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Photoshop CC 2018 (32 Bit)\photoshop.exe" "~$folder.desktop$" "Adobe Photoshop CC 2018 (32 Bit)" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Photoshop CC 2018 (32 Bit)>"%appdata%\bangmaple\uninstalladobephotoshop.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PHOTOSHOP ::

:: GO CAI PHOTOSHOP ::
:uninstalladobephotoshop
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobephotoshop_x64 ) else ( goto :uninstalladobephotoshop_x86 )
goto :menu

:uninstalladobephotoshop_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobephotoshop.bangmaple" ( goto :noinstalled )
set /p photoshopuninstallx64=<"%appdata%\bangmaple\uninstalladobephotoshop.bangmaple"
if not defined photoshopuninstallx64 ( goto :noinstalled )
if not exist %photoshopuninstallx64% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Photoshop CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Photoshop CC 2018 64-bit.     [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobephotoshop_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobephotoshop_x64%==1 goto :continueuninstallingphotoshop_x64
if %uninstalladobephotoshop_x64%==2 goto :menu
goto :uninstalladobephotoshop_x64

:continueuninstallingphotoshop_x64
mode con: cols=62 lines=17
cls
echo   │      [1mGỡ cài đặt Adobe Photoshop CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %photoshopuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobephotoshop.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Photoshop CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobephotoshop_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobephotoshop.bangmaple" ( goto :noinstalled )
set /p photoshopuninstallx86=<"%appdata%\bangmaple\uninstalladobephotoshop.bangmaple"
if not defined photoshopuninstallx86 ( goto :noinstalled )
if not exist %photoshopuninstallx86% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Photoshop CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Photoshop CC 2018 32-bit.       [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobephotoshop_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobephotoshop_x86%==1 goto :continueuninstallingphotoshop_x86
if %uninstalladobephotoshop_x86%==2 goto :menu
goto :uninstalladobephotoshop_x86

:continueuninstallingphotoshop_x86
mode con: cols=62 lines=18
cls
echo   │      [1mGỡ cài đặt Adobe Photoshop CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %photoshopuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobephotoshop.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Photoshop CC 2018 (32 Bit).lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: GO CAI DAT PHOTOSHOP ::

:: BAT DAU CAI DAT BRIDGE ::
:bridge
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobebridge.bangmaple" (
	goto :checkbridge ) else (
		goto :bridge_1 )
:checkbridge
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkbridge=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkbridge%==1 goto :bridge_1
if %checkbridge%==2 goto :menu
goto :bridge
::
:bridge_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :bridge_x64 ) else ( goto :bridge_x86 )
:bridge_x64
if not exist %~dp0\bridge_x64.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │         [1mCài đặt Adobe Bridge CC 2018 64-bit... [30m        │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│          [94mphần mềm Adobe Bridge CC 2018 64-bit.     [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p bridgeinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %bridgeinstallation_x64%==1 goto :bridgeinstall_x64
if %bridgeinstallation_x64%==2 goto :menu
goto :bridge_x64
:bridgeinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :bridgeinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingbridge_x64 ))
:continueinstallingbridge_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │        [1mĐang cài đặt Adobe Bridge CC 2018 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x %~dp0\bridge_x64.bm_ -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Bridge CC 2018\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Bridge CC 2018\bridge.exe" "~$folder.desktop$" "Adobe Bridge CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Bridge CC 2018>"%appdata%\bangmaple\uninstalladobebridge.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:bridge_x86
if not exist %~dp0\bridge_x86.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │         [1mCài đặt Adobe Bridge CC 2018 32-bit... [30m        │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Photoshop CC 2018 32-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p bridgeinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %bridgeinstallation_x86%==1 goto :bridgeinstall_x86
if %pbridgeinstallation_x86%==2 goto :menu
goto :bridge_x86
:bridgeinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :bridgeinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingbridge_x86 ))
:continueinstallingbridge_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │        [1mĐang cài đặt Adobe Bridge CC 2018 32-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x %~dp0\bridge_x86.bm_ -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Bridge CC 2018 (32 Bit)\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Bridge CC 2018 (32 Bit)\bridge.exe" "~$folder.desktop$" "Adobe Bridge CC 2018 (32 Bit)" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Bridge CC 2018 (32 Bit)>"%appdata%\bangmaple\uninstalladobebridge.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PHOTOSHOP ::

:: GO CAI BRIDGE ::
:uninstalladobebridge
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobebridge_x64 ) else ( goto :uninstalladobebridge_x86 )
goto :menu

:uninstalladobebridge_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobebridge.bangmaple" ( goto :noinstalled )
set /p bridgeuninstallx64=<"%appdata%\bangmaple\uninstalladobebridge.bangmaple"
if not defined bridgeuninstallx64 ( goto :noinstalled )
if not exist %bridgeuninstallx64% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Bridge CC 2018 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Bridge CC 2018 64-bit.      [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobebridge_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobebridge_x64%==1 goto :continueuninstallingbridge_x64
if %uninstalladobebridge_x64%==2 goto :menu
goto :uninstalladobebridge_x64

:continueuninstallingbridge_x64
mode con: cols=62 lines=17
cls
echo   │        [1mGỡ cài đặt Adobe Bridge CC 2018 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %bridgeuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobebridge.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Bridge CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobebridge_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobebridge.bangmaple" ( goto :noinstalled )
set /p bridgeuninstallx86=<"%appdata%\bangmaple\uninstalladobebridge.bangmaple"
if not defined bridgeuninstallx86 ( goto :noinstalled )
if not exist %bridgeuninstallx86% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Bridge CC 2018 32-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Bridge CC 2018 32-bit.        [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobebridge_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobebridge_x86%==1 goto :continueuninstallingbridge_x86
if %uninstalladobebridge_x86%==2 goto :menu
goto :uninstalladobebridge_x86

:continueuninstallingbridge_x86
mode con: cols=62 lines=18
cls
echo   │        [1mGỡ cài đặt Adobe Bridge CC 2018 32-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %bridgeuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobebridge.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Bridge CC 2018 (32 Bit).lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: KET THUC CAI DAT BRIDGE ::


:: BAT DAU CAI DAT ILLUSTRATOR ::
:illustrator
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeillustrator.bangmaple" (
	goto :checkillustrator ) else (
		goto :illustrator_1 )
:checkillustrator
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkillustrator=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkillustrator%==1 goto :bridge_1
if %checkillustrator%==2 goto :menu
goto :illustrator
::
:illustrator_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :illustrator_x64 ) else ( goto :illustrator_x86 )
:illustrator_x64
if not exist "%~dp0\illustrator_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Illustrator CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Ilustrator CC 2018 64-bit.   [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p illustratorinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %illustratorinstallation_x64%==1 goto :illustratorinstall_x64
if %illustratorinstallation_x64%==2 goto :menu
goto :illustrator_x64
:illustratorinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :illustratorinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingillustrator_x64 ))
:continueinstallingillustrator_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mĐang cài đặt Adobe Illustrator CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\illustrator_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Illustrator CC 2018\Support Files\Contents\Windows\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Illustrator CC 2018\Support Files\Contents\Windows\illustrator.exe" "~$folder.desktop$" "Adobe Illustrator CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Illustrator CC 2018>"%appdata%\bangmaple\uninstalladobeillustrator.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:illustrator_x86
if not exist "%~dp0\illustrator_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Illustrator CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Illustrator CC 2018 32-bit.   [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p illustratorinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %illustratorinstallation_x86%==1 goto :illustratorinstall_x86
if %illustratorinstallation_x86%==2 goto :menu
goto :illustrator_x86
:illustratorinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :illustratorinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingillustrator_x86 ))
:continueinstallingillustrator_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mĐang cài đặt Adobe Illustrator CC 2018 32-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\illustrator_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Illustrator CC 2018 (32 Bit)\Support Files\Contents\Windows\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Illustrator CC 2018 (32 Bit)\Support Files\Contents\Windows\illustrator.exe" "~$folder.desktop$" "Adobe Illustrator CC 2018 (32 Bit)" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Illustrator CC 2018 (32 Bit)>"%appdata%\bangmaple\uninstalladobeillustrator.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT ILLUSTRATOR ::

:: GO CAI ILLUSTRATOR ::
:uninstalladobeillustrator
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeillustrator_x64 ) else ( goto :uninstalladobeillustrator_x86 )
goto :menu

:uninstalladobeillustrator_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeillustrator.bangmaple" ( goto :noinstalled )
set /p illustratoruninstallx64=<"%appdata%\bangmaple\uninstalladobeillustrator.bangmaple"
if not defined illustratoruninstallx64 ( goto :noinstalled )
if not exist %illustratoruninstallx64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Illustrator CC 2018 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Illustrator CC 2018 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeillustrator_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeillustrator_x64%==1 goto :continueuninstallingillustrator_x64
if %uninstalladobeillustrator_x64%==2 goto :menu
goto :uninstalladobeillustrator_x64

:continueuninstallingillustrator_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe Illustrator CC 2018 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %illustratoruninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeillustrator.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Illustrator CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobeillustrator_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeillustrator.bangmaple" ( goto :noinstalled )
set /p illustratoruninstallx86=<"%appdata%\bangmaple\uninstalladobeillustrator.bangmaple"
if not defined illustratoruninstallx86 ( goto :noinstalled )
if not exist %illustratoruninstallx86% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Illustrator CC 2018 32-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Illustrator CC 2018 32-bit.     [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeillustrator_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeillustrator_x86%==1 goto :continueuninstallingillustrator_x86
if %uninstalladobeillustrator_x86%==2 goto :menu
goto :uninstalladobeillustrator_x86

:continueuninstallingillustrator_x86
mode con: cols=62 lines=18
cls
echo   │     [1mGỡ cài đặt Adobe Illustrator CC 2018 32-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %illustratoruninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeillustrator.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Illustrator CC 2018 (32 Bit).lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT ILLUSTRATOR ::

:: BAT DAU CAI DAT INCOPY ::
:incopy
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeincopy.bangmaple" (
	goto :checkincopy ) else (
		goto :incopy_1 )
:checkincopy
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkincopy=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkincopy%==1 goto :incopy_1
if %checkincopy%==2 goto :menu
goto :incopy
::
:incopy_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :incopy_x64 ) else ( goto :incopy_x86 )
:incopy_x64
if not exist %~dp0\incopy_x64.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │          [1mCài đặt Adobe Incopy CC 2018 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│          [94mphần mềm Adobe Incopy 2018 64-bit.        [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p incopyinstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %incopyinstallation_x64%==1 goto :incopyinstall_x64
if %incopyinstallation_x64%==2 goto :menu
goto :incopy_x64
:incopyinstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :incopyinstall_x64
IF DEFINED defaultWS ( goto :continueinstallingincopy_x64 ))
:continueinstallingincopy_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mĐang cài đặt Adobe Incopy CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\incopy_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Incopy CC 2018\amtlib.dll" ( goto :errorinstalling )
if not exist "%homedrive%\Program Files (x86)\Common Files\Adobe" ( mkdir "%homedrive%\Program Files (x86)\Common Files\Adobe" )
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" "%defaultWS%\Adobe Incopy CC 2018\Color" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" "%defaultWS%\Adobe Incopy CC 2018\Color Profiles" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Incopy CC 2018\incopy.exe" "~$folder.desktop$" "Adobe Incopy CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Incopy CC 2018>"%appdata%\bangmaple\uninstalladobeincopy.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:incopy_x86
if not exist "%~dp0\incopy_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │          [1mCài đặt Adobe Incopy CC 2018 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Incopy CC 2018 32-bit.       [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p incopyinstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %incopyinstallation_x86%==1 goto :incopyinstall_x86
if %incopyinstallation_x86%==2 goto :menu
goto :incopy_x86
:incopyinstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :incopyinstall_x86
IF DEFINED defaultWS ( goto :continueinstallingincopy_x86 ))
:continueinstallingincopy_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mĐang cài đặt Adobe Incopy CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\incopy_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
if not exist "%homedrive%\Program Files\Common Files\Adobe" ( mkdir "%homedrive%\Program Files\Common Files\Adobe" )
mklink /J "%homedrive%\Program Files\Common Files\Adobe\Color" "%defaultWS%\Adobe Incopy CC 2018 (32-bit)\Color" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
mklink /J "%homedrive%\Program Files\Common Files\Adobe\Color Profiles" "%defaultWS%\Adobe Incopy CC 2018 (32-bit)\Color Profiles" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Incopy CC 2018 (32-bit)\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Incopy CC 2018 (32-bit)\incopy.exe" "~$folder.desktop$" "Adobe Incopy CC 2018 (32-bit)" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Incopy CC 2018 (32-bit)>"%appdata%\bangmaple\uninstalladobeincopy.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT INCOPY ::

:: BAT DAU GO CAI DAT INCOPY ::
:uninstalladobeincopy
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeincopy_x64 ) else ( goto :uninstalladobeincopy_x86 )
goto :menu

:uninstalladobeincopy_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeincopy.bangmaple" ( goto :noinstalled )
set /p incopyuninstallx64=<"%appdata%\bangmaple\uninstalladobeincopy.bangmaple"
if not defined incopyuninstallx64 ( goto :noinstalled )
if not exist %incopyuninstallx64% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Incopy CC 2018 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Incopy CC 2018 64-bit.       [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeincopy_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeincopy_x64%==1 goto :continueuninstallingincopy_x64
if %uninstalladobeincopy_x64%==2 goto :menu
goto :uninstalladobeincopy_x64

:continueuninstallingincopy_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Incopy CC 2018 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %incopyuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\bangmaple\uninstalladobeincopy.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Incopy CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobeincopy_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeincopy.bangmaple" ( goto :noinstalled )
set /p incopyuninstallx86=<"%appdata%\bangmaple\uninstalladobeincopy.bangmaple"
if not defined incopyuninstallx86 ( goto :noinstalled )
if not exist %incopyuninstallx86% ( goto :noinstalled )
echo   │       [1mGỡ cài đặt Adobe Incopy CC 2018 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Incopy CC 2018 32-bit.          [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeincopy_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeincopy_x86%==1 goto :continueuninstallingincopy_x86
if %uninstalladobeincopy_x86%==2 goto :menu
goto :uninstalladobeincopy_x86

:continueuninstallingincopy_x86
mode con: cols=62 lines=18
cls
echo   │       [1mGỡ cài đặt Adobe Incopy CC 2018 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %incopyuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%homedrive%\Program Files\Common Files\Adobe\Color Profiles" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%homedrive%\Program Files\Common Files\Adobe\Color" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\bangmaple\uninstalladobeincopy.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Incopy CC 2018 (32-bit).lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC GO CAI DAT INCOPY ::

:: BAT DAU CAI DAT INDESIGN::
:indesign
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeindesign.bangmaple" (
	goto :checkindesign ) else (
		goto :indesign_1 )
:checkindesign
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkindesign=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkindesign%==1 goto :indesign_1
if %checkindesign%==2 goto :menu
goto :indesign
::
:indesign_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :indesign_x64 ) else ( goto :indesign_x86 )
:indesign_x64
if not exist "%~dp0\indesign_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │        [1mCài đặt Adobe Indesign CC 2018 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Indesign 2018 64-bit.       [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p indesigninstallation_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %indesigninstallation_x64%==1 goto :indesigninstall_x64
if %indesigninstallation_x64%==2 goto :menu
goto :indesign_x64
:indesigninstall_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :indesigninstall_x64
IF DEFINED defaultWS ( goto :continueinstallingindesign_x64 ))
:continueinstallingindesign_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mĐang cài đặt Adobe Indesign CC 2018 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\indesign_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Indesign CC 2018\amtlib.dll" ( goto :errorinstalling )
if not exist "%homedrive%\Program Files (x86)\Common Files\Adobe" ( mkdir "%homedrive%\Program Files (x86)\Common Files\Adobe" )
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" "%defaultWS%\Adobe Indesign CC 2018\Color" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" "%defaultWS%\Adobe Indesign CC 2018\Color Profiles" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Indesign CC 2018\indesign.exe" "~$folder.desktop$" "Adobe Indesign CC 2018" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Indesign CC 2018>"%appdata%\bangmaple\uninstalladobeindesign.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:indesign_x86
if not exist "%~dp0\indesign_x86.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │        [1mCài đặt Adobe Indesign CC 2018 32-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Indesign CC 2018 32-bit.     [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p indesigninstallation_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %indesigninstallation_x86%==1 goto :indesigninstall_x86
if %indesigninstallation_x86%==2 goto :menu
goto :indesign_x86
:indesigninstall_x86
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :indesigninstall_x86
IF DEFINED defaultWS ( goto :continueinstallingindesign_x86 ))
:continueinstallingindesign_x86
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mĐang cài đặt Adobe Indesign CC 2018 32-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\indesign_x86.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
if not exist "%homedrive%\Program Files\Common Files\Adobe" ( mkdir "%homedrive%\Program Files\Common Files\Adobe" )
mklink /J "%homedrive%\Program Files\Common Files\Adobe\Color" "%defaultWS%\Adobe Indesign CC 2018 (32-bit)\Color" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
mklink /J "%homedrive%\Program Files\Common Files\Adobe\Color Profiles" "%defaultWS%\Adobe Indesign CC 2018 (32-bit)\Color Profiles" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Indesign CC 2018 (32-bit)\amtlib.dll" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Indesign CC 2018 (32-bit)\indesign.exe" "~$folder.desktop$" "Adobe Indesign CC 2018 (32-bit)" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo s%defaultWS%\Adobe Indesign CC 2018 (32-bit)>"%appdata%\bangmaple\uninstalladobeindesign.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT INDESIGN ::

:: GO CAI INDESIGN ::
:uninstalladobeindesign
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeindesign_x64 ) else ( goto :uninstalladobeindesign_x86 )
goto :menu

:uninstalladobeindesign_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeindesign.bangmaple" ( goto :noinstalled )
set /p indesignuninstallx64=<"%appdata%\bangmaple\uninstalladobeindesign.bangmaple"
if not defined indesignuninstallx64 ( goto :noinstalled )
if not exist %indesignuninstallx64% ( goto :noinstalled )
echo   │       [1mGỡ cài đặt Adobe Indesign CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Indesign CC 2018 64-bit.      [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeindesign_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeindesign_x64%==1 goto :continueuninstallingindesign_x64
if %uninstalladobeindesign_x64%==2 goto :menu
goto :uninstalladobeindesign_x64

:continueuninstallingindesign_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Indesign CC 2018 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %indesignuninstallx64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\bangmaple\uninstalladobeindesign.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Indesign CC 2018.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobeindesign_x86
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeindesign.bangmaple" ( goto :noinstalled )
set /p indesignuninstallx86=<"%appdata%\bangmaple\uninstalladobeindesign.bangmaple"
if not defined indesignuninstallx86 ( goto :noinstalled )
if not exist %indesignuninstallx86% ( goto :noinstalled )
echo   │       [1mGỡ cài đặt Adobe Indesign CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Indesign CC 2018 32-bit.        [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeindesign_x86=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeindesign_x86%==1 goto :continueuninstallingindesign_x86
if %uninstalladobeindesign_x86%==2 goto :menu
goto :uninstalladobeindesign_x86

:continueuninstallingindesign_x86
mode con: cols=62 lines=18
cls
echo   │       [1mGỡ cài đặt Adobe Indesign CC 2018 32-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %indesignuninstallx86% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%homedrive%\Program Files\Common Files\Adobe\Color Profiles" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%homedrive%\Program Files\Common Files\Adobe\Color" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\bangmaple\uninstalladobeindesign.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Indesign CC 2018 (32-bit).lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: KET THUC CAI DAT INDESIGN ::

:: 2019 PACKS ::
:: BAT DAU CAI DAT PHOTOSHOP CC 2019 ::
:photoshop_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple" (
	goto :checkphotoshop_cc2019 ) else (
		goto :photoshop_cc2019_1 )
:checkphotoshop_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkphotoshop_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkphotoshop_cc2019%==1 goto :photoshop_cc2019_1
if %checkphotoshop_cc2019%==2 goto :menu
goto :photoshop_cc2019
::
:photoshop_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :photoshop_cc2019_x64 ) else ( goto :errorinstalling )
:photoshop_cc2019_x64
if not exist "%~dp0\photoshop_cc2019_x64.bm_" ( goto :errorinstalling )
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Photoshop CC 2019 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Photoshop CC 2019 64-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p photoshopinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %photoshopinstallation_cc2019_x64%==1 goto :photoshopinstall_cc2019_x64
if %photoshopinstallation_cc2019_x64%==2 goto :menu
goto :photoshop_cc2019_x64
:photoshopinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :photoshopinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingphotoshop_cc2019_x64 ))
:continueinstallingphotoshop_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Photoshop CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\photoshop_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Photoshop CC 2019\Photoshop.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Photoshop CC 2019\photoshop.exe" "~$folder.desktop$" "Adobe Photoshop CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Photoshop CC 2019>"%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
::GO CAI DAT PHOTOSHOP CC 2019
:uninstalladobephotoshop_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobephotoshop_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobephotoshop_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple" ( goto :noinstalled )
set /p photoshopuninstallx64_cc2019=<"%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple"
if not defined photoshopuninstallx64_cc2019 ( goto :noinstalled )
if not exist %photoshopuninstallx64_cc2019% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Photoshop CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Photoshop CC 2019 64-bit.     [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobephotoshop_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobephotoshop_cc2019_x64%==1 goto :continueuninstallingphotoshop_cc2019_x64
if %uninstalladobephotoshop_cc2019_x64%==2 goto :menu
goto :uninstalladobephotoshop_cc2019_x64

:continueuninstallingphotoshop_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │      [1mGỡ cài đặt Adobe Photoshop CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %photoshopuninstallx64_cc2019% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobephotoshop_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Photoshop CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
::KET THUC CAI DAT PHOTOSHOP CC 2019::

::BAT DAU CAI DAT ILLUSTRATOR CC 2019::
:illustrator_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple" (
	goto :checkillustrator_cc2019 ) else (
		goto :illustrator_cc2019_1 )
:checkillustrator_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkillustrator_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkillustrator_cc2019%==1 goto :illustrator_cc2019_1
if %checkillustrator_cc2019%==2 goto :menu
goto :illustrator_cc2019
::
:illustrator_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :illustrator_cc2019_x64 ) else ( goto :errorinstalling )
:illustrator_cc2019_x64
if not exist "%~dp0\illustrator_cc2019_x64.bm_" ( goto :errorinstalling )
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Illustrator CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Ilustrator CC 2019 64-bit.   [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p illustratorinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %illustratorinstallation_cc2019_x64%==1 goto :illustratorinstall_cc2019_x64
if %illustratorinstallation_cc2019_x64%==2 goto :menu
goto :illustrator_cc2019_x64
:illustratorinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :illustratorinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingillustrator_cc2019_x64 ))
:continueinstallingillustrator_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mCài đặt Adobe Illustrator CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\illustrator_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Illustrator CC 2019\Support Files\Contents\Windows\Illustrator.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Illustrator CC 2019\Support Files\Contents\Windows\illustrator.exe" "~$folder.desktop$" "Adobe Illustrator CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Illustrator CC 2019>"%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: GO CAI ILLUSTRATOR CC 2019::
:uninstalladobeillustrator_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeillustrator_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobeillustrator_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple" ( goto :noinstalled )
set /p illustratoruninstallx64_cc2019=<"%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple"
if not defined illustratoruninstallx64_cc2019 ( goto :noinstalled )
if not exist %illustratoruninstallx64_cc2019% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Illustrator CC 2019 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Illustrator CC 2019 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeillustrator_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeillustrator_cc2019_x64%==1 goto :continueuninstallingillustrator_cc2019_x64
if %uninstalladobeillustrator_cc2019_x64%==2 goto :menu
goto :uninstalladobeillustrator_cc2019_x64

:continueuninstallingillustrator_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe Illustrator CC 2019 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %illustratoruninstallx64_cc2019% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeillustrator_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Illustrator CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
::KET THUC GO CAI DAT ILLUSTRATOR CC 2019 ::

:: BAT DAU CAI DAT MEDIA ENCODER CC 2019 ::
:media_encoder_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" (
	goto :checkmedia_encoder_cc2019 ) else (
		goto :media_encoder_cc2019_1 )
:checkmedia_encoder_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkmedia_encoder_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkmedia_encoder_cc2019%==1 goto :media_encoder_cc2019_1
if %checkmedia_encoder_cc2019%==2 goto :menu
goto :media_encoder_cc2019
::
:media_encoder_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :media_encoder_cc2019_x64 ) else ( goto :errorinstalling )
:media_encoder_cc2019_x64
if not exist "%~dp0\media_encoder_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │     [1mCài đặt Adobe Media Encoder CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe Media Encoder CC 2019 64-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p media_encoderinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %media_encoderinstallation_cc2019_x64%==1 goto :media_encoderinstall_cc2019_x64
if %media_encoderinstallation_cc2019_x64%==2 goto :menu
goto :media_encoder_cc2019_x64
:media_encoderinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :media_encoderinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingmedia_encoder_cc2019_x64 ))
:continueinstallingmedia_encoder_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │     [1mCài đặt Adobe Media Encoder CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\media_encoder_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Media Encoder CC 2019\Adobe Media Encoder.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Media Encoder CC 2019\Adobe Media Encoder.exe" "~$folder.desktop$" "Adobe Media Encoder CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Media Encoder CC 2019>"%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT MEDIA ENCODER CC 2019 ::

:: GO CAI MEDIA ENCODER CC 2019 ::
:uninstalladobemedia_encoder_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobemedia_encoder_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobemedia_encoder_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" ( goto :noinstalled )
set /p media_encoderuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple"
if not defined media_encoderuninstall_cc2019x64 ( goto :noinstalled )
if not exist %media_encoderuninstall_cc2019x64% ( goto :noinstalled )
echo   │    [1mGỡ cài đặt Adobe Media Encoder CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│    [94mphần mềm Adobe Media Encoder CC 2019 64-bit.    [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobemedia_encoder_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobemedia_encoder_cc2019_x64%==1 goto :continueuninstallingmedia_encoder_cc2019_x64
if %uninstalladobemedia_encoder_cc2019_x64%==2 goto :menu
goto :uninstalladobemedia_encoder_cc2019_x64

:continueuninstallingmedia_encoder_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │    [1mGỡ cài đặt Adobe Media Encoder CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %media_encoderuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobemedia_encoder_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Media Encoder CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT MEDIA ENCODER CC 2019 ::

:: BAT DAU CAI DAT AUDITION CC 2019::
:audition_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple" (
	goto :checkaudition_cc2019 ) else (
		goto :audition_cc2019_1 )
:checkaudition_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkaudition_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkaudition_cc2019%==1 goto :audition_cc2019_1
if %checkaudition_cc2019%==2 goto :menu
goto :audition_cc2019
::
:audition_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :audition_cc2019_x64 ) else ( goto :errorinstalling )
:audition_cc2019_x64
if not exist "%~dp0\audition_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │        [1mCài đặt Adobe Audition CC 2019 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Audition CC 2019 64-bit.    [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p auditioninstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %auditioninstallation_cc2019_x64%==1 goto :auditioninstall_cc2019_x64
if %auditioninstallation_cc2019_x64%==2 goto :menu
goto :audition_cc2019_x64
:auditioninstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :auditioninstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingaudition_cc2019_x64 ))
:continueinstallingaudition_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Audition CC 2019 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\audition_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Audition CC 2019\Adobe Audition CC.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Audition CC 2019\Adobe Audition CC.exe" "~$folder.desktop$" "Adobe Audition CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Audition CC 2019>"%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT AUDITION CC 2019 ::

:: GO CAI AUDITION CC 2019 ::
:uninstalladobeaudition_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeaudition_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobeaudition_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple" ( goto :noinstalled )
set /p auditionuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple"
if not defined auditionuninstall_cc2019x64 ( goto :noinstalled )
if not exist %auditionuninstall_cc2019x64% ( goto :noinstalled )
echo   │       [1mGỡ cài đặt Adobe Audition CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Audition CC 2018 64-bit.      [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeaudition_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeaudition_cc2019_x64%==1 goto :continueuninstallingaudition_cc2019_x64
if %uninstalladobeaudition_cc2019_x64%==2 goto :menu
goto :uninstalladobeaudition_cc2019_x64

:continueuninstallingaudition_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Audition CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %auditionuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeaudition_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Audition CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC GO CAI DAT AUDITION CC 2019

:: BAT DAU CAI DAT LIGHTROOM CC 2019 ::
:lightroom_cc2019
cls
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobelightroom_cc2019.bangmaple" (
	goto :checklightroom_cc2019 ) else (
		goto :lightroom_cc2019_1 )
:checklightroom_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checklightroom_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checklightroom_cc2019%==1 goto :lightroom_cc2019_1
if %checklightroom_cc2019%==2 goto :menu
goto :checklightroom_cc2019
::
:lightroom_cc2019_1
if exist "%homedrive%\Program Files (x86)" ( goto :lightroom_cc2019_x64 ) else ( goto :errorinstalling )
:lightroom_cc2019_x64
if not exist "%~dp0\lightroom_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │    [1mCài đặt Adobe Lightroom Classic CC 2019 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│   [94mphần mềm Adobe Lightroom Classic CC 2019 64-bit. [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p lightroominstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %lightroominstallation_cc2019_x64%==1 goto :lightroominstall_cc2019_x64
if %lightroominstallation_cc2019_x64%==2 goto :menu
goto :lightroom_cc2019_x64
:lightroominstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :lightroominstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallinglightroom_cc2019_x64 ))
:continueinstallinglightroom_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │ [1mĐang cài đặt Adobe Lightroom Classic CC 2019 64-bit... [30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\lightroom_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Lightroom Classic CC\Lightroom.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Lightroom Classic CC\lightroom.exe" "~$folder.desktop$" "Adobe Lightroom Classic CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Lightroom Classic CC>"%appdata%\bangmaple\uninstalladobelightroom_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT LIGHTROOM CC 2019 ::

:: GO CAI DAT LIGHTROOM CC 2019 ::
:uninstalladobelightroom_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobelightroom_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobelightroom_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobelightroom_cc2019.bangmaple" ( goto :noinstalled )
set /p lightroomuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobelightroom_cc2019.bangmaple"
if not defined lightroomuninstall_cc2019x64 ( goto :noinstalled )
if not exist %lightroomuninstall_cc2019x64% ( goto :noinstalled )
echo   │  [1mGỡ cài đặt Adobe Lightroom Classic CC 2019 64-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│   [94mphần mềm Adobe Lightroom Classic CC 2019 64-bit.   [30m[32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobelightroom_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobelightroom_cc2019_x64%==1 goto :continueuninstallinglightroom_cc2019_x64
if %uninstalladobelightroom_cc2019_x64%==2 goto :menu
goto :uninstalladobelightroom_cc2019_x64

:continueuninstallinglightroom_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │  [1mGỡ cài đặt Adobe Lightroom Classic CC 2019 64-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %lightroomuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobelightroom_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Lightroom Classic CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: GO CAI DAT LIGHTROOM CC 2019 ::

:: BAT DAU CAI DAT PREMIERE PRO CC 2019 ::
:premiere_pro_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" (
	goto :checkpremiere_pro_cc2019 ) else (
		goto :premiere_pro_cc2019_1 )
:checkpremiere_pro_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkpremiere_pro_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkpremiere_pro_cc2019%==1 goto :premiere_pro_cc2019_1
if %checkpremiere_pro_cc2019%==2 goto :menu
goto :premiere_pro_cc2019
::
:premiere_pro_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :premiere_pro_cc2019_x64 ) else ( goto :errorinstalling )
:premiere_pro_cc2019_x64
if not exist "%~dp0\premiere_pro_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │      [1mCài đặt Adobe Premiere Pro CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe Premiere Pro CC 2019 64-bit.   [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p premiere_proinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %premiere_proinstallation_cc2019_x64%==1 goto :premiere_proinstall_cc2019_x64
if %premiere_proinstallation_cc2019_x64%==2 goto :menu
goto :premiere_pro_cc2019_x64
:premiere_proinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :premiere_proinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingpremiere_pro_cc2019_x64 ))
:continueinstallingpremiere_pro_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mCài đặt Adobe Premiere Pro CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\premiere_pro_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Premiere Pro CC 2019\Adobe Premiere Pro.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Premiere Pro CC 2019\Adobe Premiere Pro.exe" "~$folder.desktop$" "Adobe Premiere Pro CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Premiere Pro CC 2019>"%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PREMIERE PRO CC 2019 ::

:: GO CAI PREMIERE PRO CC 2019 ::
:uninstalladobepremiere_pro_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobepremiere_pro_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobepremiere_pro_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" ( goto :noinstalled )
set /p premiere_prouninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple"
if not defined premiere_prouninstall_cc2019x64 ( goto :noinstalled )
if not exist %premiere_prouninstall_cc2019x64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Premiere Pro CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│     [94mphần mềm Adobe Premiere Pro CC 2019 64-bit.    [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobepremiere_pro_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobepremiere_pro_cc2019_x64%==1 goto :continueuninstallingpremiere_pro_cc2019_x64
if %uninstalladobepremiere_pro_cc2019_x64%==2 goto :menu
goto :uninstalladobepremiere_pro_cc2019_x64

:continueuninstallingpremiere_pro_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe Premiere Pro CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %premiere_prouninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobepremiere_pro_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Premiere Pro CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PREMIERE PRO CC 2019 ::

:: BAT DAU CAI DAT AFTER EFFECT ::
:after_effects_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" (
	goto :checkafter_effects_cc2019 ) else (
		goto :after_effects_cc2019_1 )
:checkafter_effects_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkafter_effects_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkafter_effects_cc2019%==1 goto :after_effects_cc2019_1
if %checkafter_effects_cc2019%==2 goto :menu
goto :after_effects_cc2019
::
:after_effects_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :after_effects_cc2019_x64 ) else ( goto :errorinstalling )
:after_effects_cc2019_x64
if not exist "%~dp0\after_effects_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │      [1mCài đặt Adobe After Effects CC 2019 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│      [94mphần mềm Adobe After Effects CC 2019 64-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p after_effectsinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %after_effectsinstallation_cc2019_x64%==1 goto :after_effectsinstall_cc2019_x64
if %after_effectsinstallation_cc2019_x64%==2 goto :menu
goto :after_effects_cc2019_x64
:after_effectsinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :after_effectsinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingafter_effects_cc2019_x64 ))
:continueinstallingafter_effects_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │    [1mĐang cài đặt Adobe After Effects CC 2019 64-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\after_effects_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe After Effects CC 2019\Support Files\AfterFX.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe After Effects CC 2019\Support Files\AfterFX.exe" "~$folder.desktop$" "Adobe After Effects CC 2019" >nul
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe After Effects CC 2019\Support Files\AfterFX-re.exe" "~$folder.desktop$" "Adobe After Effects Render Engine CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe After Effects CC 2019>"%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT AFTER EFFECTS CC 2019 ::

:: GO CAI AFTER EFFECTS CC 2019 ::
:uninstalladobeafter_effects_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeafter_effects_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobeafter_effects_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" ( goto :noinstalled )
set /p after_effectsuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple"
if not defined after_effectsuninstall_cc2019x64 ( goto :noinstalled )
if not exist %after_effectsuninstall_cc2019x64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe After Effects CC 2019 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│     [94mphần mềm Adobe After Effects CC 2019 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeafter_effects_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeafter_effects_cc2019_x64%==1 goto :continueuninstallingafter_effects_cc2019_x64
if %uninstalladobeafter_effects_cc2019_x64%==2 goto :menu
goto :uninstalladobeafter_effects_cc2019_x64

:continueuninstallingafter_effects_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe After Effects CC 2019 64-bit... [30m  │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %after_effectsuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeafter_effects_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe After Effects CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe After Effects Render Engine CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT AFTER EFFECT CC 2019 ::

:: BAT DAU CAI DAT CHARACTER ANIMATOR CC 2019 ::
:char_ani_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple" (
	goto :checkchar_ani_cc2019 ) else (
		goto :char_ani_cc2019_1 )
:checkchar_ani_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkchar_ani_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkchar_ani_cc2019%==1 goto :char_ani_cc2019_1
if %checkchar_ani_cc2019%==2 goto :menu
goto :checkchar_ani_cc2019
::
:char_ani_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :char_ani_cc2019_x64 ) else ( goto :errorinstalling )
:char_ani_cc2019_x64
if not exist %~dp0\char_ani_cc2019_x64.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │  [1mCài đặt Adobe Character Animator CC 2019 64-bit... [30m  │
echo   ╰───────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│  [94mphần mềm Adobe Character Animator CC 2019 64-bit. [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p char_aniinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %char_aniinstallation_cc2019_x64%==1 goto :char_aniinstall_cc2019_x64
if %char_aniinstallation_cc2019_x64%==2 goto :menu
goto :char_ani_cc2019_x64
:char_aniinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :char_aniinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingchar_ani_cc2019_x64 ))
:continueinstallingchar_ani_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │ [1mĐang cài đặt Adobe Character Animator CC 2019 64-bit...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\char_ani_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Character Animator CC 2019\Support Files\Character Animator.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Character Animator CC 2019\Support Files\Character Animator.exe" "~$folder.desktop$" "Adobe Character Animator CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Character Animator CC 2019>"%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:uninstalladobechar_ani_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobechar_ani_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobechar_ani_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple" ( goto :noinstalled )
set /p char_aniuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple"
if not defined char_aniuninstall_cc2019x64 ( goto :noinstalled )
if not exist %char_aniuninstall_cc2019x64% ( goto :noinstalled )
echo   │     [1mGỡ cài đặt Adobe Character Animator CC 2019... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│     [94mphần mềm Adobe Character Animator CC 2019.     [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobechar_ani_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobechar_ani_cc2019_x64%==1 goto :continueuninstallingchar_ani_cc2019_x64
if %uninstalladobechar_ani_cc2019_x64%==2 goto :menu
goto :uninstalladobechar_ani_cc2019_x64

:continueuninstallingchar_ani_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │     [1mGỡ cài đặt Adobe Character Animator CC 2019... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %char_aniuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobechar_ani_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Character Animator CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT CHARACTOR ANIMATOR CC 2019 ::

:: BAT DAU CAI DAT ANIMATE CC 2019 ::
:animate_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeanimate_cc2019.bangmaple" (
	goto :checkanimate_cc2019 ) else (
		goto :animate_cc2019_1 )
:checkanimate_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkanimate_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkanimate_cc2019%==1 goto :animate_cc2019_1
if %checkanimate_cc2019%==2 goto :menu
goto :animate_cc2019
::
:animate_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :animate_cc2019_x64 ) else ( goto :errorinstalling )
:animate_cc2019_x64
if not exist "%~dp0\animate_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo          │      [1mCài đặt Adobe Animate CC 2019... [30m    │
echo          ╰───────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│           [94mphần mềm Adobe Animate CC 2019.          [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p animateinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %animateinstallation_cc2019_x64%==1 goto :animateinstall_cc2019_x64
if %animateinstallation_cc2019_x64%==2 goto :menu
goto :animate_cc2019_x64
:animateinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :animateinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallinganimate_cc2019_x64 ))
:continueinstallinganimate_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo          │    [1mĐang cài đặt Adobe Animate CC 2019... [30m │
echo          ╰───────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\animate_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Animate CC 2019\Animate.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Animate CC 2019\Animate.exe" "~$folder.desktop$" "Adobe Animate CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Animate CC 2019>"%appdata%\bangmaple\uninstalladobeanimate_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: BAT DAU GO CAI DAT ANIMATE CC 2019 ::
:uninstalladobeanimate_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeanimate_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu
:uninstalladobeanimate_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeanimate_cc2019.bangmaple" ( goto :noinstalled )
set /p animateuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobeanimate_cc2019.bangmaple"
if not defined animateuninstall_cc2019x64 ( goto :noinstalled )
if not exist %animateuninstall_cc2019x64% ( goto :noinstalled )
echo          │     [1mGỡ cài đặt Adobe Animate CC 2019... [30m  │
echo          ╰───────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│          [94mphần mềm Adobe Animate CC 2019.           [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeanimate_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeanimate_cc2019_x64%==1 goto :continueuninstallinganimate_cc2019_x64
if %uninstalladobeanimate_cc2019_x64%==2 goto :menu
goto :uninstalladobeanimate_cc2019_x64

:continueuninstallinganimate_cc2019_x64
mode con: cols=62 lines=17
cls
echo         │     [1mGỡ cài đặt Adobe Animate CC 2019... [30m  │
echo         ╰───────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %animateuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeanimate_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Animate CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT ANIMATE CC 2019 ::

:: BAT DAU CAI DAT BRIDGE CC 2019 ::
:bridge_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple" (
	goto :checkbridge_cc2019 ) else (
		goto :bridge_cc2019_1 )
:checkbridge_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkbridge_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkbridge_cc2019%==1 goto :bridge_cc2019_1
if %checkbridge_cc2019%==2 goto :menu
goto :bridge_cc2019
::
:bridge_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :bridge_cc2019_x64 ) else ( goto :errorinstalling )
:bridge_cc2019_x64
if not exist %~dp0\bridge_cc2019_x64.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │         [1mCài đặt Adobe Bridge CC 2019 64-bit... [30m        │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│          [94mphần mềm Adobe Bridge CC 2018 64-bit.     [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p bridgeinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %bridgeinstallation_cc2019_x64%==1 goto :bridgeinstall_cc2019_x64
if %bridgeinstallation_cc2019_x64%==2 goto :menu
goto :bridge_cc2019_x64
:bridgeinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :bridgeinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingbridge_cc2019_x64 ))
:continueinstallingbridge_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │        [1mĐang cài đặt Adobe Bridge CC 2019 64-bit... [30m    │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\bridge_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Bridge CC 2019\Bridge.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Bridge CC 2019\bridge.exe" "~$folder.desktop$" "Adobe Bridge CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Bridge CC 2019>"%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks

:: GO CAI BRIDGE ::
:uninstalladobebridge_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobebridge_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobebridge_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple" ( goto :noinstalled )
set /p bridgeuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple"
if not defined bridgeuninstall_cc2019x64 ( goto :noinstalled )
if not exist %bridgeuninstall_cc2019x64% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Bridge CC 2019 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Bridge CC 2019 64-bit.      [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobebridge_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobebridge_cc2019_x64%==1 goto :continueuninstallingbridge_cc2019_x64
if %uninstalladobebridge_cc2019_x64%==2 goto :menu
goto :uninstalladobebridge_cc2019_x64

:continueuninstallingbridge_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │        [1mGỡ cài đặt Adobe Bridge CC 2019 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %bridgeuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobebridge_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Bridge CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: HOAN TAT GO CAI DAT BRIDGE CC 2019::

:: BAT DAU CAI DAT INCOPY CC 2019 ::
:incopy_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeincopy_cc2019.bangmaple" (
	goto :checkincopy_cc2019 ) else (
		goto :incopy_cc2019_1 )
:checkincopy_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkincopy_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkincopy_cc2019%==1 goto :incopy_cc2019_1
if %checkincopy_cc2019%==2 goto :menu
goto :incopy_cc2019
::
:incopy_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :incopy_cc2019_x64 ) else ( goto :errorinstalling )
:incopy_cc2019_x64
if not exist %~dp0\incopy_cc2019_x64.bm_ ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │          [1mCài đặt Adobe Incopy CC 2019 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│          [94mphần mềm Adobe Incopy 2019 64-bit.        [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p incopyinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %incopyinstallation_cc2019_x64%==1 goto :incopyinstall_cc2019_x64
if %incopyinstallation_cc2019_x64%==2 goto :menu
goto :incopy_cc2019_x64
:incopyinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :incopyinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingincopy_cc2019_x64 ))
:continueinstallingincopy_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mĐang cài đặt Adobe Incopy CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\incopy_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Incopy CC 2019\amtlib.dll" ( goto :errorinstalling )
if not exist "%homedrive%\Program Files (x86)\Common Files\Adobe" ( mkdir "%homedrive%\Program Files (x86)\Common Files\Adobe" )
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" "%defaultWS%\Adobe Incopy CC 2019\Color" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" "%defaultWS%\Adobe Incopy CC 2019\Color Profiles" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Incopy CC 2019\incopy.exe" "~$folder.desktop$" "Adobe Incopy CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Incopy CC 2019>"%appdata%\bangmaple\uninstalladobeincopy_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT INCOPY CC 2019 ::

:: BAT DAU GO CAI DAT INCOPY CC 2019 ::
:uninstalladobeincopy_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeincopy_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobeincopy_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeincopy_cc2019.bangmaple" ( goto :noinstalled )
set /p incopyuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobeincopy_cc2019.bangmaple"
if not defined incopyuninstall_cc2019x64 ( goto :noinstalled )
if not exist %incopyuninstall_cc2019x64% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Incopy CC 2019 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Incopy CC 2019 64-bit.       [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeincopy_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeincopy_cc2019_x64%==1 goto :continueuninstallingincopy_cc2019_x64
if %uninstalladobeincopy_cc2019_x64%==2 goto :menu
goto :uninstalladobeincopy_cc2019_x64

:continueuninstallingincopy_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Incopy CC 2019 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %incopyuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\bangmaple\uninstalladobeincopy_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Incopy CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC GO CAI DAT INCOPY CC 2019 ::

:: BAT DAU CAI DAT INDESIGN CC 2019::
:indesign_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeindesign_cc2019.bangmaple" (
	goto :checkindesign_cc2019 ) else (
		goto :indesign_cc2019_1 )
:checkindesign_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc      [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkindesign_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkindesign_cc2019%==1 goto :indesign_cc2019_1
if %checkindesign_cc2019%==2 goto :menu
goto :indesign_cc2019
::
:indesign_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :indesign_cc2019_x64 ) else ( goto :errorinstalling )
:indesign_cc2019_x64
if not exist "%~dp0\indesign_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │        [1mCài đặt Adobe Indesign CC 2019 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Indesign 2018 64-bit.       [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p indesigninstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %indesigninstallation_cc2019_x64%==1 goto :indesigninstall_cc2019_x64
if %indesigninstallation_cc2019_x64%==2 goto :menu
goto :indesign_cc2019_x64
:indesigninstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :indesigninstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingindesign_cc2019_x64 ))
:continueinstallingindesign_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │       [1mĐang cài đặt Adobe Indesign CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\indesign_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Indesign CC 2019\Indesign.exe" ( goto :errorinstalling )
if not exist "%homedrive%\Program Files (x86)\Common Files\Adobe" ( mkdir "%homedrive%\Program Files (x86)\Common Files\Adobe" )
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" "%defaultWS%\Adobe Indesign CC 2019\Color" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
mklink /J "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" "%defaultWS%\Adobe Indesign CC 2019\Color Profiles" 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Indesign CC 2019\indesign.exe" "~$folder.desktop$" "Adobe Indesign CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Indesign CC 2019>"%appdata%\bangmaple\uninstalladobeindesign_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT INDESIGN CC 2019::

:: GO CAI INDESIGN CC 2019 ::
:uninstalladobeindesign_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeindesign_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobeindesign_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeindesign_cc2019.bangmaple" ( goto :noinstalled )
set /p indesignuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobeindesign_cc2019.bangmaple"
if not defined indesignuninstall_cc2019x64 ( goto :noinstalled )
if not exist %indesignuninstall_cc2019x64% ( goto :noinstalled )
echo   │       [1mGỡ cài đặt Adobe Indesign CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Indesign CC 2019 64-bit.      [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeindesign_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeindesign_cc2019_x64%==1 goto :continueuninstallingindesign_cc2019_x64
if %uninstalladobeindesign_cc2019_x64%==2 goto :menu
goto :uninstalladobeindesign_cc2019_x64

:continueuninstallingindesign_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Indesign CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %indesignuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color Profiles" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
rd "%homedrive%\Program Files (x86)\Common Files\Adobe\Color" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%appdata%\bangmaple\uninstalladobeindesign_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Indesign CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT INDESIGN CC 2019 ::

:: BAT DAU CAI DAT PRELUDE CC 2019 ::
:prelude_cc2019
cls
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple" (
	goto :checkprelude_cc2019 ) else (
		goto :prelude_cc2019_1 )
:checkprelude_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkprelude_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkprelude_cc2019%==1 goto :prelude_cc2019_1
if %checkprelude_cc2019%==2 goto :menu
goto :checkprelude_cc2019
::
:prelude_cc2019_1
if exist "%homedrive%\Program Files (x86)" ( goto :prelude_cc2019_x64 ) else ( goto :errorinstalling )
:prelude_cc2019_x64
if not exist "%~dp0\prelude_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │         [1mCài đặt Adobe Prelude CC 2019 64-bit... [30m       │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│         [94mphần mềm Adobe Prelude CC 2019 64-bit.     [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p preludeinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %preludeinstallation_cc2019_x64%==1 goto :preludeinstall_cc2019_x64
if %preludeinstallation_cc2019_x64%==2 goto :menu
goto :prelude_cc2019_x64
:preludeinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :preludeinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingprelude_cc2019_x64 ))
:continueinstallingprelude_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Prelude CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\prelude_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Prelude CC 2019\Adobe Prelude.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Prelude CC 2019\Adobe Prelude.exe" "~$folder.desktop$" "Adobe Prelude CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Prelude CC 2019>"%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PRELUDE CC 2019 ::

:: GO CAI PRELUDE CC 2019 ::
:uninstalladobeprelude_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobeprelude_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobeprelude_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple" ( goto :noinstalled )
set /p preludeuninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple"
if not defined preludeuninstall_cc2019x64 ( goto :noinstalled )
if not exist %preludeuninstall_cc2019x64% ( goto :noinstalled )
echo   │        [1mGỡ cài đặt Adobe Prelude CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Prelude CC 2019 64-bit.       [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobeprelude_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobeprelude_cc2019_x64%==1 goto :continueuninstallingprelude_cc2019_x64
if %uninstalladobeprelude_cc2019_x64%==2 goto :menu
goto :uninstalladobeprelude_cc2019_x64

:continueuninstallingprelude_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │       [1mGỡ cài đặt Adobe Prelude CC 2019 64-bit... [30m      │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %preludeuninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobeprelude_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Prelude CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT PRELUDE CC 2019 ::

:: BAT DAU CAI DAT DREAMWEAVER CC 2019 ::
:dreamweaver_cc2019
::KIEM TRA CAI DAT THANH PHAN HAY CHUA::
if exist "%appdata%\bangmaple\uninstalladobedreamweaver_cc2019.bangmaple" (
	goto :checkdreamweaver_cc2019 ) else (
		goto :dreamweaver_cc2019_1 )
:checkdreamweaver_cc2019
cls
mode con: cols=62 lines=14
cls
echo   │ [1mTrình cài đặt đã nhận thấy bạn đã cài thành phần này...[30m│
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│  [94mTrình cài đặt nhận thấy bạn đã cài đặt thành phần [30m  [32m│[30m[30m
echo    [32m│        [94mnày. Bạn có thể quay lại menu chính hoặc    [30m  [32m│[30m[30m
echo    [32m│        [94mtiếp tục sửa/cài đặt lại thành phần này.      [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p checkdreamweaver_cc2019=    [94m╾[30m [1mVui lòng chọn:[30m 
if %checkdreamweaver_cc2019%==1 goto :dreamweaver_cc2019_1
if %checkdreamweaver_cc2019%==2 goto :menu
goto :dreamweaver_cc2019
::
:dreamweaver_cc2019_1
cls
if exist "%homedrive%\Program Files (x86)" ( goto :dreamweaver_cc2019_x64 ) else ( goto :errorinstalling )
:dreamweaver_cc2019_x64
if not exist "%~dp0\dreamweaver_cc2019_x64.bm_" ( goto :errorinstalling ) 
cls
mode con: cols=62 lines=14
cls
echo   │       [1mCài đặt Adobe Dreamweaver CC 2019 64-bit... [30m     │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│      [94mTrình cài đặt đang chuẩn bị bắt đầu cài đặt [30m    [32m│[30m[30m
echo    [32m│        [94mphần mềm Adobe Dreamweaver CC 2019 64-bit.  [30m  [32m│[30m[30m
echo    [32m│ [94mBạn có chắc là muốn bắt đầu quá trình cài đặt không ?[30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p dreamweaverinstallation_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %dreamweaverinstallation_cc2019_x64%==1 goto :dreamweaverinstall_cc2019_x64
if %dreamweaverinstallation_cc2019_x64%==2 goto :menu
goto :dreamweaver_cc2019_x64
:dreamweaverinstall_cc2019_x64
mode con: cols=62 lines=12
cls
IF EXIST "%appdata%\bangmaple\defaultdirectory.bangmaple" ( 
set /p defaultWS=<"%appdata%\bangmaple\defaultdirectory.bangmaple" )

IF NOT DEFINED defaultWS (
SET SRET=0
IF "%SRET%" GEQ "5" ( goto :errorinstalling )
echo            │     [1mThiết lập đường dẫn mặc định ...[30m   │
echo            ╰────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mTrình cài đặt nhận ra bạn chưa thiết lập[30m  [94m│[30m
echo          [94m│   [94mđường dẫn mặc định. Vui lòng thiết lập[30m   [94m│[30m
echo          [94m│   [94mđường dẫn cài đặt tạm thời để cài đặt.[30m   [94m│[30m
echo          [94m│   [94mBạn có thể thiết lập đường dẫn mặc định[30m  [94m│[30m
echo          [94m│        [94mtrong phần "Công cụ hỗ trợ".[30m        [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
for /f "tokens=*" %%i in ('cscript //nologo "%temp%\browse.vbs"') do set defaultWS=%%i
IF NOT DEFINED defaultWS SET /A SRET=%SRET%+1&goto :dreamweaverinstall_cc2019_x64
IF DEFINED defaultWS ( goto :continueinstallingdreamweaver_cc2019_x64 ))
:continueinstallingdreamweaver_cc2019_x64
mode con: cols=62 lines=15
cls
echo        │     [1mThiết lập đường dẫn cài đặt thành công [30m    │
echo        ╰────────────────────────────────────────────────╯
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│      [94mViệc thiết lập đã được hoàn tất.[30m      [94m│[30m
echo          [94m│   [94mĐường dẫn cài đặt của bạn sẽ được dùng[30m   [94m│[30m
echo          [94m│        [94m để cài đặt phần mềm này.[30m           [94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo [94m╾ Đường dẫn: [30m"%defaultWS%"
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình thiết lập thành công![30m
echo         [1mNhấn phím bất kỳ để tiếp tục cài đặt phần mềm.[30m
pause >nul
mode con: cols=62 lines=30
cls
echo   │      [1mĐang cài đặt Adobe Dreamweaver CC 2019 64-bit... [30m │
echo   ╰────────────────────────────────────────────────────────╯
echo              [35m╭───────────────────────────────────╮[30m
echo              [35m│      [35mĐang cài đặt phần mềm...[30m     [35m│[30m
echo              [35m╰───────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
echo   [30m┌───────────────────────────────────────────────────────┐[30m
echo   [30m│  [94mViệc cài đặt có thể tốn một vài phút tuỳ thuộc vào   [30m│[30m
echo   [30m│ [94mtốc độ ổ cứng của bạn. Vui lòng không đóng cửa sổ này [30m│[30m
echo   [30m│       [94mcho đến khi trình cài đặt được hoàn tất.        [30m│[30m
echo   [30m└───────────────────────────────────────────────────────┘[30m
"%appdata%\7z.exe" x "%~dp0\dreamweaver_cc2019_x64.bm_" -pBangMaple123 -o"%defaultWS%" -y >nul
echo.
echo       [35m╭────────────────────────────────────────────────╮[30m
echo       [35m│   [35mĐang kiểm tra tính xác thực của phần mềm...[30m  [35m│[30m
echo       [35m╰────────────────────────────────────────────────╯[30m
if not exist "%defaultWS%\Adobe Dreamweaver CC 2019\dreamweaver.exe" ( goto :errorinstalling )
ping 127.0.0.1 -n 2 >nul
echo       [92m╭────────────────────────────────────────────────╮[30m
echo       [92m│    [92mĐang tạo lối tắt phần mềm trong Desktop...[30m  [92m│[30m
echo       [92m╰────────────────────────────────────────────────╯[30m
"%appdata%\nircmdc.exe" shortcut "%defaultWS%\Adobe Dreamweaver CC 2019\dreamweaver.exe" "~$folder.desktop$" "Adobe Dreamweaver CC 2019" >nul
ping 127.0.0.1 -n 2 >nul
echo       [96m╭────────────────────────────────────────────────╮[30m
echo       [96m│    [96mĐang tạo đường dẫn gỡ cài đặt phần mềm...[30m   [96m│[30m
echo       [96m╰────────────────────────────────────────────────╯[30m
echo %defaultWS%\Adobe Dreamweaver CC 2019>"%appdata%\bangmaple\uninstalladobedreamweaver_cc2019.bangmaple"
ping 127.0.0.1 -n 2 >nul
echo               [94m╭─────────────────────────────────╮[30m
echo               [94m│  [94mĐã hoàn tất quá trình cài đặt.[30m [94m│[30m
echo               [94m╰─────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo               [1mQuá trình cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT DREAMWEAVER CC 2019 ::

:: GO CAI DREAMWEAVERCC 2019 ::
:uninstalladobedreamweaver_cc2019
cls
if exist "%homedrive%\Program Files (x86)" ( goto :uninstalladobedreamweaver_cc2019_x64 ) else ( goto :errorinstalling )
goto :menu

:uninstalladobedreamweaver_cc2019_x64
mode con: cols=62 lines=14
cls
if not exist "%appdata%\bangmaple\uninstalladobedreamweaver_cc2019.bangmaple" ( goto :noinstalled )
set /p dreamweaveruninstall_cc2019x64=<"%appdata%\bangmaple\uninstalladobedreamweaver_cc2019.bangmaple"
if not defined dreamweaveruninstall_cc2019x64 ( goto :noinstalled )
if not exist %dreamweaveruninstall_cc2019x64% ( goto :noinstalled )
echo   │      [1mGỡ cài đặt Adobe Dreamweaver CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo    [32m╭──────────────────────────────────────────────────────╮[30m
echo    [32m│    [94mTrình cài đặt đang chuẩn bị bắt đầu gỡ cài đặt [30m   [32m│[30m[30m
echo    [32m│       [94mphần mềm Adobe Dreamweaver CC 2019 64-bit.   [30m  [32m│[30m[30m
echo    [32m│    [94mBạn có chắc là muốn bắt đầu gỡ cài đặt không ?    [30m[32m│[30m[30m
echo    [32m╰──────┬────────────────────────────────────────┬──────╯[30m
echo           [32m│ [36m[1][30m Có, hãy tiếp tục.                  [32m│[30m[30m
echo           [32m│ [36m[2][30m Không, hãy quay lại menu chính.    [32m│[30m[30m
echo           [32m└────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p uninstalladobedreamweaver_cc2019_x64=    [94m╾[30m [1mVui lòng chọn:[30m 
if %uninstalladobedreamweaver_cc2019_x64%==1 goto :continueuninstallingdreamweaver_cc2019_x64
if %uninstalladobedreamweaver_cc2019_x64%==2 goto :menu
goto :uninstalladobedreamweaver_cc2019_x64

:continueuninstallingdreamweaver_cc2019_x64
mode con: cols=62 lines=17
cls
echo   │      [1mGỡ cài đặt Adobe Dreamweaver CC 2019 64-bit... [30m   │
echo   ╰────────────────────────────────────────────────────────╯
echo           [35m╭──────────────────────────────────────╮[30m
echo           [35m│      [35mĐang gỡ cài đặt phần mềm...[30m     [35m│[30m
echo           [35m╰──────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
rd %dreamweaveruninstall_cc2019x64% /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [92m╭─────────────────────────────────────────╮[30m
echo         [92m│     [92mĐang gỡ phần thừa của phần mềm...  [30m [92m│[30m
echo         [92m╰─────────────────────────────────────────╯[30m
ping 127.0.0.1 -n 2 >nul
del "%appdata%\bangmaple\uninstalladobedreamweaver_cc2019.bangmaple" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
del "%userprofile%\desktop\Adobe Dreamweaver CC 2019.lnk" /s /q 2>nul | find "folder" > "%appdata%\bangmaple\temp.bangmaple"
echo         [96m╭─────────────────────────────────────────╮[30m
echo         [96m│     [96mĐã hoàn tất gỡ cài đặt phần mềm... [30m [96m│[30m
echo         [96m╰─────────────────────────────────────────╯[30m
echo.
echo ══════════════════════════════════════════════════════════════
echo.
echo              [1mQuá trình gỡ cài đặt thành công[30m
echo         [1mNhấn phím bất kỳ để thoát khỏi trình cài đặt.[30m
pause >nul
goto :thanks
:: KET THUC CAI DAT DREAMWEAVER CC 2019 ::


:: BAT DAU CHANGELOG
:changelog
cls
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://drive.google.com/uc?authuser=0&id=1UCJmpKLJJhhveqO-2ys1eLvmimRnRx9h&export=download" -O changelog.txt
del %~dp0\changelog.txt
cls
changelog.txt
goto :menu
:: KET THUC CHANGELOG

:thanks
mode con: cols=62 lines=15
cls
echo.
echo.
echo.
echo ──────────────────────────────────────────────────────────────
echo          [94m╭────────────────────────────────────────────╮[30m
echo          [94m│  [94mCảm ơn bạn đã sử dụng app này. Mình rất   [30m[94m│[30m
echo          [94m│   [94mtích cực trong việc cập nhật installer [30m  [94m│[30m
echo          [94m│ [94mnày thường xuyên với nhiều tính năng mới. [30m [94m│[30m
echo          [94m│                                            [94m│[30m
echo          [94m│       [94m http://fb.com/BangMapleProject      [30m[94m│[30m
echo          [94m╰────────────────────────────────────────────╯[30m
echo ──────────────────────────────────────────────────────────────
ping 127.0.0.1 -n 6 >nul
exit /b

:help
cls
"%appdata%\wget.exe" -nv --show-progress --progress=bar:force:noscroll --tries=2 --timeout=5 -q "https://drive.google.com/uc?authuser=0&id=199h3wsPXAssMhDmFzdU83IF3OEehj7Ox&export=download" -O help.txt
cls
help.txt
goto :menu

:language_chooser
goto :notavailable
mode con: cols=53 lines=16
cls
echo     │    [1mThay đổi ngôn ngữ / Language Chooser[30m    │
echo     ╰────────────────────────────────────────────╯
echo  ┌─────────────────────────────────────────────────┐
echo  │                                                 │
echo  │        [36m┌────────────────────────────────┐       [30m│[30m
echo  │        [36m│[36m[1][30m Vietnamese.                 [36m│[30m       │[30m
echo  │        [36m└────────────────────────────────┘       [30m│[30m
echo  │        [36m┌────────────────────────────────┐       [30m│[30m
echo  │        [36m│[36m[2][30m English.                    [36m│[30m       │[30m
echo  │        [36m└────────────────────────────────┘       [30m│[30m
echo  │                                                 │[30m
echo  └─────────────────────────────────────────────────┘[30m
echo.
echo [32m═════════════════════[30m
set /p languagechooser=    [94m╾[30m [1mVui lòng chọn:[30m 
if %languagechooser%==1 goto :menu
if %languagechooser%==2 goto :menu_en
goto :language_chooser
