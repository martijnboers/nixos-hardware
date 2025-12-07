{ lib, ... }:
{
  imports = [
    ../../../common/cpu/intel
    ../../../common/pc/laptop
    ../../../common/pc/ssd
  ];

  # Includes the Wi-Fi and Bluetooth firmware
  hardware.enableRedistributableFirmware = true;

  boot.kernelParams = lib.mkDefault [ "acpi_rev_override" ];
  boot.kernelModules = lib.mkDefault [ "kvm-intel" ];

  # This will save you money and possibly your life!
  services.thermald.enable = lib.mkDefault true;
}
