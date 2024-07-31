# installation

1. make a bootable usb
   - archlinux.org ➜ download ➜ ur country
   - download iso file, sha256sums.txt
   - `sha256sums -c sha256sums.txt` signature check

2. iso to usb
   - `paru -S ventoy-bin`
   - `sudo ventoy -i /dev/sdb`
   - `sudo mount /dev/sdb1 /mnt`
   - `cp {file}.iso /mnt`
   - `sudo umount /mnt`

3. bios
   - reboot + f2
   - boot: change order

4. details*
   - rmmod pcspkr
   - setfont ter-132n

5. internet (wifi/ethernet)
   - ip a

6. disk layout
   - `lsblk` to see disk layout
   - `fdisk /dev/sda`
   - `g` - create empty gpt disk, `n` - new, `w` - write
   - 1 - +1G. 2 - (enter)
   - `fdisk /dev/sda` ➜ g ➜ n ➜ enter ➜ enter ➜ +1G ➜ .. ➜ n ➜ enter ➜ enter ➜ enter .. ➜ w
   - create files systems
   - `mkfs.fat -F32 /dev/sda1`
   - `mkfs.ext4 /dev/sda2`
   - mount file systems
   - `mount mount /dev/sda2 /mnt`
   - `mount -m /dev/sda1 /mnt/boot`

7. packages installation
   - `pacstrap /mnt linux linux-firmware base base-devel networkmanager grub efibootmgr fish helix

   - `cp /usr/share/kbd/console-fonts/ter-132n /mnt/usr/share/kbd/consolefonts`

8. disk layout 2
   - `genfstab -U /mnt`
   - `genfstab -U /mnt > /mnt/etc/fstab`
   - `arch-chroot /mnt`
   - `fish`

   - `echo "comp" > /etc/hostname`
   - `useradd -mG wheel -s $(which fish) brb`
   - `passwd` for root
   - `passwd brb`
   - visudo
   - `EDITOR=helix visudo`(uncomment last paragraph to allow members of wheel to execite any command)
   - echo blacklist pcspkr > /etc/modprobe.d/nobeep.conf

9. grub
    - `grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot`
    - `grub-mkconfig -o /boot/grub/grub.cgf`
  
    - go out of chroot, fish (ctrl D * 2)

    - umount -R /mnt
    - shutdown now

# postinstallation

## printer
1. `paru -S cups` install [cups](https://en.wikipedia.org/wiki/CUPS)
2. `sudo systemctl enable --now cups` enable cups
3. `paru -S hplip` install [hp linux imaging and printing](https://en.wikipedia.org/wiki/HP_Linux_Imaging_and_Printing)
4. `sudo hp-setup -i` install a driver plug-in. during installation of the plug-in, select the default option.
5. `paru -S system-config-printer` install gui tool to configure printers
6. start system-config-printer and click the button to add a printer, select your printer and choose HPLIP as the connection method, it should now allow you to print a test page.

## preferences

- `flameshot` for screenshots
- `xorg-xrandr` for monitors
- `noto-fonts-cjk` for characters
- `paru -S pulseaudio pulseaudio-alsa pavucontrol` for sound

`paru -S noto-fonts{,-cjk,-emoji,-extra} flameshot xorg-xrandr`

## lsblk

1. создаем папочку для нашего мышонка:
`sudo mkdir /mnt/my_pleer`
2. монтируем плеер в папку (монтируем раздел, а не "название флешки"!)
`sudo mount /dev/sdbX /mnt/my_pleer_bitch`
3. копируем туда песенки 
`sudo cp (песенки) /mnt/my_pleer`
4. незабываем анмаунтить
`sudo umount /mnt`

## wifi

nmtui
nmcli device wifi show-password
nmcli --help
nmcli r wifi on

## tar
в фише пишешь алиас tar <--> bsdtar (tar от BSD лучше чем от GNU)

tar tf -- посмотреть содержимое архива
tar xf -- экспортировать
tar xf 1.zip -C folder -- экспортировать в папку

tar cf 1.zip photo1 photo2 -- создать архив с фотками
tar cf 1.tar.gz photo1 photo2 -- создать такой же архив, только в более родном линуксу формате
