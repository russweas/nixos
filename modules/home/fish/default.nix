{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx MICRO_TRUECOLOR 1
      set -gx EDITOR helix

      fish_add_path $HOME/.local/bin
      fish_add_path $HOME/.nix-profile/bin

      # rebind fzf-fish to reliable keys (Ctrl+Alt combos are broken under Wayland)
      fzf_configure_bindings --directory=\ef --git_log=\el --git_status=\es --processes=\ep

      alias rebuild="sudo nixos-rebuild switch --flake /home/rweas/.nix#desktop"
      alias update-flake="cd /home/rweas/.nix && nix flake update"
      alias c="nono run --allow-cwd --profile claude-code -- claude --dangerously-skip-permissions"

      function compress
        if test (count $argv) -lt 2
          echo "Usage: compress <archive_name> <files...>"
          return 1
        end
        set name $argv[1]
        set files $argv[2..]
        tar -cvzf "$name.tar.gz" $files
      end

      function decompress
        if test (count $argv) -lt 1
          echo "Usage: decompress <archive>"
          return 1
        end
        set archive $argv[1]
        if test -f $archive
          tar -xvzf $archive
        else
          echo "File not found: $archive"
          return 1
        end
      end

      function iso2sd
        if test (count $argv) -lt 2
          echo "Usage: iso2sd <iso_file> <device>"
          echo "Example: iso2sd arch.iso /dev/sdX"
          return 1
        end
        set iso $argv[1]
        set device $argv[2]
        sudo dd if="$iso" of="$device" bs=4M status=progress oflag=sync
      end

      function format-drive
        if test (count $argv) -lt 1
          echo "Usage: format-drive <device> [label]"
          echo "Example: format-drive /dev/sdX MYUSB"
          return 1
        end
        set device $argv[1]
        set label $argv[2]
        if test -z "$label"
          set label "USB"
        end
        sudo mkfs.fat -F 32 -n "$label" "$device"
      end

      function img2jpg
        if test (count $argv) -lt 2
          echo "Usage: img2jpg <input_file> <output_file>"
          echo "Example: img2jpg image.png image.jpg"
          return 1
        end
        set input $argv[1]
        set output $argv[2]
        magick convert "$input" "$output"
      end
    '';
    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
    functions = {
      fish_greeting = "";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
