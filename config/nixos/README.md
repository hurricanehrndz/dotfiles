# NixOS

## References

-   https://discourse.nixos.org/t/filesystem-choices/1865/3
-   https://discourse.nixos.org/t/github-strategies-for-configuration-nix/1983/11
-   https://discourse.nixos.org/t/opening-i3-from-home-manager-automatically/4849/7
-   https://nixos.wiki/wiki/Using_X_without_a_Display_Manager

This is just an outline for now, and will get cleaned up later.

```sh
# Partitions should be formatted at this point
# If re-install reuse UUID via mkfs.btrfs -U or mkfs.vfat -i
# Change these
ROOT_UUID=36654621-7953-402b-a48a-dc06f1b42455
HOME_UUID=f25d953a-86a1-4f85-a063-316a4481569b
BOOT_UUID=568A-91D4

# Prepare BTRFS file system
partprobe
mount -o compress=zstd,noatime,nodiratime UUID=$ROOT_UUID /mnt
btrfs subvol create /mnt/@
btrfs subvol create /mnt/@nix-store # mount @ /mnt/nix/store
btrfs subvol create /mnt/@nix-var # mount @ /mnt/nix/var <- databases
btrfs subvol create /mnt/@var
chattr +C /mnt/@nix-var # disable CoW for databases
chattr +C /mnt/@var
# Set @ as the default subvolume
btrfs subvol set-default 256 /mnt
umount /mnt

# Remount BTRFS to mount subvolume @
mount -o compress=zstd,noatime,nodiratime UUID=$ROOT_UUID /mnt

# Make required directories in root subvol
mkdir -p /mnt/{home,boot,nix/store,nix/var,var}

# Mount filesystems
mount UUID=$BOOT_UUID /mnt/boot
mount UUID=$HOME_UUID /mnt/home
mount -o subvol=@nix-store,compress=zstd,noatime,nodiratime UUID=$ROOT_UUID /mnt/nix/store
mount -o subvol=@nix-var,compress=zstd,noatime,nodiratime UUID=$ROOT_UUID /mnt/nix/var
mount -o subvol=@var,compress=zstd,noatime,nodiratime UUID=$ROOT_UUID /mnt/var

# Generate dummy config
nixos-generate-config --root /mnt

# Get dotfiles and real nix configuration
mkdir -p /mnt/home/hurricanehrndz/.config/dotfiles
chown -R 1000:100 /mnt/home/hurricanehrndz
git clone https://github.com/hurricanehrndz/dotfiles.git /mnt/home/hurricanehrndz/.config/dotfiles
ln -sf /mnt/home/hurricanehrndz/.config/dotfiles/config/nixos/hosts/markv/configuration.nix /mnt/etc/nixos/configuration.nix

# Install NixOS
nixos-install --root /mnt
# Set user password
nixos-enter --root /mnt
passwd hurricanehrndz
```
