{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
   # ferium # not needed prob
    mcpelauncher-ui-qt
   # minecraft # Broken try again
   # lunar-client
    prismlauncher
  ];
}
