{ pkgs, lib, ... }:
{
  home.file.".ssh/allowed_signers".text = "${builtins.readFile ../../users/ssh-keys.txt}";

  programs = {
    git = {
      #package = pkgs.gitAndTools.gitFull;
      enable = true;
      settings = {
        user = {
          name = "Eyad Shaklab";
          email = "eyad.shaklab@tii.ae";
        };

        aliases = {
          checkout-pr = "!pr() { git fetch origin pull/$1/head:pr-$1; git checkout pr-$1; }; pr";
          pick-pr = "!am() { git fetch origin pull/$1/head:pr-$1; git cherry-pick HEAD..pr-$1; }; am";
          reset-pr = "reset --hard FETCH_HEAD";
        };

        color.ui = "auto";
        checkout.defaultRemote = "origin";
        format.signoff = true;
        commit.gpgsign = true;
        tag.gpgSign = true;
        gpg.format = lib.mkDefault "ssh";
        user.signingkey = "~/.ssh/github-key.pub";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
        init.defaultBranch = "main";
        pull.rebase = "true";
        push.default = "current";
        github.user = "eyad-tii";
      };

      ignores = [
        "*~"
        "*.swp"
        ".worktrees/"
      ];

      signing = {
        format = "ssh";
        signByDefault = true;
      };
    };

    delta = {
      enable = true; # see diff in a new light
      options = {
        line-numbers = true;
        side-by-side = true;
        syntax-theme = "Dracula";
      };
    };

    gh = {
      enable = true;
      extensions = with pkgs; [
        gh-poi
        gh-eco
        gh-dash
        gh-markdown-preview
        gh-f
        github-copilot-cli
      ];
    };

    git-worktree-switcher = {
      enable = true;
      enableBashIntegration = true;
      package = pkgs.git-worktree-switcher;
    };
  };
}
