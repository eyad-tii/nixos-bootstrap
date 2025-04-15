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
    host-croom = import ./croom;
  };

  flake.nixosConfigurations =
    let
      # make self and inputs available in nixos modules
      specialArgs = {
        inherit self inputs;
      };
    in
    {
      croom = lib.nixosSystem {
        inherit specialArgs;
        modules = [ self.nixosModules.host-croom ];
      };
    };
}
