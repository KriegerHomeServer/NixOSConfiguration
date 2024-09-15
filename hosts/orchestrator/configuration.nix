# Configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [
    ./hardware/orchestrator-hv/hardware-configuration.nix
    ./modules/packages.nix
    ./modules/bootloader.nix
  ];

  # Add an option to select the hardware configuration
  options = {

    orchestrator.hardware-configuration = lib.mkOption { 

      type = lib.types.str;
      default = "hyper-v";
      example = "hyper-v";
      description = "Define the hardware configuration for the Orchestrator";

    };

  };

  # Conditionally enable the Hyper-V hardware configuration
  config = lib.mkIf (config.orchestrator.hardware-configuration == "hyper-v") {

    orchestrator.hardware-configuration.hyper-v.enable = true;

  };

  # Define the system configuration
  networking.hostName = "orchestrator";

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "24.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}