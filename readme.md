# installation

**1. make a bootable usb**
   - archlinux.org ➜ download ➜ ur country
   - download iso file, *sums.txt
   - `sha256sums -c sha256sums.txt` signature check

**2. iso to usb**
   - `paru -S ventoy-bin` or obtain ventoy from aur
   - `sudo ventoy -i /dev/sdb`
   - `sudo mount /dev/sdb1 /mnt`
   - `cp {file}.iso /mnt`
   - `sudo umount /mnt`

**3. bios**
   - reboot + f2
   - boot: change order

**4. details**
   - `rmmod pcspkr`
   - `setfont ter-132n`

**5. internet** (wifi/ethernet)
   - `ip a`

**6. disk layout**
   - `lsblk` to see disk layout
   - `fdisk /dev/sda` (`g` - guid, `n` - new, `w` - write)
   - `fdisk /dev/sda` ➜ g ➜ n ➜ enter ➜ enter ➜ +1G ➜ .. ➜ n ➜ enter ➜ enter ➜ enter .. ➜ w
   - `mkfs.fat -F32 /dev/sda1`, `mkfs.ext4 /dev/sda2` create file systems
   - `mount /dev/sda2 /mnt`, `mount -m /dev/sda1 /mnt/boot` mount file systems

**7. packages installation**
   - `pacstrap /mnt linux linux-firmware base base-devel networkmanager grub efibootmgr fish helix`

**8. finish disk layout**
   - `genfstab -U /mnt > /mnt/etc/fstab`
   - `cp /usr/share/kbd/consolefonts/ter-132n.psf.gz /mnt/usr/share/kbd/consolefonts` copy font
   - `arch-chroot /mnt`
   - `fish`

**9. user**
   - `echo "comp" > /etc/hostname`
   - `useradd -mG wheel -s $(which fish) "brb"`
   - `passwd` for root
   - `passwd brb`
   - `EDITOR=helix visudo`(uncomment last paragraph to allow members of wheel to execute any command)

**10. grub**
   - `grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot`
   - `grub-mkconfig -o /boot/grub/grub.cgf`
   - exit the chroot, fish (ctrl D * 2)
   - `umount -R /mnt`
   - `shutdown now`

# postinstallation

**internet** 
1. network manager
   - `ip a`
   - `systemctl status NetworkManager.service`
   - `systemctl enable --now NetworkManager.service`
2. wifi
   - `nmcli d w c "name" --ask` (`d` - device, `w` - watch list, `c` - connect)

**graphical interface**
- download paru-bin (aur helper + wrapper)
- `git clone https://aur.archlinux.org/paru-bin.git` ➜ cd ➜ makepkg -si
- `paru -S xorg-{server, xinity} herbstluftwm kitty ttf-jetbrains-mono-nerd`

**repo**
- `git clone` dots
- `sudo ./script.sh`
- `startx`

**printer [more info](https://unix.stackexchange.com/questions/359531/installing-hp-printer-driver-for-arch-linux)**
1. `paru -S cups` install [cups](https://en.wikipedia.org/wiki/CUPS)
2. `sudo systemctl enable --now cups` enable cups
3. `paru -S hplip` install [hp linux imaging and printing](https://en.wikipedia.org/wiki/HP_Linux_Imaging_and_Printing)
4. `sudo hp-setup -i` install a driver plug-in. during installation of the plug-in, select the default option.
5. `paru -S system-config-printer` install gui tool to configure printers
6. start system-config-printer and click the button to add a printer, select your printer and choose HPLIP as the connection method, it should now allow you to print a test page.

**preferences**
- `flameshot` for screenshots
- `xorg-xrandr` for monitors
- `noto-fonts-cjk` for characters
- `pulseaudio pulseaudio-alsa pavucontrol` for sound

`paru -S noto-fonts{,-cjk,-emoji,-extra} flameshot xorg-xrandr pulseaudio pulseaudio-alsa pavucontrol`

**work with usb devices**
1. `lsblk`
2. `sudo mkdir /mnt/my_pleer` создаем папочку для нашего мышонка
3. `sudo mount /dev/sdbX /mnt/my_pleer` монтируем плеер в папку (монтируем раздел, а не "название флешки"!)
4. `sudo cp (песенки) /mnt/my_pleer` копируем туда песенки
5. `sudo umount /mnt` не забываем анмаунтить
_~little story from my bro <3_

**tar**
- `tar tf` view the content of the archive
- `tar xf` export the content of the archive
- `tar xf 1.zip -C folder` export to a directory
- `tar cf 1.zip photo1 photo2` create an archive with photos
- `tar cf 1.tar.gz photo1 photo2` create the same archive, but in a more native linux format
