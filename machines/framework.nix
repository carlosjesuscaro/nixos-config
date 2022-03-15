{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan and other channels
      ./hardware-configuration.nix
      <home-manager/nixos>
      ../system/common.nix
      ../system/apps.nix
      ../system/unstable.nix
      ../modules/virtualization.nix
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.carlos = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # Home Manager setup
  home-manager.users.carlos = { pkgs, config, ...}: {
    imports = [
        ../home/git.nix
        ../home/gnome.nix
        ../home/terminal.nix
        ../home/vscode.nix
        ../home/zsh.nix
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}


