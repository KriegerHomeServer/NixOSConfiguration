# Hardware configuration for a Hyper-V guest
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

    boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ]; 

    virtualisation.hypervGuest.enable = true;

  };

}