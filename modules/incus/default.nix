{ config, lib, username, ... }:
# This uses a modified standard lib that includes a `my` field for my-setup-specific values.
with lib;


let
  # For this config, for easier reference
  cfg = config.my.services.incus;
  # Module option `dataDir` is the root dir, so we expand it a bit to get the storage pool dir
  # Down the line I might need more than one
  defaultStoragePoolDir = "${cfg.dataDir}/storage-pools/default";
in
{
  # Here we define the available options consumers of this module can set
  options.my.services.incus = with lib.types; {
    enable = mkEnableOption "incus";

    # I place all my data in `/var`, so incus gets a place there too
    dataDir = mkOption {
      type = path;
      default = "/var/incus";
    };

    # The LISTEN address for the UI
    uiAddress = mkOption {
      type = str;
      default = "127.0.0.1";
    };

    # And its corresponding port
    uiPort = mkOption {
      type = int;
      default = 8443;
    };

    # The domain name to use
    # Don't forget to create this domain name on your router or wherever you create those
    domain = mkOption {
      type = str;
      default = "incus.${my.domain}"; # expands to something like `incus.example.com`
    };

    # The network Incus will use for containers
    # We'll create a bridge, so a `br` is in the name
    networkName = mkOption {
      type = str;
      default = "incusbr0";
    };
  };

  # Apply config only if the module is enabled
  config = mkIf cfg.enable {
    virtualisation.incus = {
      enable = true;
      ui.enable = true;
      preseed =
        let
          poolName = "default";
        in
        {
          config = {
            # Where the UI will listen on
            "core.https_address" = "${cfg.uiAddress}:${toString cfg.uiPort}";
          };
          networks = [
            {
              # VMs and containers will have IPs in the 10.10.10.X network
              config = {
                "ipv4.address" = "192.168.0.1/24";
                "ipv4.nat" = "true";
              };
              # Name the network
              name = cfg.networkName;
              # Specify its type
              type = "bridge";
            }
          ];
          # The profiles are the default settings for containers
          profiles = [
            {
              # Name this profile
              name = "default";
              devices = {
                # The network that will get attached to our container, that will use our bridge
                eth0 = {
                  name = "eth0";
                  network = cfg.networkName;
                  type = "nic";
                };
                # Create a disk mounted at root, using the 'default' pool (created below)
                root = {
                  path = "/";
                  pool = poolName;
                  type = "disk";
                };
              };
            }
          ];
          # Define the data pool, with the 'dir' driver, meaning it's just a directory at 'config.source'
          storage_pools = [
            {
              config.source = defaultStoragePoolDir;
              driver = "dir";
              name = poolName;
            }
          ];
        };
    };

    # Add my user to these groups so that it can use and configure Incus
    users.users.${username} = {
      extraGroups = [
        "incus"
        "incus-admin"
      ];
    };

    # As per the Wiki, Incus only works with nftables, so we enable that
    networking.nftables.enable = true;
    # And set the bridge to be trusted to allow traffic on this interface
    networking.firewall.trustedInterfaces = [ cfg.networkName ];

    # Create the folder if it does not exist
    systemd.tmpfiles.rules = [
      "d ${defaultStoragePoolDir} 750 root root"
    ];
  };
}
