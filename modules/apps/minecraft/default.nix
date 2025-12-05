{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
   # ferium # not needed prob
   # mcpelauncher-ui-qt # Need Google play store version to use
   # minecraft # Broken try again
   # lunar-client
    prismlauncher
  ];
}
