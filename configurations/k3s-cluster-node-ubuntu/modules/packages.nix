# Packages configuration for a k3s cluster node
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

    # Description: Global configuration for Nixpkgs
    # Type: Attribute Set
    nixpkgs = {

      # Description: Global configuration for Nixpkgs
      # Type: Attribute Set
      config = {

        # Description: Whether to allow unfree packages
        # Type: Boolean
        allowUnfree = false;
      
      };

    };

    # Description: The set of packages that appear in /run/current-system/sw
    # Type: List
    environment.systemPackages = with pkgs; [

      git
      k3s
      wget
      kubernetes-helm
      argocd
      openssh

    ];

    # Description: List of primary font packages
    # Type: List
    fonts.packages = with pkgs; [

    ];

  };

}