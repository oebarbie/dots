# postinstallation

## printer
1. `paru -S cups` install [cups](https://en.wikipedia.org/wiki/CUPS)
2. `sudo systemctl enable --now cups` enable cups
3. `paru -S hplip` install [hp linux imaging and printing](https://en.wikipedia.org/wiki/HP_Linux_Imaging_and_Printing)
4. `sudo hp-setup -i` install a driver plug-in. during installation of the plug-in, select the default option.
5. `paru -S system-config-printer` install gui tool to configure printers
6. start system-config-printer and click the button to add a printer, select your printer and choose HPLIP as the connection method, it should now allow you to print a test page.
7. `paru -S gtk3-print-backends` install for a GTK application like Evince to show your printer in the printing dialog
