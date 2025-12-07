{ ... }:
{
  imports = [
    ../../../common/cpu/intel
    ../../../common/pc/laptop
    ../../../common/pc/ssd
  ];

  # Includes the Wi-Fi and Bluetooth firmware
  hardware.enableRedistributableFirmware = true;
}
