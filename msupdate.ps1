﻿$ErrorActionPreference = 'Stop'
# set system info
switch ($MakeVersion) {
    "w1164" {
        # make 11 23h2 64
        try {
            $osurl = ((Invoke-WebRequest -Uri "https://api.gravesoft.dev/msdl/proxy?product_id=2936&sku_id=17435").Links | Where-Object {$_.outerHTML -like "*Isox64 Download*"})[0].href
            $osfile = "Win11_23H2_China_GGK_Chinese_Simplified_x64v2.iso"
        }
        catch {
            $ospath = "/系统/MSDN/NT10.0_Win11/22631_23H2/2861_202312/Win11_23H2_China_GGK_Chinese_Simplified_x64v2.iso"
        }
        if ($true -eq $UpdateFromUUP) {
            $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w11-23h2").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*amd64*"})[0].href.replace("selectlang.php?id=","")
            $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
            Start-Sleep -Seconds 3
            $Miracast = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-WirelessDisplay-FOD-Package-amd64.cab").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
            $MiracastLP = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-WirelessDisplay-FOD-Package-amd64-zh-cn.cab").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
            $entgpack = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-EditionSpecific-EnterpriseG-Package.ESD").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
        } else {
            $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_22621_x64.meta4"
            $Miracast = "https://file.uhsea.com/2404/9dee091435ee149c1f6207f70fb46a6a7U.cab"
            $MiracastLP = "https://file.uhsea.com/2404/9f8486cf6b5fe60d7f0fff1777715b8cW0.cab"
            $iexplorer = "https://file.uhsea.com/2404/0d0a81d87b97263a9745229c715b849bKF.cab"
            $entgpack = "https://file.uhsea.com/2404/88f1f9ffe957989bf3387864b8b950b43N.esd"
        }
        $msstore = $true
    }
    "w1064" {
        # make 10 22h2 64
        try {
            $osurl = ((Invoke-WebRequest -Uri "https://api.gravesoft.dev/msdl/proxy?product_id=2378&sku_id=15004").Links | Where-Object {$_.outerHTML -like "*Isox64 Download*"})[0].href
            $osfile = "Win10_22H2_China_GGK_Chinese_Simplified_x64.iso"
        }
        catch {
            $ospath = "/系统/MSDN/NT10.0_Win10/19045_22H2/2006_RTM/Win10_22H2_China_GGK_Chinese_Simplified_x64.iso"
        }
        if ($true -eq $UpdateFromUUP) {
            $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w10-22h2").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*amd64*"})[0].href.replace("selectlang.php?id=","")
            $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
            Start-Sleep -Seconds 3
            $Miracast = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-WirelessDisplay-FOD-Package-amd64.cab").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
            $MiracastLP = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-WirelessDisplay-FOD-Package-amd64-zh-cn.cab").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
            $entgpack = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-EditionSpecific-EnterpriseG-Package.ESD").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
        } else {
            $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_19041_x64.meta4"
            $Miracast = "https://file.uhsea.com/2404/fa949c449de5880ea5e0648e16aa802a43.cab"
            $MiracastLP = "https://file.uhsea.com/2404/907cdd078f41d9b8ca0615b5c1557790S1.cab"
            $entgpack = "https://file.uhsea.com/2404/6bd7514f05984c2726a3b29cf1d416ebS8.esd"
        }
        $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8.1/script_netfx4.8.1_19041_x64.meta4"
        $msstore = $true
    }
    "w1032" {
        # make 10 22h2 32
        try {
            $osurl = ((Invoke-WebRequest -Uri "https://api.gravesoft.dev/msdl/proxy?product_id=2378&sku_id=15004").Links | Where-Object {$_.outerHTML -like "*Isox86 Download*"})[0].href
            $osfile = "Win10_22H2_China_GGK_Chinese_Simplified_x32.iso"
        }
        catch {
            $ospath = "/系统/MSDN/NT10.0_Win10/19045_22H2/2006_RTM/Win10_22H2_China_GGK_Chinese_Simplified_x32.iso"
        }
        if ($true -eq $UpdateFromUUP) {
            $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w10-22h2").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*x86*"})[0].href.replace("selectlang.php?id=","")
            $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
            Start-Sleep -Seconds 3
            $Miracast = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-WirelessDisplay-FOD-Package-x86.cab").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
            $MiracastLP = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-WirelessDisplay-FOD-Package-x86-zh-cn.cab").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
            $entgpack = ((Invoke-WebRequest -Uri "https://uupdump.net/getfile.php?id=$uupid&file=Microsoft-Windows-EditionSpecific-EnterpriseG-Package.ESD").Links | Where-Object {$_.outerHTML -like “*microsoft.com*"})[0].href
            Start-Sleep -Seconds 3
        } else {
            $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_19041_x86.meta4"
            $Miracast = "https://file.uhsea.com/2405/2ff40a3b9782eca5254a7dda8cb700289C.cab"
            $MiracastLP = "https://file.uhsea.com/2405/8e3ea4a6e3fbf275640a3fa43c63502aNY.cab"
            $entgpack = "https://file.uhsea.com/2405/4bb4e1af531d4cd8bea6d1ffdc933c048J.esd"
        }
        $NETScript = "https://mirror.ghproxy.com/https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8.1/script_netfx4.8.1_19041_x86.meta4"
        $msstore = $false
    }
    "w10lt2164" {
    # make 10 ltsc2021 64
        $ospath = "/系统/MSDN/NT10.0_Win10/19044_LTSC2021/zh-cn_windows_10_enterprise_ltsc_2021_x64_dvd_033b7312.iso"
        if ($true -eq $UpdateFromUUP) {
            $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w10-22h2").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*amd64*"})[0].href.replace("selectlang.php?id=","")
            $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
            Start-Sleep -Seconds 3
        } else {
            $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_19041_x64.meta4"
        }
        $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8.1/script_netfx4.8.1_19041_x64.meta4"
        $MultiEdition = $false
    }
    "w10lt2132" {
        # make 10 ltsc2021 64
            $ospath = "/系统/MSDN/NT10.0_Win10/19044_LTSC2021/zh-cn_windows_10_enterprise_ltsc_2021_x86_dvd_30600d9c.iso"
            if ($true -eq $UpdateFromUUP) {
                $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w10-22h2").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*x86*"})[0].href.replace("selectlang.php?id=","")
                $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
                Start-Sleep -Seconds 3
            } else {
                $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_19041_x86.meta4"
            }
            $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8.1/script_netfx4.8.1_19041_x86.meta4"
            $MultiEdition = $false
    }
    "w10lt1964" {
        # make 10 ltsc2019 64
        $ospath = "/系统/MSDN/NT10.0_Win10/17763_LTSC2019/1_RTM/cn_windows_10_enterprise_ltsc_2019_x64_dvd_2efc9ac2.iso"
        if ($true -eq $UpdateFromUUP) {
            $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w10-1809").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*amd64*"})[0].href.replace("selectlang.php?id=","")
            $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
            Start-Sleep -Seconds 3
        } else {
            $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_17763_x64.meta4"
        }
        $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8/script_netfx4.8_17763_x64.meta4"
        $MultiEdition = $false
    }
    "w10lt1932" {
        # make 10 ltsc2019 32
        $ospath = "/系统/MSDN/NT10.0_Win10/17763_LTSC2019/1_RTM/cn_windows_10_enterprise_ltsc_2019_x86_dvd_2908ee10.iso"
        if ($true -eq $UpdateFromUUP) {
            $uupid = ((Invoke-WebRequest -Uri "https://uupdump.net/known.php?q=category:w10-1809").Links | Where-Object {$_.href -like "selectlang.php?id=*"} | Where-Object {$_.outerHTML -like "*x86*"})[0].href.replace("selectlang.php?id=","")
            $UUPScript = "https://uupdump.net/get.php?id=$uupid&pack=0&edition=updateOnly&aria2=2"
            Start-Sleep -Seconds 3
        } else {
            $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_17763_x86.meta4"
        }
        $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8/script_netfx4.8_17763_x86.meta4"
        $MultiEdition = $false
    }
    "w10lt1664" {
        # make 10 ltsb2016 64 (unsupport uup)
        $ospath = "/系统/MSDN/NT10.0_Win10/14393_LTSB2016/cn_windows_10_enterprise_2016_ltsb_x64_dvd_9060409.iso"
        $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_14393_x64.meta4"
        $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8/script_netfx4.8_14393_x64.meta4"
        $MultiEdition = $false
    }
    "w10lt1632" {
        # make 10 ltsb2016 32 (unsupport uup)
        # $ospath = "/系统/MSDN/NT10.0_Win10/14393_LTSB2016/cn_windows_10_enterprise_2016_ltsb_x86_dvd_9057089.iso"
        $ospath = "/系统/Windows/Win10/LTSB2016/cn_windows_10_enterprise_2016_ltsb_x86_dvd_9057089_FixSSShim.iso"
        $WUScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/script_14393_x86.meta4"
        $NETScript = "https://raw.githubusercontent.com/adavak/Win_ISO_Patching_Scripts/master/Scripts/netfx4.8/script_netfx4.8_14393_x86.meta4"
        $MultiEdition = $false
    }
    default {
        Write-Error "Not defined or Unsupported OS version!
        Example:
            `$MakeVersion   = [string] `"w1064`"
            `$UpdateFromUUP = [bool]   `$False
            `$MultiEdition  = [bool]   `$True
            .\msupdate.ps1
        "
    }
}

# remove temporaty files
Remove-Item -Path ".\temp\" -Recurse -ErrorAction Ignore
Remove-Item -Path ".\entg\" -Recurse -ErrorAction Ignore
Remove-Item -Path ".\patch\" -Recurse -ErrorAction Ignore
Remove-Item -Path ".\fod\" -Recurse -ErrorAction Ignore
Remove-Item -Path ".\W10UI.cmd" -Recurse -ErrorAction Ignore
New-Item -Path ".\temp\" -ItemType "directory" -ErrorAction Ignore
New-Item -Path ".\bin\" -ItemType "directory" -ErrorAction Ignore

# Installing dependencies

if (-not (Test-Path -Path "C:\Program Files\7-Zip\7z.exe")) {
    Write-Error "7-zip not found, please install it manually!"
}
if (-not (Test-Path -Path ".\bin\aria2c.exe")) {
    Write-Host "aria2c not found, downloading..."
    Invoke-WebRequest -Uri 'https://github.com/aria2/aria2/releases/download/release-1.37.0/aria2-1.37.0-win-64bit-build1.zip' -outfile .\temp\aria2.zip
    Expand-Archive -Path .\temp\aria2.zip -DestinationPath .\temp -Force
    Move-Item -Path .\temp\aria2-1.37.0-win-64bit-build1\aria2c.exe -Destination .\bin\aria2c.exe -Force
}
if (-not (Test-Path -Path ".\bin\wimlib-imagex.exe")) {
    Write-Host "wimlib-imagex not found, downloading..."
    Invoke-WebRequest -Uri 'https://wimlib.net/downloads/wimlib-1.14.4-windows-x86_64-bin.zip' -outfile .\temp\wimlib.zip
    Expand-Archive -Path .\temp\wimlib.zip -DestinationPath .\temp\wimlib -Force
    Copy-Item -Path .\temp\wimlib\wimlib-imagex.exe -Destination .\bin\wimlib-imagex.exe
    Copy-Item -Path .\temp\wimlib\libwim-15.dll -Destination .\bin\libwim-15.dll
}
if (-not (Test-Path -Path ".\bin\PSFExtractor.exe")) {
    Write-Host "PSFExtractor not found, downloading..."
    Invoke-WebRequest -Uri 'https://github.com/Secant1006/PSFExtractor/releases/download/v3.07/PSFExtractor-v3.07-x64.zip' -outfile .\temp\PSFExtractor.zip
    Expand-Archive -Path .\temp\PSFExtractor.zip -DestinationPath .\bin -Force
}
if (-not (Test-Path -Path ".\bin\NSudoLC.exe")) {
    Write-Host "NSudo not found, downloading..."
    Invoke-WebRequest -Uri 'https://github.com/M2TeamArchived/NSudo/releases/download/8.2/NSudo_8.2_All_Components.zip' -outfile .\temp\NSudo.zip
    Expand-Archive -Path .\temp\NSudo.zip -DestinationPath .\temp\NSudo -Force
    Copy-Item -Path '.\temp\NSudo\NSudo Launcher\x64\NSudoLC.exe' -Destination .\bin\NSudoLC.exe
}

# get wupatch
if ($null -ne $UUPScript) {
    Invoke-WebRequest -Uri $UUPScript -OutFile ".\temp\UUPScript.txt"
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -j5 -c -R -d ".\patch" -i ".\temp\UUPScript.txt"
    if (!$?) {Write-Error "UUPScript Download Failed!"}
} elseif ($null -ne $WUScript) {
    Invoke-WebRequest -Uri $WUScript -OutFile ".\temp\WUScript.meta4"
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -j5 -c -R -d ".\patch" -M ".\temp\WUScript.meta4"
    if (!$?) {Write-Error "WUScript Download Failed!"}
} else {
    Write-Error "No Windows Update Scripts Found!"
}
if ($null -ne $NETScript) {
    Invoke-WebRequest -Uri $NETScript -OutFile ".\temp\NETScript.meta4"
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -j5 -c -R -d ".\patch" -M ".\temp\NETScript.meta4" --metalink-language="neutral"
    if (!$?) {Write-Error "NETScript Download Failed!"}
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -j5 -c -R -d ".\patch" -M ".\temp\NETScript.meta4" --metalink-language="zh-CN"
    if (!$?) {Write-Error "NETScript Download Failed!"}
}

# get fod
if ($null -ne $Miracast) {
    # Microsoft-Windows-WirelessDisplay-FOD-Package.cab
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -d ".\fod\Miracast\" -o "update.cab" "$Miracast"
    if (!$?) {Write-Error "Miracast Download Failed!"}
    expand -f:* ".\fod\Miracast\update.cab" ".\fod\Miracast\" >nul
    # Microsoft-Windows-WirelessDisplay-FOD-Package~zh-CN.cab
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -d ".\fod\MiracastLP\" -o "update.cab" "$MiracastLP"
    if (!$?) {Write-Error "MiracastLP Download Failed!"}
    expand -f:* ".\fod\Miracast\update.cab" ".\fod\MiracastLP\" >nul
}
if ($null -ne $iexplorer) {
    # microsoft-windows-internetexplorer-optional-package.cab
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -d ".\fod\iexplorer\" -o "update.cab" "$iexplorer"
    if (!$?) {Write-Error "iexplorer Download Failed!"}
    expand -f:* ".\fod\iexplorer\update.cab" ".\fod\iexplorer\" >nul
}

# get entg
if (($null -ne $entgpack) -and ($true -eq $MultiEdition)) {
    # Microsoft-Windows-EditionSpecific-EnterpriseG-Package.ESD
    .\bin\aria2c.exe --check-certificate=false -x16 -s16 -d ".\temp\" -o "entg.esd" "$entgpack"
    if (!$?) {Write-Error "entg Download Failed!"}
    ."C:\Program Files\7-Zip\7z.exe" x ".\temp\entg.esd" -o".\entg" -r
}

$MSStoreScript = "echo nostore"
if ($true -eq $msstore) {
    # get msstore
    Remove-Item -Path "$PSScriptRoot\msstore" -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Path "$PSScriptRoot\msstore" -ErrorAction SilentlyContinue
    Get-Appx 'Microsoft.DesktopAppInstaller'
    Get-Appx 'Microsoft.WindowsStore'
    $MSStoreScript = @"
for %%a in (%~dp0msstore\Microsoft.UI.Xaml.2.*_8wekyb3d8bbwe.Appx) do call :Add-ProvisionedAppxPackage "%%a"
for %%a in (%~dp0msstore\Microsoft.VCLibs.140.00.UWPDesktop_14.0.*_8wekyb3d8bbwe.Appx) do call :Add-ProvisionedAppxPackage "%%a"
for %%a in (%~dp0msstore\Microsoft.VCLibs.140.00_14.0.*_8wekyb3d8bbwe.Appx) do call :Add-ProvisionedAppxPackage "%%a"
for %%a in (%~dp0msstore\Microsoft.NET.Native.Runtime.2.*_8wekyb3d8bbwe.Appx) do call :Add-ProvisionedAppxPackage "%%a"
for %%a in (%~dp0msstore\Microsoft.NET.Native.Framework.2.*_8wekyb3d8bbwe.Appx) do call :Add-ProvisionedAppxPackage "%%a"
for %%a in (%~dp0msstore\Microsoft.WindowsStore_*_8wekyb3d8bbwe.Msixbundle) do call :Add-ProvisionedAppxPackage "%%a"
for %%a in (%~dp0msstore\Microsoft.DesktopAppInstaller_*_8wekyb3d8bbwe.Msixbundle) do call :Add-ProvisionedAppxPackage "%%a"
"@
}

# abbodi1406/W10UI, auto inject hook
$W10UI = "@chcp 65001`n"
$W10UI += (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/abbodi1406/BatUtil/master/W10UI/W10UI.cmd").Content
$W10UI = $W10UI.Replace("if %AddDrivers%==1 call :doDrv","call %~dp0hook_beforewim.cmd`nif %AddDrivers%==1 call :doDrv")

# write hook script
@"
echo.
echo ============================================================
echo Hook W10UI beforewim Successfully!
echo Current Dir: %cd%
echo ============================================================

if exist "!mountdir!\Windows\Servicing\Packages\*WinPE-LanguagePack*.mum" (
    echo.
    echo ============================================================
    echo Hook does not operate for WinPE, exiting...
    echo ============================================================
    exit /b
)

echo.
echo ============================================================
echo Enable Features...
echo ============================================================

%_dism2%:"!_cabdir!" %dismtarget% /Enable-Feature:LegacyComponents /All
%_dism2%:"!_cabdir!" %dismtarget% /Enable-Feature:SMB1Protocol
%_dism2%:"!_cabdir!" %dismtarget% /Enable-Feature:TFTP
%_dism2%:"!_cabdir!" %dismtarget% /Enable-Feature:TelnetClient

echo.
echo ============================================================
echo Adding Features on Demands...
echo ============================================================

echo current dir: %cd%

if exist "%~dp0fod\Miracast\update.mum" (
    %_dism2%:"!_cabdir!" %dismtarget% /Add-Package /PackagePath:"%~dp0fod\Miracast\update.mum" 
    %_dism2%:"!_cabdir!" %dismtarget% /Add-Package /PackagePath:"%~dp0fod\MiracastLP\update.mum"
)
if exist "%~dp0fod\iexplorer\update.mum" (
    %_dism2%:"!_cabdir!" %dismtarget% /Add-Package /PackagePath:"%~dp0fod\iexplorer\update.mum" 
)

echo.
echo ============================================================
echo Updating Microsoft Store...
echo ============================================================

$MSStoreScript

if /i not "$MultiEdition"=="true" EXIT /B

echo.
echo ============================================================
echo Commiting Base-Edition...
echo ============================================================

rem call :makemulti CoreCountrySpecific
%_dism2%:"!_cabdir!" /Commit-Image /MountDir:"!mountdir!"

echo.
echo ============================================================
echo Converting Multi-Edition...
echo ============================================================

call :makemulti Core
call :makemulti CoreSingleLanguage
call :makemulti Professional
call :makemulti ProfessionalWorkstation
call :makemulti Education
call :makemulti Enterprise
call :makemulti IoTEnterprise
if exist "%~dp0entg\update.mum" call :makeEntG
if exist "%~dp0entg\update.mum" call :makemulti EnterpriseG

set discard=1
EXIT /B

:Add-ProvisionedAppxPackage
echo installing - %~n1
%_dism2%:"!_cabdir!" %dismtarget% /Add-ProvisionedAppxPackage /PackagePath:"%~1" /SkipLicense /Region:all
goto :EOF

:makemulti
echo.
echo ============================================================
echo Coverting Edition - %1...
echo ============================================================
%_dism2%:"!_cabdir!" %dismtarget% /Set-Edition:%1
if !errorlevel! equ 0 (
    echo.
    echo ============================================================
    echo Commiting Edition - %1...
    echo ============================================================
    %_dism2%:"!_cabdir!" /Commit-Image /MountDir:"!mountdir!" /Append
) else (
    echo.
    echo ============================================================
    echo Coverting Edition - %1 Failed!
    echo ============================================================
)
goto :EOF

:makeEntG
echo.
echo ============================================================
echo Making EnterpriseG Version...
echo ============================================================

echo.
echo ============================================================
echo Installing EnterpriseG Package...
echo.
echo Note: If errors occur, it is normal.
echo ============================================================
%_dism2%:"!_cabdir!" %dismtarget% /Set-Edition:Enterprise
FOR %%a IN (%~dp0entg\*.mum) DO %_dism2%:"!_cabdir!" %dismtarget% /Add-Package /PackagePath:"%%a"

echo.
echo ============================================================
echo Copying servicing Packages...
echo.
echo Note: If errors occur, it must be 100% faild.
echo ============================================================
for /d %%a in ("!_cabdir!\*") do for %%b in ("%%a\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.*") do copy /y "%%~b" "!mountdir!\Windows\servicing\Packages"
for /d %%a in ("!_cabdir!\*") do for %%b in ("%%a\Microsoft-Windows-EnterpriseGEdition-wrapper~31bf3856ad364e35~amd64~~10.0.*") do copy /y "%%~b" "!mountdir!\Windows\servicing\Packages"

rem copy /y "%~dp0edition\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.*.*" "!mountdir!\Windows\servicing\Packages"
rem copy /y "%~dp0edition\Microsoft-Windows-EnterpriseGEdition-wrapper~31bf3856ad364e35~amd64~~10.0.*.*" "!mountdir!\Windows\servicing\Packages"

echo.
echo ============================================================
echo Getting informartion from registry...
echo ============================================================
REG.exe LOAD HKLM\EntGSOFTWARE "!mountdir!\Windows\System32\config\SOFTWARE"
for /f "tokens=6,7 delims=~." %%a in ('dir /b "!mountdir!\Windows\servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.*"') do set EntGEditionVersion=%%a.%%b

FOR /F "tokens=*" %%i IN ('REG QUERY "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages"^|find /i "Microsoft-Windows-Editions-EnterpriseG-Package~31bf3856ad364e35~"') DO (
    FOR /F "tokens=3* skip=2" %%j IN ('REG QUERY "%%i" /v InstallTimeHigh') DO SET "InstallTimeHigh=%%j"
    FOR /F "tokens=3* skip=2" %%k IN ('REG QUERY "%%i" /v InstallTimeLow') DO SET "InstallTimeLow=%%k"
    FOR /F "tokens=3* skip=2" %%l IN ('REG QUERY "%%i" /v InstallUser') DO SET "InstallUser=%%l"
    FOR /F "tokens=3* skip=2" %%m IN ('REG QUERY "%%i" /v InstallLocation') DO SET "InstallLocation=%%m"
)

echo.
echo ============================================================
echo Adding Edition Package informartion to the registry...
echo.
echo EntGEditionVersion: %EntGEditionVersion%
echo InstallTimeHigh: %InstallTimeHigh%
echo InstallTimeLow: %InstallTimeLow%
echo InstallUser: %InstallUser%
echo InstallLocation: %InstallLocation%
echo ============================================================
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "CurrentState" /t REG_DWORD /d 112
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "InstallClient" /t REG_SZ /d "DISM Package Manager Provider"
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "InstallLocation" /t REG_SZ /d "\\?%WorkDisk%\%LCUName%"
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "InstallName" /t REG_SZ /d "Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%.mum"
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "InstallTimeHigh" /t REG_DWORD /d "%InstallTimeHigh%"
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "InstallTimeLow" /t REG_DWORD /d "%InstallTimeLow%"
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "InstallUser" /t REG_SZ /d "%InstallUser%"
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "SelfUpdate" /t REG_DWORD /d 0
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /f /v "Visibility" /t REG_DWORD /d 1
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%\Owners" /f
REG.exe ADD "HKLM\EntGSOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages\Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%\Owners" /f /v "Microsoft-Windows-EnterpriseGEdition~31bf3856ad364e35~amd64~~10.0.%EntGEditionVersion%" /t REG_DWORD /d 131184

REG.exe UNLOAD HKLM\EntGSOFTWARE

echo.
echo ============================================================
echo Setting key and license...
echo ============================================================
%_dism2%:"!_cabdir!" %dismtarget% /Set-ProductKey:FV469-WGNG4-YQP66-2B2HY-KD8YX
%_dism2%:"!_cabdir!" %dismtarget% /Get-CurrentEdition
MKDIR "!mountdir!\Windows\System32\Licenses\neutral\_Default\EnterpriseG"
COPY /Y "!mountdir!\Windows\System32\Licenses\neutral\Volume\Professional\*.*" "!mountdir!\Windows\System32\Licenses\neutral\_Default\EnterpriseG"

goto :EOF
"@ | Out-File -FilePath ".\hook_beforewim.cmd"

if ($true -eq $MultiEdition) {
$W10UI = $W10UI.Replace("`n:dvdproceed","`n:dvdproceed`ncall %~dp0hook_beforedvd.cmd")
@"
cd /d "%~dp0"
set "filename=ISO\sources\install.wim"
set "wimlib=bin\wimlib-imagex.exe"

for /F "tokens=3" %%a in ('%wimlib% info "%filename%" ^| findstr /C:"Image Count:"') do set "ImageCount=%%a"
for /L %%# in (1,1,%ImageCount%) do call :editwiminfo %%#
exit /b

:readwiminfo
for /f "tokens=1,2 delims=:" %%a in ('%wimlib% info "%filename%" %1 ^| find /i %2') do (for /f "tokens=*" %%c in ("%%b") do (set "%%a=%%c"))
goto :eof

:editwiminfo
call :readwiminfo %1 "Edition ID"
call :readwiminfo %1 "Build"
if %Build% GEQ 22000 (
    set sysver=Windows 11
) else (
    set sysver=Windows 10
)
if /i "%Edition ID%"=="Core" set "CNEDITION=家庭版"
if /i "%Edition ID%"=="CoreSingleLanguage" set "CNEDITION=家庭单语言版"
if /i "%Edition ID%"=="CoreCountrySpecific" set "CNEDITION=家庭中文版"
if /i "%Edition ID%"=="Professional" set "CNEDITION=专业版"
if /i "%Edition ID%"=="ProfessionalEducation" set "CNEDITION=专业教育版"
if /i "%Edition ID%"=="ProfessionalWorkstation" set "CNEDITION=专业工作站版"
if /i "%Edition ID%"=="Education" set "CNEDITION=教育版"
if /i "%Edition ID%"=="Enterprise" set "CNEDITION=企业版"
if /i "%Edition ID%"=="IoTEnterprise" set "CNEDITION=IoT企业版"
if /i "%Edition ID%"=="EnterpriseG" set "CNEDITION=企业版G"
if /i "%CNEDITION%"=="" set "CNEDITION=未知版"
%wimlib% info "%filename%" %1 "%sysver% %Edition ID%" "%sysver% %Edition ID%" --image-property "DISPLAYNAME"="%sysver% %CNEDITION%" --image-property "DISPLAYDESCRIPTION"="%sysver% %CNEDITION%" --image-property "FLAGS"="%Edition ID%"
goto :eof
"@ | Out-File -FilePath ".\hook_beforedvd.cmd"
}

# write W10UI
$W10UI | Out-File -FilePath ".\W10UI.cmd" -Encoding utf8
$W10UI = ""

# get osimage
# get original system direct link
if ($null -ne $ospath) {
    $obj = (Invoke-WebRequest -UseBasicParsing -Uri "https://alist.xrgzs.top/api/fs/get" `
    -Method "POST" `
    -ContentType "application/json;charset=UTF-8" `
    -Body (@{
        path = $ospath
        password = ""
    } | Convertto-Json)).Content | ConvertFrom-Json
    $osurl = $obj.data.raw_url
    $osfile = $obj.data.name
}
Write-Host "Original system file: $osfile
Original system download link: $osurl
"
.\bin\aria2c.exe --check-certificate=false -s16 -x16 -d ".\temp" -o "$osfile" "$osurl"
if ($?) {Write-Host "System Image Download Successfully!"} else {Write-Error "System Image Download Failed!"}

# $isopath = Resolve-Path -Path ".\temp\$osfile"
# $isomount = (Mount-DiskImage -ImagePath $isopath -PassThru | Get-Volume).DriveLetter
# Target        =${isomount}:
."C:\Program Files\7-Zip\7z.exe" x ".\temp\$osfile" -o".\ISO" -r

# select 1 edition only
# if ($null -ne $SelectEdition) {
#     .\bin\wimlib-imagex.exe info ".\ISO\sources\install.wim" --extract-xml ".\temp\WIMInfo.xml"
#     $WIMInfo = [xml](Get-Content ".\temp\WIMInfo.xml")
#     $WIMIndex = $WIMInfo.WIM.IMAGE | Where-Object {$_.WINDOWS.EDITIONID -eq "$SelectEdition"} | Select-Object -ExpandProperty INDEX
#     $WIMIndexs = $WIMInfo.WIM.IMAGE.Index | Measure-Object | Select-Object -ExpandProperty Count
#     for ($i = $WIMIndexs; $i -gt $WIMIndex; $i--) {
#         # .\bin\wimlib-imagex.exe delete ".\ISO\sources\install.wim" $i --soft
#         Remove-WindowsImage -ImagePath ".\ISO\sources\install.wim" -Index $i
#     }
#     for ($i = 1; $i -lt $WIMIndex; $i++) {
#         Remove-WindowsImage -ImagePath ".\ISO\sources\install.wim" -Index 1
#     }
# }

.\bin\wimlib-imagex.exe info ".\ISO\sources\install.wim" --extract-xml ".\temp\WIMInfo2.xml"
Get-Content ".\temp\WIMInfo2.xml"

# write W10UI conf
@"
[W10UI-Configuration]
Target        =%cd%\ISO
Repo          =%cd%\patch
DismRoot      =dism.exe

Net35         =1
Net35Source   =
Cleanup       =1
ResetBase     =0
LCUwinre      =1
WinRE         =1
UpdtBootFiles =1
SkipEdge      =0
UseWimlib     =1

_CabDir       =W10UItemp
MountDir      =W10UImount
WinreMount    =W10UImountre

wim2esd       =1
wim2swm       =0
ISO           =1
ISODir        =
Delete_Source =0

AutoStart     =1

AddDrivers    =0
Drv_Source    =\Drivers
"@ | Out-File -FilePath ".\W10UI.ini"

# execute W10UI script
.\bin\NSudoLC.exe -Wait -U:T -P:E -CurrentDirectory:. -UseCurrentConsole .\W10UI.cmd

function Get-Appx($Name) {
    $obj = Invoke-WebRequest -Uri "https://store.xr6.xyz/api/GetFiles" `
    -Method "POST" `
    -ContentType "application/x-www-form-urlencoded" `
    -Body @{
        type = 'PackageFamilyName'
        url = $Name + '_8wekyb3d8bbwe'
        ring = 'RP'
        lang = 'zh-CN'
    }

    foreach ($link in $obj.Links) {
        if ($link.outerHTML -match '(?<=<a\b[^>]*>).*?(?=</a>)') {
            $linkText = $Matches[0]
            if ($linkText -match '(x64|neutral).*\.(appx|appxbundle|msixbundle)\b') {
                Write-Debug "$linkText : $($link.href)"
                if (Test-Path -Path $linkText) {
                    Write-Warning "Already exists, skiping $linkText"
                } else {
                    Invoke-WebRequest -Uri $link.href -OutFile "$PSScriptRoot\msstore\$linkText"
                }
            }
        }
    }
}


# rename
Get-ChildItem -Path ".\*.iso" -File | ForEach-Object {
    $NewName = $_.Name
    if ($true -eq $MultiEdition) {
        $NewName = $NewName -replace "_CLIENT", "_CLIENTMULTI"
    }
    if ($true -eq $UpdateFromUUP) {
        $NameAppend += "_UUP"
    }
    if ($true -eq $AddVMD) {
        $NameAppend += "_VMD"
    }
    if ($true -eq $AddUnattend) {
        $NameAppend += "_Unattend"
    }
    if ($true -eq $SkipCheck) {
        $NameAppend += "_SkipCheck"
    }
    if ($null -ne $NameAppend) {
        $NewName = $NewName -replace ".iso", "$NameAppend.iso"
    }
    if ($_.Name -ne $NewName) {
        Rename-Item -Path $_.Name -NewName $NewName
    }
}

# get hash
Get-ChildItem -Path ".\*.iso" -File | ForEach-Object {
    Write-Host "Getting hash for $($_.Name)..."
    $FileInfo = [ordered] @{}
    $FileInfo.UUID = [guid]::NewGuid().ToString()
    $FileInfo.Name = $_.Name
    $FileInfo.Size = $_.Length
    $FileInfo.Date = $_.LastWriteTime
    $FileInfo.Hash = @{}
    $FileInfo.Hash.SHA256 = Get-FileHash -Path $_.Name -Algorithm SHA256 | Select-Object -ExpandProperty Hash
    $FileInfo.Hash.MD5 = Get-FileHash -Path $_.Name -Algorithm MD5 | Select-Object -ExpandProperty Hash
    $FileInfo.MakeVersion = $MakeVersion
    $FileInfo.MSUpdate = $true
    $FileInfo.MultiEdition = $MultiEdition
    $FileInfo.UpdateFromUUP = $UpdateFromUUP
    $FileInfo.AddUnattend = $AddUnattend
    $FileInfo.SkipCheck = $SkipCheck
    $FileInfo.MakeFrom = $osfile
    $FileInfo.MakeFrom = $msstore
    $FileInfo | ConvertTo-Json | Out-File -FilePath ".\$($_.Name).json" -Encoding utf8
}