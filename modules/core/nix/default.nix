{ home-manager, pkgs, username, version, ... }: {
  # https://github.com/lovesegfault/nix-config/blob/e412cd01cda084c7e3f5c1fbcf7d99665999949e/core/nixos.nix
  system = {
    systemBuilderCommands = ''
      ln -sv ${pkgs.path} $out/nixpkgs
    '';
    stateVersion = "${version}";
  };

  nix = {
    nixPath = [ "nixpkgs=/run/current-system/nixpkgs" ];
    settings.experimental-features = [ "nix-command" "flakes" ];
 #   channel.enable = false;
  };

  home-manager.users.${username} = {
    home.stateVersion = "${version}";
    nixpkgs.config.allowUnfree = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
