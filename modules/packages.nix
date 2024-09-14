
{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = false;
  }

  environment.systemPackages = with pkgs; [

    git

  ];

  fonts.packages = with pkgs; [



  ];

}