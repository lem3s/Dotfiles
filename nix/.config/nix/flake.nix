{
  description = "lem3s Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.loopwm
          pkgs.mkalias
          pkgs.aldente
          pkgs.warp-terminal
          pkgs.raycast
          pkgs.ripgrep
          pkgs.vscode
          pkgs.tree

          pkgs.ranger
          pkgs.asdf-vm
          pkgs.wget
          pkgs.neovim
          pkgs.tmux
          pkgs.starship
          pkgs.eza
          pkgs.bat
          pkgs.glow
        ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          "iina"
          "zen-browser"
          "arc"
          "the-unarchiver"
          "docker"
          "Proxyman"
          "Figma"
          "Shottr"
          "scroll-reverser"
          "firefox@developer-edition"
          "ghostty"
        ];
        masApps = {
          "Xcode" = 497799835;
        };
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
      };

      fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Meslo" ]; })
      ];

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
        '';

      system.activationScripts.userScript.text = ''
        wget https://github.com/sbmpost/AutoRaise/archive/refs/heads/master.zip -P ~/Downloads
        unzip -d ~ ~/Downloads/master.zip
        rm ~/Downloads/master.zip
        cd ~/AutoRaise-master && make CXXFLAGS="-DOLD_ACTIVATION_METHOD -DEXPERIMENTAL_FOCUS_FIRST" && make install
        /Applications/AutoRaise.app/Contents/MacOS/AutoRaise delay=0 focusDelay=1 &

        '';

      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
          "/Applications/Arc.app/.app/"
          "${pkgs.warp-terminal}/Applications/Ghostty.app/.app/"
        ];
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "lemes";
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."simple".pkgs;
  };
}
