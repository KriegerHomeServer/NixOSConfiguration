
{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = false;
  };

  environment.systemPackages = with pkgs; [

    git
    wget

  ];

  fonts.packages = with pkgs; [



  ];

}