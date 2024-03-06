{
  description = "Person's hopeful flake.";
  # nix flake update /home/person/nixflakes/
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
#    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    hyprland = { url = "github:hyprwm/hyprland"; };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    eriixpkgs = {
      url = "github:erictossell/eriixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    NixOS-WSL = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
        plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

   # nix-gaming = {
   #   url = "github:fufexan/nix-gaming";
   #   inputs.nixpkgs.follows = "nixpkgs";
   # };

#    nurpkgs = {
#      url = github:nix-community/NUR;
#      inputs.nixpkgs.follows = "nixpkgs";
#    };

#    nix-gaming = {
#      url = "github:fufexan/nix-gaming";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };

#    disko = {
#      url = "github:nix-community/disko";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };

#    nixos-anywhere = {
#      url = "github:numtide/nixos-anywhere";
#      inputs = {
#        nixpkgs.follows = "nixpkgs";
#        disko.follows = "disko";
#      };
#    };

   # flatpaks.url = "github:GermanBread/declarative-flatpak/stable";

   # nixos-hardware.url = "github:NixOS/nixos-hardware/master";
#    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, ... }@attrs:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in {

      nixosConfigurations = {
        # Available by nixos-rebuild [ switch test ] --flake /home/person/nixflakes#person
        person = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "person";
            hostName = "nixos";
            hyprlandConfig = "desktop";
            inherit system;
          } // attrs;
          modules = [
            ./.
            ./modules/hardware/nvidia
            ./modules/plasma
            ./modules/virt
          ];
        }; # Person

        laptop = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          specialArgs = {
            username = "laptop";
            hostName = "nixos";
            hyprlandConfig = "laptop";
            inherit system;
          } // attrs;
          modules = [
            ./minimal.nix
            ./modules/hardware/network
            ./modules/plasma
            ./modules/apps
          ];
        }; # Laptop

        personb = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "personb";
            hostName = "nixos";
            inherit system;
          } // attrs;
          modules = [
            ./.
            ./modules/apps/steam
          ];
        }; # Personb

        live-image = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "live-image";
            hostName = "live";
            hyprlandConfig = "laptop";
            inherit system;
          } // attrs;
          modules = [ ./minimal.nix ];
        }; # Live-image

        winix = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "winix";
            hostName = "eriim";
            inherit system;
          } // attrs;
          modules = [ ./wsl.nix ];
        }; # winix-wsl

        virtualis = let system = "x86_64-linux";
        in nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            username = "virtualis";
            hostName = "eriim";
            inherit system;
          } // attrs;
          modules = [ ./minimal.nix ];
        }; # virtualis

      }; # configurations

      devShells = forAllSystems (system:
        let pkgs = nixpkgsFor.${system};
        in {
          default =
            pkgs.mkShell { buildInputs = with pkgs; [ nixfmt statix ]; };
        });

      templates.default = {
        path = ./.;
        description = "The default template for Eriim's nixflakes.";
      }; # templates

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    };
}
