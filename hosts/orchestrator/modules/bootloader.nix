# Module defining the bootloader for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [ ];

  # Define no options
  options = {

  };

  # Define the packages configuration
  config = {

    boot.loader = {

      # Enable GRUB as the bootloader
      grub = {

        enable = true;
        useOSProber = true;
        device = "/dev/sda";
        efiSupport = true;

      };

    };

  };

}