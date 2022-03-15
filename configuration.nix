{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan and other channels
      ./machines/framework.nix
    ];
}