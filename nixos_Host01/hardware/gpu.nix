{ config, lib, pkgs, modulesPath, ... }:

{
   # OpenGL Lib: AMD APU
  hardware.opengl = {
    # 64位元支援
    extraPackages = [
      # rocmPackages.clr.icd
      pkgs.amdvlk
    ];
    # 32位元支援
    extraPackages32 = [
      pkgs.driversi686Linux.amdvlk
    ];
    driSupport = true; # This is already enabled by default
    driSupport32Bit = true; # For 32 bit applications
  }; 
  
  environment.variables.VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
}