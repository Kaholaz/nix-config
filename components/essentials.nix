{environment, pkgs, programs, ...}:
{
  environment.systemPackages = with pkgs; [
    htop
    mosh
    killall
    wget
    curl
    dig
    fd
    ripgrep
  ];

  programs.command-not-found.enable = true;
}
