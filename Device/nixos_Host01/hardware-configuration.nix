# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
     (modulesPath + "/installer/scan/not-detected.nix")
      ./hardware/gpu_amd.nix
  ];

   # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages =  pkgs.linuxPackages_xanmod_stable;
    # kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_zen;
    # kernelPackages = pkgs.linuxPackages_lqx;
    kernelModules = [ 
      "kvm-amd"
      "tun" 
      "virtio"
    ];
    extraModulePackages = [ ];
    initrd.kernelModules = [ ];
    initrd.availableKernelModules = [ 
      "xhci_pci"
      "ahci"
      "ohci_pci"
      "ehci_pci"
      "usb_storage"
      "sd_mod"
      "sr_mod"
    ];
  };

  # 硬碟分區配置
  # 如果換硬碟，請換掉相對的UUID配置，否則無法進入系統
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ee68037b-0687-422d-b42b-dc2b92513bad";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/8032-8A00";
      fsType = "vfat";
    };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
