{ pkgs, home-manager, username, ... }: {
  imports = [
    ./bash
    ./cava
    ./fonts
    ./foot
    ./kitty
#    ./nvim
    ./starship
    ./tmux
  ];

  # ---- Home Configuration ----
  home-manager.users.${username} = {
    programs.git.enable = true;
    programs.vim.enable = true;
  };

  # ---- System Configuration ----
  programs = {
    mtr.enable = true;   # Network diagnostics tool
  };

  environment.systemPackages = with pkgs; [
    brightnessctl # Brightness control
    btop
    gh
    todoist
    unzip
    wget
    vim
  ];
}
