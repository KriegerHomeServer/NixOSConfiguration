# System configuration for a k3s cluster node
{ config, lib, pkgs, modulesPath, inputs, ... }: {

  # Description: Import additional modules
  # Type: List of paths
  imports = [ ];

  # Description: Define options for the module
  # Type: Attribute Set
  options = { };

  # Description: Define configuration for the module
  # Type: Attribute Set
  config = {

    # Description: The time zone used when displaying times and dates
    # Type: Null or String
    time.timeZone = "America/New_York";

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