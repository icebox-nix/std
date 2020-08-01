{
  description = "Standard library for icebox";
  outputs = { ... }: { nixosModule = (import ./default.nix); };
}
