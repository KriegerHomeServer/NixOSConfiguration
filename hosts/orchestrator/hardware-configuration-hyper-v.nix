# Hyper-V Hardware Configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [ ];

  # Define the options for the hardware configuration
  options = {
    
  };

  # Define the hardware configuration
  config = {

    boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ]; 

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/f58b50a3-a373-46fb-8dfe-209fe5ee15df";
      fsType = "ext4";
    };

    swapDevices = [ ];

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    virtualisation.hypervGuest.enable = true;

  };

}