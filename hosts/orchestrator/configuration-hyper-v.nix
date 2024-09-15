# Configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [
    ./hardware-configuration-hyper-v.nix
    ./modules/packages.nix
    ./modules/bootloader.nix
  ];

  # Define the options for the Orchestrator
  options = {

  };

  # Define the system configuration
  config = {

    networking.hostName = "orchestrator";

    time.timeZone = "America/Chicago";

    i18n.defaultLocale = "en_US.UTF-8";

    system.stateVersion = "24.05";

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  };

}