{ environment, pkgs, ... } : 
{
  imports = [
    ../components/gnome.nix
    ../components/audio.nix
  ];

  environment.systemPackages = with pkgs; [
    # firefox # Crashes on github.com
    discord
    brave
  ];
}
