{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    xemu                # Xbox
    xenia-canary        # Xbox 360
  ];
}
