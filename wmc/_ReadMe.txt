#############
Info:
#############


Hi from T-S

########## WMC 8.8.4 ############

The package now embeds a local copy of CPFilters.dll (extracted from Windows 10 1809) and a custom assembly manifest to work around breaking changes introduced in Windows 10 1903.
Existing application manifests have all been updated to reference the new Microsoft.Windows.CPFilters assembly manifest.

The uninstaller was updated to automatically delete Windows Media Center Systray.lnk file from ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp.

Author: Kévin Chalet


########## WMC 8.8.3 ############

The installer was updated to create a .lnk file pointing to the Windows Media Center Systray executable in the ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp folder.
Unlike Windows 7, Windows 10 doesn't seem to have a magical way to automatically launch it when booting. Yet, the WMC Systray is responsible of fairly critical tasks, like allowing
to start Windows Media Center using the green button of RC6 remotes, showing a red button in the Windows task bar when TV programs are being recorded and even warning the user
when rebooting the system if TV shows are still being recorded (to prevent accidental reboots). This release fixes that by explicitly starting the WMC Systray at boot time.

To support EPG program icons pointing to HTTPS servers that no longer support TLS 1.0/1.1 (and now require TLS 1.2), ehshell.exe.config was updated to allow Windows Media Center
to use the default TLS versions provided by the operating system (which currently includes TLS 1.2 and will include TLS 1.3 once it's supported by Windows).
Note: this change has no effect if .NET Framework 4.7 or a newer version is not installed on the machine.

For more information, visit https://kevinchalet.com/2019/04/11/forcing-an-old-net-application-to-support-tls-1-2-without-recompiling-it/

Author: Kévin Chalet


########## WMC 8.8.2 ############

To work around breaking changes introduced in Windows 10 1803, the installer now includes MSVidCtl.dll/EncDec.dll and
custom application manifests to ensure these 2 dynamic-link libraries are not loaded from the shared System32 folder.

For more information, visit https://kevinchalet.com/2018/10/07/highway-to-dll-hell/ and https://www.windowsmediacenter.fr/2018/10/07/windows-media-center-voici-pour-vous-wmc-8-8-2-linstallateur-ultime/

Author: Kévin Chalet


########## WMC 8.8.1 ############

Minor fix because a couple of registry values containing a couple of unwanted/not prntable characters.

They were dragged from V8 and were discovered few days after the V8 release by the user ManiaDC and fixed on V9+ by Abbodi1406.

I missed that V8 was published before the glitch was discovered, but another MDL user, ejohnson0547 spotted that regression.

Thanks to both of them.

A quick fix .reg file is included for people running the 8.7/8.8, so no need to uninstall reinstall, just doubleclkick on it and click OK both on the UAC popup and regedit popup


########## WMC 8.8 ##############

#1 Fixed a stupid copy/paste mistake that lead to install via the old V8 elevated prompt instead of the new V12 like one.
This impacted some few installations where nsudo works correctly while runassystem does not

Hence there isn't any need to uninstall/reinstall if V8.7 worked for you


#2 The installer is both cleaner and more chatty/informative about what's going on

#3 Better checking about the Windows version, the need to install the DVD player, and so on.


########## WMC 8.7 ##############

#1 The network service thing should be really fixed this time

#2 The DVDplayer installation shoudn't fail anymore on virgin W10 installations.

#3 The ResetSettings script is added to help the people who upgraded from Win 7 Homepremium/Pro/Ultimate or Win8 WMC or Win 8.1 WMC or an earlier W10 version.

IF WMC won't start at all, LAUNCH IT! 

#4 There are now two different installers for blue and green skinned WMC


########## WMC 8.6 ##############

#1 Hopefully there isn't anymore the need to add the "Network Service" to the Administrator group to get the WMC services fully working

#2To help the XB360 owners ntrights is already included, Mcx2Prov.exe is includedd as well as Mcx2Prov.exe.XB360

Rename the original to Mcx2Prov.exe.old and Mcx2Prov.exe.XB360 to Mcx2Prov.exe if you mind to play with the XB360 as extender.

No other action is taken automatically so you still need to follow Maulevalli's and/or Garet North's instructions

http://forums.mydigitallife.info/threads/61061-DISCUSSION-Patch-WMC-to-run-on-Windows-10-final-amp-possible-alternatives/page99?p=1209614&viewfull=1#post1209614
http://forums.mydigitallife.info/threads/61061-DISCUSSION-Patch-WMC-to-run-on-Windows-10-final-amp-possible-alternatives/page106?p=1218317&viewfull=1#post1218317  


#3 For your convenience the test right prompt is now opened in the current directory rather than \windows\system32 



########## WMC 8.5 ##############

This Package is largely based on V8 and V12 packages from Abbodi1406 and is meant to be installed on

Win 8.1 / Win Server 2012R2

Win 10 / Win Server 2016 tp4 /tp5  (and hopefully any following version)

####### What's New ##########

Unlike V8 the elevated prompt is Nsudo based (more reliable)

Unlike V8 My channel logos is fully working

Unlike V8 thw wmc files aren't duplicated anymore. Thy are correctly hardlinked like on the navive WMC and on V12

Unlike V12 it is not based on DISM, which hopefully should give an easier installation path, and better survivability to official updates and dism based image checks 

It includes all the latest patched files included on V12

Additionally it includes the RDP patches (WMC should work from remote desktop connections out of the box)

It includes the DVDplayer app wich enables the stock codecs (on W10 only)

Unlike V8 and V12 installer scripts will asks for admin rights by their self so no need to explicitly launch them as adaministrator (credits to MSMG for that code)

By default it installs my green skinned WMC (if you dont want it, just rename ehres.dll to ehres.green.dll, and ehres.blue.dll to ehres.dll, before the launching the installer)

I don't know if it works or not for US people on Cable card, given I have no way to test it in europe, please report your experience on W10

http://forums.mydigitallife.info/threads/61061-DISCUSSION-Patch-WMC-to-run-on-Windows-10-final-amp-possible-alternatives

or on

WMC on Servers 

http://forums.mydigitallife.info/threads/65614-The-Holy-Grail-Get-WMC-on-Server-2011-2012-R2-2016-tp4-5

threads



(Keep in mind that altough based on two proven packages the current V8.5 may still have unnoticed problems and/or mistakes)


#############
Important:
#############
After you download the pack, make sure the file is Unblocked
to do so, right click on file, go to properties - general tab - click Unblock button if present

#############
Instructions:
#############
0) Extract the package to a directory with simple short path without spaces in it (i.e. C:\WMC85)

if you previously tried another/older pack, or your system is upgraded from Windows 7/8.1 with Media Center
you may run Uninstaller.cmd to remove the pack/leftovers properly, and reboot the system afterwards

1) Click on _TestRights.cmd, if another command prompt window is opened, then close it and proceed to step 2)
if no cmd window opened, then you need to reboot the system and test again.

2) Run the outer Installer.cmd script as administrator to install the pack

--
Uninstall Note:
After to unistall the pack, these three files may still exist due locked status:
C:\Windows\ehome\WTVGOTHIC-S.ttc
C:\Windows\ehome\malgunmc.ttf
C:\Windows\ehome\ehSSO.dll

to get rid of them, you have to reboot, afterwards run _TestRights.cmd and execute this at cmd:
rd /s /q C:\Windows\ehome

#############
Credits:
#############
http://forums.mydigitallife.info/members/339950-Graznok
http://forums.mydigitallife.info/members/204274-abbodi1406
http://forums.mydigitallife.info/members/327832-T-S
http://forums.mydigitallife.info/members/54630-dejong12
http://forums.mydigitallife.info/members/250156-SuperBubble
and various members in this thread:
http://forums.mydigitallife.info/threads/61061
