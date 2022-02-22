This is QNAP script to autostart virtual machine and auto mount USB device to selected virtual machine.
This instructions are written from instructions from user MassiXV from QNAP Forum.

Requirements:
- QNAP NAS with QTS 5.0.0(Tested on 5.0.0.1891)
- Virtualization Station 3.6 (Tested on 3.6.16)
- SSH Access to copy scripts and install autorun package
- Enabled "Allow installation of applications without a valid digital signature"


1.) SSH into the NAS and edit qpkg.conf file to create a dummy package:
```
vi /etc/config/qpkg.conf
```

2.) Add at the end of the file:
```
[autorun]
Name = autorun
Version = 0.1
Author = Massi-X (Mod by _Dejan_)
Date = 2020-11-01
Shell = /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh
Install_Path = /share/CE_CACHEDEV1_DATA/.qpkg/autorun
QPKG_File = autorun.qpkg
Enable = FALSE
```

3.) Create the folder for the package:
```
mkdir /share/CE_CACHEDEV1_DATA/.qpkg/autorun
```

4.) Create the autorun file:
```
vi /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh
```

5.) Paste lines from uploaded autorun.sh file to this new file. Replace "VM-TEST-01" with your VM name to show correct name inside logs. In Virtualization Station find UUID inside your VM settings and replace UUID in autorun.sh file(c29a6780-0494-4de3-89ea-8120fc01a22f) with your UUID.

Save file and make it executable:
```
chmod +x /share/CE_CACHEDEV1_DATA/.qpkg/autorun/autorun.sh
```

6.) Create the USB info file:
```
vi /share/CE_CACHEDEV1_DATA/.qpkg/autorun/Mount_USB_1.xml
```

and copy content from uploaded Mount_USB_1.xml. Edit "vendor id" and "product id" to your device id's. You can find your device id's with simple command "lsusb".
Save file and exit. And that is all.

If everything work ok can be tested that you shutdown VM and inside SSH run command:
```
sh autorun.sh
```

If VM start and output show that device is attached successfully then this is OK. If not then recheck if everything is ok(permission, UUID, device id's...).

If you need connect more than one device then you need repeat step 6. and create new device XML:
```
vi /share/CE_CACHEDEV1_DATA/.qpkg/autorun/Mount_USB_2.xml
```
and inside autorun.sh file add additional line to attach device so after added line it will look:
```
/QVS/usr/bin/virsh attach-device c29a6780-0494-4de3-89ea-8120fc01a22f $DIR/Mount_USB_1.xml
/QVS/usr/bin/virsh attach-device c29a6780-0494-4de3-89ea-8120fc01a22f $DIR/Mount_USB_2.xml
```


If you like my work you can donate and support my work...

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/donate/?hosted_button_id=MP6Y6ZVHZR4FN)
