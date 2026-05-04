{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt
    cachix
    wget
    curl
    git
    htop
    nix-info
    tree
    file
    binutils
    lsof
    dnsutils
    netcat
    nix-tree
  ];
}
