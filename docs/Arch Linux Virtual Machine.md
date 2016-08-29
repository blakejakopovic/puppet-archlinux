# Provision Arch Linux virtual machine

Note: Please refer to official [Arch Linux installation guide](https://wiki.archlinux.org/index.php/installation_guide) for the latest documentation

#### Setup partitions
```
$ gdisk /dev/sda
# /dev/sda1 _ +500M ef00
# /dev/sda2 _ _ 8300
```

#### Setup filesystems
```
$ mkfs.vfat /dev/sda1
$ mkfs.ext4 /dev/sda2
```

#### Mount partitions
```
$ mount /dev/sda1 /mnt
$ mkdir /mnt/boot
$ mount /dev/sda1 /mnt/boot
```

#### Bootstrap Arch
```
$ pacstrap /mnt base base-devel gptfdisk syslinux git puppet
$ genfstab -U -p /mnt >> /mnt/etc/fstab
$ arch-chroot /mnt
```

#### Set locale preferences
```
$ sed -i -e 's/#en_AU.UTF-8/en_AU.UTF-8/' /etc/locale.gen
$ locale-gen
$ echo LANG=en_AU.UTF-8 > /etc/locale.conf
$ export LANG=en_AU.UTF-8

$ ln -s /usr/share/zoneinfo/Australia/Brisbane /etc/localtime

$ hwclock --systohc --utc
```

#### Install bootloader
```
$ mkinitcpio -p linux
$ syslinux-install_update -i -a -m

# check partitions are correct
$ vi /boot/syslinux/syslinux.cfg
```

#### Set root password
```
$ passwd
```

#### Reboot
```
$ reboot
```
