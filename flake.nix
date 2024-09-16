{
  description = "NixVim Flake";

  inputs = {
    # include options for the stable pkgs, unstable, and nixos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixvim, ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = inputs.nixpkgs.lib;
    pkgs = import inputs.nixpkgs {
      inherit system;
    };

    nixvimLib = nixvim.lib.${system};
    nixvim' = nixvim.legacyPackages.${system};
    nixvimModule = {
      inherit pkgs;
      module = import ./config; # import the module directly
      # You can use `extraSpecialArgs` to pass additional arguments to your module files

      extraSpecialArgs = {
        # inherit (inputs) foo;
      };
    };
    nvim = nixvim'.makeNixvimWithModule nixvimModule;

    in {
       packages.${system} = {
         # Lets you run `nix run .` to start nixvim
         default = nvim;
         nvim = nvim;
       };
    };
}
