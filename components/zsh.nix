{config, pkgs, ...}:
{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    thefuck
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      l = "ls -la";
      update = "sudo nixos-rebuild switch";
    };
    histSize = 1000000000;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "afowler";
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}
