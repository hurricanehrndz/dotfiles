# NixOS

## References

-   https://discourse.nixos.org/t/filesystem-choices/1865/3
-   https://discourse.nixos.org/t/github-strategies-for-configuration-nix/1983/11

This is just an outline for now, and will get cleaned up later.

```sh
mkfs.btrfs -f /dev/vda3
btrfs suvbol create
mount -o compress=zstd,noatime,nodiratime /dev/vda3 /mnt
btrfs subvol create /mnt/@
btrfs subvol create /mnt/@nix-stroe # mount @ /mnt/nix/store
btrfs subvol create /mnt/@nix-var # mount @ /mnt/nix/var <- databases
btrfs subvol create /mnt/@var

chattr +C /mnt/@nix-var # disable CoW for databases
chattr +C /mnt/@var

btrfs subvol set-default 256 /mnt
umount /mnt
mount -o compress=zstd,noatime,nodiratime /dev/vda3 /mnt
mount /dev/vda1 /mnt/boot
mount /dev/vda2 /mnt/home
mkdir -p /mnt/{home,boot,nix/store,nix/var,var}
mount -o subvol=@nix-store,compress=zstd,noatime,nodiratime /dev/vda3 /mnt/nix/store
mount -o subvol=@nix-var,compress=zstd,noatime,nodiratime /dev/vda3 /mnt/nix/var
mount -o subvol=@var,compress=zstd,noatime,nodiratime /dev/vda3 /mnt/var
```
