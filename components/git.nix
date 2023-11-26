{programs, ...}: {
  programs.git = {
    enable = true;

    config = {
      user.name = "Sebastian Bugge";
      user.email = "vkbugge@hotmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      push.autoSetupRemote = true;
    };
  };
}
