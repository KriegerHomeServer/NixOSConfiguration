# Hyper-V Hardware Configuration for the Control Plane
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [ ];

  # Add an option to enable the hardware configuration
  options = {
    
    controlplane.hardware-configuration.hyper-v.enable = lib.mkEnableOption "Enable the Hyper-V hardware configuration for the Control Plane";

  };

  # Define the hardware configuration
  config = lib.mkIf config.controlplane.hardware-configuration.hyper-v.enable {

    boot.initrd.availableKernelModules = [ "ata_piix" "floppy" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ]; 

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    virtualisation.hypervGuest.enable = true;

  };

}