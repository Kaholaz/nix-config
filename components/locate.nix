{services, pkgs, ...}:
{
  services.locate = {
    enable = true;
    locate = pkgs.plocate;
    interval = "daily";
    localuser = null;
  };
}
