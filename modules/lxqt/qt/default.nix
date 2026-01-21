{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
  ];

  qt = {
    enable = true;
    platformTheme = "lxqt";
    style = "kvantum";
  };

  environment.variables = {
    QT_STYLE_OVERRIDE = "kvantum";
    QT_QPA_PLATFORMTHEME = "lxqt";
  };
}
