{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    libinput.mouse.accelProfile = "flat";
    displayManager.gdm = {
      enable = true;
      wayland = false;
    };
    desktopManager.gnome = {
      enable = true;
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-calculator
    yelp # help viewer
    gnome-maps
    gnome-weather
    gnome-contacts
    simple-scan
  ]);
}
