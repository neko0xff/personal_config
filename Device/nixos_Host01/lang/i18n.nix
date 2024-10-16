{ config, pkgs, ... }:

{
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "zh_TW.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_TW.UTF-8";
      LC_IDENTIFICATION = "zh_TW.UTF-8";
      LC_MEASUREMENT = "zh_TW.UTF-8";
      LC_MONETARY = "zh_TW.UTF-8";
      LC_NAME = "zh_TW.UTF-8";
      LC_NUMERIC = "zh_TW.UTF-8";
      LC_PAPER = "zh_TW.UTF-8";
      LC_TELEPHONE = "zh_TW.UTF-8";
      LC_TIME = "zh_TW.UTF-8";
    };
    inputMethod = {
      # 輸入法: fcitx5
      # 自檢指令: fcitx5-diagnose
      enabled = "fcitx5";
      fcitx5 = {
         addons = with pkgs; [ 
            fcitx5-gtk
            kdePackages.fcitx5-with-addons
            fcitx5-mozc     # 日文
            fcitx5-chewing  # 注音
            fcitx5-table-other # 其它輸入法
            fcitx5-table-extra # 其它輸入法
            fcitx5-chinese-addons # 簡中輸入
            fcitx5-m17n
            fcitx5-configtool # 設置工具
          ];
          waylandFrontend = true;
          plasma6Support = true;
      };
        /*ibus.engines = with pkgs.ibus-engines; [
          anthy
          m17n
          cangjie
          table
          table-chinese
        ];*/
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

}