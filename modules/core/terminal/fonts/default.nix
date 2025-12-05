{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      (callPackage (import ./MplusCodeNerdFont) { })
     # nerd-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      roboto
    ];
    fontconfig.defaultFonts = {
      serif = [ "Roboto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Roboto" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
