# Network configuration for a k3s cluster node
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

    # Description: Define networking configuration
    # Type: Attribute Set
    networking = {

      # Description: The name of the machine
      # Type: String matching pattern ^$|^[[:alnum:]]([[:alnum:]_-]{0,61}[[:alnum:]])?$
      hostName = "control-plane";

      # Description: Whether to enable the firewall
      # Type: Boolean
      firewall.enable = true;

      # Description: Whether to use DHCP to obtain an IP address and other configuration for all network interfaces that do not have any manually configured IPv4 addresses
      # Type: Boolean
      useDHCP = true;

    };

    # Description: Define configuration for the openssh service
    # Type: Attribute Set
    services.openssh = {

      # Description: Whether to enable the OpenSSH secure shell daemon, which allows secure remote logins
      # Type: Boolean
      enable = true;

      # Description: Configuration for sshd_config(5)
      # Type: Attribute Set
      settings = {

        # Description: Specifies whether password authentication is allowed
        # Type: Boolean
        PasswordAuthentication = true;

      };

    };

  };

}