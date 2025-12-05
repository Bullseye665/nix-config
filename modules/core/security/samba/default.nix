{ pkgs, ... }: {
services.samba.package = pkgs.sambaFull; # https://nixos.wiki/wiki/Samba

}
