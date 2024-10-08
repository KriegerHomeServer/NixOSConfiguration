# NFS configuration for a k3s cluster node
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

    # Description: Define configuration for the NFS server
    # Type: Attribute Set
    services.nfs.server = {

      # Description: Whether to enable the kernel’s NFS server
      # Type: Boolean
      enable = true;

      # Description: Use a fixed port for rpc.statd
      # Type: Number
      statdPort = 4000;

      # Description: Use a fixed port for the NFS lock manager kernel module (lockd/nlockmgr)
      # Type: Number
      lockdPort = 4001;

      # Description: Use fixed port for rpc.mountd
      # Type: Number
      mountdPort = 4002;

      # Description: Contents of the /etc/exports file
      # Type: String
      exports = ''
        /export               127.0.0.1(rw,fsid=0,no_subtree_check)          192.168.0.201(ro,fsid=0,no_subtree_check)
        /export/kubernetes    127.0.0.1(rw,nohide,insecure,no_subtree_check) 192.168.0.201(ro,nohide,insecure,no_subtree_check)
      '';

    };

    # Description: Rules for creation, deletion and cleaning of volatile and temporary files automatically
    # Type: List of Strings
    systemd.tmpfiles.rules = [
      "d /export/kubernetes 0777 nobody nogroup"
    ];

    # Description: Define configuration for the firewall
    # Type: Attribute Set
    networking.firewall = {

      # Description: List of TCP ports on which incoming connections are accepted
      # Type: List of Numbers
      allowedTCPPorts = [ 111 2049 4000 4001 4002 20048 ];

      # Description: List of UDP ports on which incoming connections are accepted
      # Type: List of Numbers
      allowedUDPPorts = [ 111 2049 4000 4001 4002 20048 ];

    };

  };

}