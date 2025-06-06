{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # comms and browsers
    slack
    element-desktop
    zoom-us
    google-chrome

    #TODO needs a fix that is in unstable pipeline
    #minicom
    usbutils

    # Generic code
    cmake
    coreutils
    gnumake
    nodePackages_latest.nodejs
    llvm
    gcc
    nixos-generators
    clang-tools

    #IDE
    vim
    vscode
  ];

  services = {
    ssh-agent.enable = true;
  };
}
