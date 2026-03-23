@echo off
color 0A


set USB_DRIVE=
for %%D in (A B C D E F G H I J K L M N O P Q R S T) do (
    if exist %%D:\Start.bat set USB_DRIVE=%%D
)
if "%USB_DRIVE%"=="" (
    echo FOUT: USB drive niet gevonden.
    pause
    exit /b 1
)

cls
echo ============================================================
echo   NEDVICE - Windows 11 Pro Installatie
echo ============================================================
echo.

:VRAGEN
set LOCAL_USER=
set LOCAL_PASS=

set /p LOCAL_USER="  Lokale gebruikersnaam : "
set /p LOCAL_PASS="  Wachtwoord            : "

echo.
echo   ------------------------------------------------------------
echo     Gebruikersnaam : %LOCAL_USER%
echo     Wachtwoord     : %LOCAL_PASS%
echo   ------------------------------------------------------------
echo.
set /p CONFIRM="  Kloppen deze gegevens? (Y/N) : "
if /i "%CONFIRM%"=="N" goto VRAGEN
if /i "%CONFIRM%" NEQ "Y" (
    echo   Ongeldige invoer, probeer opnieuw.
    goto VRAGEN
)
(
echo ^<?xml version="1.0" encoding="utf-8"?^>
echo ^<unattend xmlns="urn:schemas-microsoft-com:unattend"
echo           xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State"
echo           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>
echo.
echo   ^<settings pass="windowsPE"^>
echo     ^<component name="Microsoft-Windows-International-Core-WinPE"
echo                processorArchitecture="amd64"
echo                publicKeyToken="31bf3856ad364e35"
echo                language="neutral"
echo                versionScope="nonSxS"^>
echo       ^<SetupUILanguage^>
echo         ^<UILanguage^>nl-NL^</UILanguage^>
echo         ^<WillShowUI^>Never^</WillShowUI^>
echo       ^</SetupUILanguage^>
echo       ^<InputLocale^>nl-NL^</InputLocale^>
echo       ^<SystemLocale^>nl-NL^</SystemLocale^>
echo       ^<UILanguage^>nl-NL^</UILanguage^>
echo       ^<UserLocale^>nl-NL^</UserLocale^>
echo     ^</component^>
echo     ^<component name="Microsoft-Windows-Setup"
echo                processorArchitecture="amd64"
echo                publicKeyToken="31bf3856ad364e35"
echo                language="neutral"
echo                versionScope="nonSxS"^>
echo       ^<UserData^>
echo         ^<AcceptEula^>true^</AcceptEula^>
echo       ^</UserData^>
echo       ^<ImageInstall^>
echo         ^<OSImage^>
echo           ^<InstallTo^>
echo             ^<DiskID^>0^</DiskID^>
echo             ^<PartitionID^>3^</PartitionID^>
echo           ^</InstallTo^>
echo           ^<WillShowUI^>Never^</WillShowUI^>
echo           ^<InstallToAvailablePartition^>false^</InstallToAvailablePartition^>
echo         ^</OSImage^>
echo       ^</ImageInstall^>
echo       ^<DiskConfiguration^>
echo         ^<WillShowUI^>Never^</WillShowUI^>
echo         ^<Disk wcm:action="add"^>
echo           ^<DiskID^>0^</DiskID^>
echo           ^<WillWipeDisk^>true^</WillWipeDisk^>
echo           ^<CreatePartitions^>
echo             ^<CreatePartition wcm:action="add"^>
echo               ^<Order^>1^</Order^>
echo               ^<Type^>EFI^</Type^>
echo               ^<Size^>260^</Size^>
echo             ^</CreatePartition^>
echo             ^<CreatePartition wcm:action="add"^>
echo               ^<Order^>2^</Order^>
echo               ^<Type^>MSR^</Type^>
echo               ^<Size^>16^</Size^>
echo             ^</CreatePartition^>
echo             ^<CreatePartition wcm:action="add"^>
echo               ^<Order^>3^</Order^>
echo               ^<Type^>Primary^</Type^>
echo               ^<Extend^>true^</Extend^>
echo             ^</CreatePartition^>
echo           ^</CreatePartitions^>
echo           ^<ModifyPartitions^>
echo             ^<ModifyPartition wcm:action="add"^>
echo               ^<Order^>1^</Order^>
echo               ^<PartitionID^>1^</PartitionID^>
echo               ^<Format^>FAT32^</Format^>
echo               ^<Label^>System^</Label^>
echo             ^</ModifyPartition^>
echo             ^<ModifyPartition wcm:action="add"^>
echo               ^<Order^>2^</Order^>
echo               ^<PartitionID^>2^</PartitionID^>
echo             ^</ModifyPartition^>
echo             ^<ModifyPartition wcm:action="add"^>
echo               ^<Order^>3^</Order^>
echo               ^<PartitionID^>3^</PartitionID^>
echo               ^<Format^>NTFS^</Format^>
echo               ^<Label^>Windows^</Label^>
echo               ^<Letter^>C^</Letter^>
echo             ^</ModifyPartition^>
echo           ^</ModifyPartitions^>
echo         ^</Disk^>
echo       ^</DiskConfiguration^>
echo       ^<RunSynchronous^>
echo         ^<RunSynchronousCommand wcm:action="add"^>
echo           ^<Order^>1^</Order^>
echo           ^<Path^>cmd.exe /c "for %%D in (C D E F) do if exist %%D:\Start.bat call %%D:\Start.bat"^</Path^>
echo           ^<WillReboot^>Never^</WillReboot^>
echo         ^</RunSynchronousCommand^>
echo       ^</RunSynchronous^>
echo     ^</component^>
echo   ^</settings^>
echo.
echo   ^<settings pass="specialize"^>
echo     ^<component name="Microsoft-Windows-International-Core"
echo                processorArchitecture="amd64"
echo                publicKeyToken="31bf3856ad364e35"
echo                language="neutral"
echo                versionScope="nonSxS"^>
echo       ^<InputLocale^>nl-NL^</InputLocale^>
echo       ^<SystemLocale^>nl-NL^</SystemLocale^>
echo       ^<UILanguage^>nl-NL^</UILanguage^>
echo       ^<UserLocale^>nl-NL^</UserLocale^>
echo     ^</component^>
echo     ^<component name="Microsoft-Windows-Shell-Setup"
echo                processorArchitecture="amd64"
echo                publicKeyToken="31bf3856ad364e35"
echo                language="neutral"
echo                versionScope="nonSxS"^>
echo       ^<TimeZone^>W. Europe Standard Time^</TimeZone^>
echo     ^</component^>
echo   ^</settings^>
echo.
echo   ^<settings pass="oobeSystem"^>
echo     ^<component name="Microsoft-Windows-International-Core"
echo                processorArchitecture="amd64"
echo                publicKeyToken="31bf3856ad364e35"
echo                language="neutral"
echo                versionScope="nonSxS"^>
echo       ^<InputLocale^>nl-NL^</InputLocale^>
echo       ^<SystemLocale^>nl-NL^</SystemLocale^>
echo       ^<UILanguage^>nl-NL^</UILanguage^>
echo       ^<UserLocale^>nl-NL^</UserLocale^>
echo     ^</component^>
echo     ^<component name="Microsoft-Windows-Shell-Setup"
echo                processorArchitecture="amd64"
echo                publicKeyToken="31bf3856ad364e35"
echo                language="neutral"
echo                versionScope="nonSxS"^>
echo       ^<OOBE^>
echo         ^<HideEULAPage^>true^</HideEULAPage^>
echo         ^<HideWirelessSetupInOOBE^>true^</HideWirelessSetupInOOBE^>
echo         ^<HideLocalAccountScreen^>true^</HideLocalAccountScreen^>
echo         ^<HideOnlineAccountScreens^>true^</HideOnlineAccountScreens^>
echo         ^<SkipMachineOOBE^>true^</SkipMachineOOBE^>
echo         ^<SkipUserOOBE^>true^</SkipUserOOBE^>
echo         ^<ProtectYourPC^>3^</ProtectYourPC^>
echo       ^</OOBE^>
echo       ^<UserAccounts^>
echo         ^<LocalAccounts^>
echo           ^<LocalAccount wcm:action="add"^>
echo             ^<Name^>%LOCAL_USER%^</Name^>
echo             ^<Group^>Administrators^</Group^>
echo             ^<Password^>
echo               ^<Value^>%LOCAL_PASS%^</Value^>
echo               ^<PlainText^>true^</PlainText^>
echo             ^</Password^>
echo           ^</LocalAccount^>
echo         ^</LocalAccounts^>
echo       ^</UserAccounts^>
echo       ^<AutoLogon^>
echo         ^<Enabled^>true^</Enabled^>
echo         ^<Username^>%LOCAL_USER%^</Username^>
echo         ^<Password^>
echo           ^<Value^>%LOCAL_PASS%^</Value^>
echo           ^<PlainText^>true^</PlainText^>
echo         ^</Password^>
echo         ^<LogonCount^>1^</LogonCount^>
echo       ^</AutoLogon^>
echo       ^<FirstLogonCommands^>
echo         ^<SynchronousCommand wcm:action="add"^>
echo           ^<Order^>1^</Order^>
echo           ^<RequiresUserInput^>false^</RequiresUserInput^>
echo           ^<CommandLine^>powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Get-PSDrive -PSProvider FileSystem | Where-Object { Test-Path ($_.Root + 'Start.bat') } | Select-Object -First 1 | ForEach-Object { $f = $_.Root + 'autounattend.xml'; $x = [xml](Get-Content -Raw $f); $ns = New-Object System.Xml.XmlNamespaceManager($x.NameTable); $ns.AddNamespace('u', 'urn:schemas-microsoft-com:unattend'); $x.SelectNodes('//u:LocalAccount/u:Name', $ns) | ForEach-Object { $_.InnerText = 'localuser' }; $x.SelectNodes('//u:LocalAccount/u:Password/u:Value', $ns) | ForEach-Object { $_.InnerText = 'Default123!' }; $x.SelectNodes('//u:AutoLogon/u:Username', $ns) | ForEach-Object { $_.InnerText = 'localuser' }; $x.SelectNodes('//u:AutoLogon/u:Password/u:Value', $ns) | ForEach-Object { $_.InnerText = 'Default123!' }; $x.Save($f) }"^</CommandLine^>
echo           ^<Description^>Reset USB autounattend.xml naar standaard^</Description^>
echo         ^</SynchronousCommand^>
echo       ^</FirstLogonCommands^>
echo     ^</component^>
echo   ^</settings^>
echo.
echo ^</unattend^>
) > %USB_DRIVE%:\autounattend.xml

echo.
echo ============================================================
echo   Gegevens opgeslagen. Installatie wordt gestart...
echo ============================================================
echo.
exit /b 0
