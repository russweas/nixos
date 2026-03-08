{ ... }:
{
  programs.cava = {
    enable = true;

    settings = {
      color = {
        gradient = 1;
        gradient_count = 8;

        gradient_color_1 = "'#F38BA8'"; # red
        gradient_color_2 = "'#FAB387'"; # peach
        gradient_color_3 = "'#F9E2AF'"; # yellow
        gradient_color_4 = "'#A6E3A1'"; # green
        gradient_color_5 = "'#94E2D5'"; # teal
        gradient_color_6 = "'#89B4FA'"; # blue
        gradient_color_7 = "'#CBA6F7'"; # mauve
        gradient_color_8 = "'#F5C2E7'"; # pink
      };
    };
  };
}
