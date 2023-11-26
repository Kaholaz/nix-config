{services, programs, console, lib, ...}:
{
  services.xserver = { 
    xkbOptions = "caps:escape";
    layout = "us";
    xkbVariant = "mac";
  };

  # Configure console keymap
  console = {
    keyMap = lib.mkForce "no";
    useXkbConfig = true;
  };

  # Sound control
  sound.mediaKeys.enable = true;
}
