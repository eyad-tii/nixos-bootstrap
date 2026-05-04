{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # comms and browsers
    slack
    element-desktop
    zoom-us
    firefox
    google-chrome

    # Development
    #minicom
    usbutils

    # Generic code
    cmake
    coreutils
    gnumake
    nodejs
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
