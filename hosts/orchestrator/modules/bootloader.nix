# Module defining the bootloader for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [ ];

  # Define no options
  options = {

  };

  # Define the packages configuration
  config = {

    # Description: Define options for the bootloader
    # Type: Attribute Set
    boot.loader = {

      # Description: Define options for the GRUB bootloader
      # Type: Attribute Set
      grub = {

        # Description: Whether to enable the GNU GRUB boot loader
        # Type: Boolean
        enable = true;

        # Description: If set to true, append entries for other OSs detected by os-prober.
        # Type: Boolean
        useOSProber = true;

        # Description: The device on which the GRUB boot loader will be installed
        # Type: String
        device = "/dev/sda";

      };

    };

  };

}