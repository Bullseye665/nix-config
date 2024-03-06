{ pkgs, home-manager, username, ... }: {
  imports = [
    ./bash
    ./cava
    ./fonts
    ./foot
    ./kitty
    ./nvim
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
    htop.enable = true;  # Terminal resource monitor
    mtr.enable = true;   # Network diagnostics tool
  };

  environment.systemPackages = with pkgs; [
    brightnessctl # Brightness control
    gh
    todoist
    unzip
    wget
    vim
  ];
}
