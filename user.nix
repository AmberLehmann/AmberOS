{ ... }:

# Define a user account. Don't forget to set a password with ‘passwd’.
{
  users.users.amber = {
    isNormalUser = true;
    description = "amber";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };
}
