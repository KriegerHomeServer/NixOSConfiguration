# System configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Import additional modules
  imports = [ ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = {

    # Description: The time zone used when displaying times and dates
    # Type: Null or String
    time.timeZone = "America/Chicago";

    # Description: The default locale.
    # Type: String
    i18n.defaultLocale = "en_US.UTF-8";

    # Description: Defines the first version of NixOS you have installed on this particular machine
    # Type: String
    system.stateVersion = "24.05";

    # Description: Enable experimental features
    # Type: List
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  };

}