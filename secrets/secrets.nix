let
  person = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ/jmYGw8gSvk/8/MitmJLAlZhES4JhvCYWmhf8OuPav";
  nix-master = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFUDWATOlPmMP6gh9C8rA5I/o/yP4HrtqjidvaoM9ML4";
  security = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8+r8XOJk8mpMIJHbdvQ7VOoWw66MhV4dA0GAMpj5PR";
  userland = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG6q5hwAoyCQE1nRCtKDHIztdtF4jf+leCgZIrb2fEoJ";
  users = [ person nix-master security userland ];

  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBUGvDDxjpSuBb5BaS62E08A+hqMdRtUxfKlC5S4lPX1";
  lesser = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFAIWFUr0N4RNpR7L1zjVZEVBQ3iWjC5PGEWUSNCSiJR"
  systems = [ nixos lesser ];

in
{
  "generic.age".publicKeys = [ person nixos ];
  "nix-master.age".publicKeys = [ nix-master lesser ];
  "security.age".publicKeys = [ security lesser ];
  "userland.age".publicKeys = [ userland lesser ];
}
