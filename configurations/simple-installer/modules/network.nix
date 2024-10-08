# Network configuration for the Simple Installer
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

    # Description: The name of the machine
    # Type: String matching pattern ^$|^[[:alnum:]]([[:alnum:]_-]{0,61}[[:alnum:]])?$
    networking.hostName = "installer";

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

    # Description: List of TCP ports on which incoming connections are accepted
    # Type: List of Integers
    networking.firewall.allowedTCPPorts = [ 22 ];

  };

}