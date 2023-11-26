{ environment, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    trash-cli
  ];
  environment.interactiveShellInit = ''
    alias rm='trash'
  '';
}
