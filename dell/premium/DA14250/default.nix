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

  boot.kernelPatches = [
    {
      name = "enable-soundwire-drivers";
      patch = null;
      extraConfig = ''
        SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES y
        SND_SOC_INTEL_SOUNDWIRE_SOF_MACH m
        SND_SOC_RT1308 m
      '';
    }
  ];
}
