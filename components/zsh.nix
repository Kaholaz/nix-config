{config, pkgs, ...}:
{
  users.defaultUserShell = pkgs.zsh;
  environment.systemPackages = with pkgs; [
    thefuck
  ];

  programs.zsh = {
    enable = true;
    histSize = 1000000000;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "afowler";
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;


    shellAliases = {
      ll = "ls -l";
      l = "ls -la";
      update = "sudo nixos-rebuild switch";

      cassa = "mosh vsbugge@cassarossa.samfundet.no";
      cirkus = "mosh vsbugge@cirkus.samfundet.no";
      alter = "mosh vsbugge@altersex.samfundet.no";
      navi = "mosh vsbugge@navi.samfundet.no";
      kint = "kinit vsbugge@AD.SAMFUNDET.NO";
    };
  };
}
