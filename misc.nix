{ config, lib, ... }:
with lib;

let
  cfg = config.std.misc;
  tryRestartCommand = n: ''
    ${config.systemd.package}/bin/systemctl try-restart ${n}
  '';
  serviceResumeCommands = l:
    (lists.foldr (a: b: a + b) "" (lists.forEach l (x: tryRestartCommand x)));
in {
  options.std.misc = {
    restartOnResumeServices = mkOption {
      type = with types; nullOr (listOf str);
      default = null;
      description =
        "Names of the services to restart on resume if they are already running. Appended at the end.";
    };
  };

  config = {
    powerManagement.resumeCommands =
      optionalString (cfg.restartOnResumeServices != null)
      (mkAfter (serviceResumeCommands cfg.restartOnResumeServices));
  };
}
