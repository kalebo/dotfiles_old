# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

   networking.hostName = "naos"; # Define your hostname.

   time.timeZone = "America/Denver";


nixpkgs.config = {

    allowUnfree = true;

    firefox = {
     enableGoogleTalkPlugin = true;
     enableAdobeFlash = true;
    };

#    chromium = {
#     enablePepperFlash = true; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works 
#     enablePepperPDF = true;
#    };

  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
 environment.systemPackages = with pkgs; [

   # ENVIROMENT
   bspwm
   rxvt_unicode_with-plugins
   termite
   sxhkd
   sutils
   xtitle
   bar
   dmenu2
   compton
   trayer
   clipit
   ranger
   powerline-fonts

   # EXTRA
   xdotool

   # BASIC
   firefoxWrapper
   zathura
   weechat
   #chromium
   mpv

   # MEDIA ## i think these are pulled in automatically
   gst_plugins_base gst_plugins_good gst_plugins_ugly

   # EDITORS
   vim emacs
   aspell

   # AUTHORING
   #texLiveFull
   #texLivePGF

   # PROGRAMMING
   python34Packages.ipython
   gcc
   python27
   python34
   scons
   python
   mysqlWorkbench

   # SYSTEM
   git zsh tmux htop sudo mtr nmap git subversion wget openssh cifs_utils
   #mesa_drivers mesa_noglu

   # GTK GUI
   gimp inkscape mypaint




 ]; # ++ builtins.filter stdenv.lib.isDerivation (builtins.attrValues kdeApps_stable);

  environment.variables.PANEL_FIFO = "/tmp/panel-fifo";

  # List services that you want to enable:

  hardware.pulseaudio.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  services.openssh.enable = true;
  services.printing = {
      enable = true;
      drivers = [ pkgs.gutenprint ];
  };

  systemd.user.services.emacs = {
  description = "Emacs Daemon";
  environment.GTK_DATA_PREFIX = config.system.path;
  environment.SSH_AUTH_SOCK = "run/user/1000/ssh-agent";
  environment.GTK_PATH = "${config.system.path}/lib/gtk-3.0:${config.system.path}/lib/gtk-2.0";
  serviceConfig = {
      Type = "forking";
      ExecStart = "${pkgs.emacs}/bin/emacs --daemon";
      ExecStop = "${pkgs.emacs}/bin/emacsclient --eval (kill-emacs)";
      Restart = "always";
  };
  wantedBy = [ "default.target" ];
  };
  
  systemd.services.emacs.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "dvorak";
    xkbOptions = "terminate:ctrl_alt_bksp, compose:caps";
    wacom.enable = true;

    # Enable bspwm
    windowManager = {
      bspwm.enable = true;
    };

  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.kalebo = { 
    isNormalUser = true;
    home = "/home/kalebo";
    description = "Kaleb Olson";
    extraGroups = ["wheel"];
    uid = 1000;
  };
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

}
