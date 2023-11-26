{config, pkgs, ...}:
{
  imports = [
    # Programs
    ../components/vim.nix
    ../components/tmux.nix
    ../components/python.nix
    ../components/locate.nix
    ../components/rust.nix
    ../components/git.nix

    # Services
    ../components/cron.nix
    ../components/printing.nix

    # System package groups
    ../components/essentials.nix

    # Configs
    ../components/keyboard.nix
    ../components/audio.nix
    ../components/networking.nix
    ../components/localization.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kaholaz = {
    isNormalUser = true;
    description = "Sebastian Bugge";
    extraGroups = [ "networkmanager" "wheel" "plocate" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
