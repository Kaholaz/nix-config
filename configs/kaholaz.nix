{config, pkgs, environment, ...}:
{
  imports = [
    # Programs
    ../components/vim.nix
    ../components/tmux.nix
    ../components/python.nix
    ../components/locate.nix
    ../components/rust.nix
    ../components/git.nix
    ../components/trash-cli.nix
    ../components/zsh.nix

    # Services
    ../components/printing.nix

    # Configs
    ../components/keyboard.nix
    ../components/networking.nix
    ../components/localization.nix
  ];

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kaholaz = {
    isNormalUser = true;
    description = "Sebastian Bugge";
    extraGroups = [ "networkmanager" "wheel" "plocate" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
