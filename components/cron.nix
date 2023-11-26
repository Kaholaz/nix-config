{pkgs, services, ...}:
{
  # Enable cron service
  services.cron = {
    enable = true;
  };
}
