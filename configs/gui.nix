{ environment, pkgs, ... } : 
{
  imports = [
    ../components/gnome.nix
  ];

  environment.systemPackages = with pkgs; [
    # firefox # Crashes on github.com
    discord
    brave
  ];
}
