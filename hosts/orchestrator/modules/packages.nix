# Module defining the packages for the Orchestrator
{ config, lib, pkgs, modulesPath, ... }: {

  # Import other modules
  imports = [ ];

  # Define no options
  options = {

  };

  # Define the packages configuration
  config = {

    # Disable unfree packages
    nixpkgs.config = {
      allowUnfree = false;
    };

    # Define the packages
    environment.systemPackages = with pkgs; [

      git
      wget

    ];

    # Define the fonts
    fonts.packages = with pkgs; [

    ];

  };

}