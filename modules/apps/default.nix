{ pkgs, home-manager, username, ... }: {
  imports = [
   # ./1password
   # ./bitwarden
   # ./browser
#    ./git
#    ./gpg
    ./libreoffice
   # ./obs
   # ./obsidian
    ./steam
    ./spotify
   # ./transmission
    ./vscode
  ];
}
