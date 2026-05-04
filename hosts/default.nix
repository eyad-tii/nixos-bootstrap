# SPDX-License-Identifier: Apache-2.0
{
  inputs,
  self,
  lib,
  ...
}:
{
  flake.nixosModules = {
    # shared modules
    common-client = import ./common.nix;

    # host modules
    host-eyad-x1 = import ./eyad-x1;
  };

  flake.nixosConfigurations =
    let
      # make self and inputs available in nixos modules
      specialArgs = {
        inherit self inputs;
      };
    in
    {
      eyad-x1 = lib.nixosSystem {
        inherit specialArgs;
        modules = [ self.nixosModules.host-eyad-x1 ];
      };
    };
}
