{
  description = "NixVim Flake";

  inputs = {
    # include options for the stable pkgs, unstable, and nixos
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {flake-parts, nixvim, ... } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, system, ... }:
      let
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
         checks = {
           # Run `nix flake check .` to verify that your config is not broken
           default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
         };

         packages = {
           # Lets you run `nix run .` to start nixvim
           default = nvim;
         };
      };
    };
}
