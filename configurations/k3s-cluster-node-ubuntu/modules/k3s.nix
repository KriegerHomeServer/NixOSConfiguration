# K3S configuration for a k3s cluster node
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

    # Description: Define configuration for the firewall
    # Type: Attribute Set
    networking.firewall = {

      # Description: A range of TCP ports on which incoming connections are accepted
      # Type: List of Attribute Sets
      allowedTCPPortRanges = [ { from = 16000; to = 16100; } ];

      # Description: A range of UDP ports on which incoming connections are accepted
      # Type: List of Attribute Sets
      allowedUDPPortRanges = [ { from = 16000; to = 16100; } ];

    };

    # Description: Define configuration for the k3s service
    # Type: Attribute Set
    services.k3s = {

      # Description: Whether to enable k3s
      # Type: Boolean
      enable = true;

      # Description: Whether k3s should run as a server or agent
      # Type: String
      role = "server";

      # Description: Initialize HA cluster using an embedded etcd datastore
      # Type: Boolean
      clusterInit = true;

      # Description: Extra flags to pass to the k3s command
      # Type: String
      extraFlags = "--write-kubeconfig-mode 0644 --disable servicelb --disable traefik --disable local-storage --cluster-init";
    
      # Description: Auto-deploying manifests that are linked to /var/lib/rancher/k3s/server/manifests before k3s starts
      # Type: List of Attribute Sets
      manifests = {

        # Description: The source of the nfs-provisioner manifest
        # Type: Path
        nfs-provisioner.source = ../files/manifests/nfs-provisioner.yaml;

        # Description: The source of the metallb manifest
        # Type: Path
        metallb.source = ../files/manifests/metallb.yaml;

        # Description: The source of the headlamp manifest
        # Type: Path
        headlamp.source = ../files/manifests/headlamp.yaml;

        # Description: The source of the argocd manifest
        # Type: Path
        argocd.source = ../files/manifests/argocd.yaml;

      };

    };

  };

}