This is QNAP script to autostart virtual machine and auto mount USB device to selected virtual machine.
This instructions are written from instructions from user MassiXV from QNAP Forum.

Requirements:
- QNAP NAS with QTS 5.0.0(Tested on 5.0.0.1891)
- Virtualization Station 3.6 (Tested on 3.6.16)
- SSH Access to copy scripts and install autorun package
- Enabled "Allow installation of applications without a valid digital signature"


1.) SSH into the NAS and edit qpkg.conf file to create a dummy package:

vi /etc/config/qpkg.conf

2.) Add at the end of the file:

[autorun]
Name = autorun
Version = 0.1
Author = Massi-X (Mod by _Dejan_)
Date = 2020-11-01
Shell = /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh
Install_Path = /share/CE_CACHEDEV1_DATA/.qpkg/autorun
QPKG_File = autorun.qpkg
Enable = FALSE

3.) Create the folder for the package:

mkdir /share/CE_CACHEDEV1_DATA/.qpkg/autorun

4.) Create the autorun file:

vi /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh

5.) Paste lines from uploaded autorun.sh file to this new file. Replace "VM-TEST-01" with your VM name to show correct name inside logs. In Virtualization Station find UUID inside your VM settings and replace UUID in autorun.sh file(c29a6780-0494-4de3-89ea-8120fc01a22f) with your UUID.

Save file and make it executable:

chmod +x /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh

6.) Create the USB info file:

vi /share/CE_CACHEDEV1_DATA/.qpkg/autorun/Mount_USB_1.xml

and copy content from uploaded Mount_USB_1.xml. Edit "vendor id" and "product id" to your device id's. You can find your device id's with simple command "lsusb".
Save file and exit.
