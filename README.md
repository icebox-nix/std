# std
Standard library for icebox

# What is it?
It is a "standard library" for icebox plugins. User set value in it for plugins to use. Mainly, it is used to describe device and contain system-wide information (like preferred DPi) to share in a inter-plugin way.

# How to use it?
Code your `configuration.nix` like this
```nix
let
  std  = builtins.fetchurl "https://github.com/icebox-nix/std/raw/master/std.nix";
in {
  # Other parts omitted
  icebox = {
    # Other parts omitted
	 lib = {
       modules = [ (import "${std}" { lib = lib; }) ];
       configs = {
         # Other parts omitted
	 };
  };
}
```
