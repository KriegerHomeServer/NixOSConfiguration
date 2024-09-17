# Hyper-V Hardware Configuration for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import additional modules
  imports = [ ];

  # Define options for the module
  options = { };

  # Define configuration for the module
  config = {

    boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ]; 

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/f58b50a3-a373-46fb-8dfe-209fe5ee15df"; #feb223ca-0bdb-445d-9058-714c674391f6
      fsType = "ext4";
    };

    swapDevices = [ ];

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    virtualisation.hypervGuest.enable = true;

  };

}