{
  description = "Standard library for icebox";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    nixosModule = (import ./default.nix { lib = nixpkgs.lib; });
  };
}
