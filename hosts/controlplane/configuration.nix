# Configuration for the Control Plane
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [
    ./hardware/controlplane-hv/hardware-configuration.nix
    ./modules/packages.nix
    ./modules/bootloader.nix
  ];

  # Add an option to select the hardware configuration
  options = {

    controlplane.hardware-configuration = lib.mkOption { 

      type = lib.types.str;
      default = "hyper-v";
      example = "hyper-v";
      description = "Define the hardware configuration for the Control Plane";

    };

  };

  # Conditionally enable the Hyper-V hardware configuration
  config = lib.mkIf (config.controlplane.hardware-configuration == "hyper-v") {

    controlplane.hardware-configuration.hyper-v.enable = true;

  };

  networking.hostName = "controlplane";

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "24.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}