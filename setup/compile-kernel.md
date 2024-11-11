# Compiling Different Versions of Kernel

From this [article](https://itsfoss.com/compile-linux-kernel/).

## Dependencies

Arch:

``` bash
sudo pacman -S base-devel bc coreutils cpio gettext initramfs kmod libelf ncurses pahole perl python rsync tar xz
```

Debian-based:

``` bash
sudo apt install bc binutils bison dwarves flex gcc git gnupg2 gzip libelf-dev libncurses5-dev libssl-dev make openssl pahole perl-base rsync tar xz-utils
```

Fedora-Like Distros:

``` bash
sudo dnf install binutils ncurses-devel \
    /usr/include/{libelf.h,openssl/pkcs7.h} \
    /usr/bin/{bc,bison,flex,gcc,git,gpg2,gzip,make,openssl,pahole,perl,rsync,tar,xz,zstd}
```

## Get Kernel

Download desired kernel version from [releases](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/refs/tags?h=v6.12-rc7). Eg with curl:

``` bash
curl -L https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.6.tar.gz > linux-6.6.tar.gz
```
Extract tar and enter into directory eg:

``` bash
tar -xf linux-6.6.tar.gz
cd linux-6.6
```

## Setup Config

Grab Linux config from current distro:

``` bash
## Debian and Fedora's derivatives:
$ cp /boot/config-"$(uname -r)" .config

## Arch Linux and its derivatives:
$ zcat /proc/config.gz > .config
```

Update config:

``` bash
make olddefconfig
```

On Debian:

``` bash
./scripts/config --file .config --disable MODULE_SIG
```

## Build Kernel

Add tag:

``` bash
./scripts/config --file .config --set-str LOCALVERSION "-custom"
```

Build kernel:

``` bash
make -j$(nproc) 2>&1 | tee log
```

## Install kernel modules

``` bash
sudo make modules_install -j$(nproc)
```

## Install kernel headers

``` bash
sudo make headers_install
```

## Install kernel

For non-Arch:

``` bash
sudo make install
```

For arch, where `<kernel_release>` is the version installed (ie. 6.6) and `<localversion>` is tag (ie. custom):

``` bash
sudo install -Dm644 "$(make -s image_name)" /boot/vmlinuz-<kernel_release>-<localversion> # template
sudo install -Dm644 "$(make -s image_name)" /boot/vmlinuz-6.6-custom # my example
```

Copy config and System.map:

``` bash
sudo cp -vf System.map /boot/System.map-<kernel_release>-<localversion> # template
sudo cp -vf System.map /boot/System.map-6.6-custom # my example
sudo cp -vf .config /boot/config-<kernel_release>-<localversion> # template
sudo cp -vf .config /boot/config-6.6-custom # my example
```

## Generate init ramdisk

Edit `/etc/mkinitcpio.d/linux-<kernel_release>-<localversion>.preset`, replace `<localversion>` and `<kernel_release>`:

``` conf
ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-<kernel_release>-<localversion>"

PRESETS=('default' 'fallback')

default_image="/boot/initramfs-<kernel_release>-<localversion>.img"
fallback_options="-S autodetect"
```

My example, file called `/etc/mkinitcpio.d/linux-6-6-custom.preset`, note that in `<kernel_release>` I don't use `6.6` instead I use `6-6` just in case. File content:

``` conf
ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-6.6-custom"

PRESETS=('default' 'fallback')

default_image="/boot/initramfs-6.6-custom.img"
fallback_options="-S autodetect"
```

## Update Bootloader

Grub:

``` bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

For other boot-loaders, check their wiki (eg. [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot) need to add entries).

## Boot into kernel

Reboot, choose correct kernel version in boot menu. Check with `uname -r`.
