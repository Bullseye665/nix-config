{ pkgs, username, ... }:
{
  users.users.${username} = {
    packages = with pkgs; [  ];
  };
}


  https://github.com/devdevdany/kde-kcm-grub2
  https://invent.kde.org/system/kcm-grub2
