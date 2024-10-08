#!/bin/bash

;

echo $PATH;

NIX_CONFIG="experimental-features = nix-command flakes" && mkdir -p ./dist && $(cd ./installer && nix build .#installer && mv ./result/iso/*.iso ../dist);