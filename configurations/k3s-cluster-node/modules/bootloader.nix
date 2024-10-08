# Bootloader configuration for a k3s cluster node
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

    # Description: Define options for the bootloader
    # Type: Attribute Set
    boot.loader = {

      # Description: Define options for the GRUB bootloader
      # Type: Attribute Set
      grub = {

        # Description: Whether to enable the GNU GRUB boot loader
        # Type: Boolean
        enable = lib.mkForce true;

        # Description: If set to true, append entries for other OSs detected by os-prober.
        # Type: Boolean
        useOSProber = true;

      };

    };

  };

}