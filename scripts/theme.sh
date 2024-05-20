set_theme() {
  case $1 in
    dragon)
      white=$old_white
      gray=$sumi_ink_4
      dark_gray=$sumi_ink_2
      light_purple=$sumi_ink_5
      dark_purple=$sumi_ink_6
      cyan=$dragon_aqua
      green=$dragon_green
      orange=$dragon_orange
      red=$dragon_red
      pink=$dragon_pink
      yellow=$ronin_yellow
      ;;
    lotus)
      white=$lotus_white_3
      gray=$lotus_violet_1
      dark_gray=$lotus_white_3
      light_purple=$lotus_violet_1
      dark_purple=$lotus_violet_2
      cyan=$lotus_cyan
      green=$lotus_teal_2
      orange=$lotus_red_2
      red=$lotus_red_2
      pink=$lotus_pink
      yellow=$lotus_yellow_2
      ;;
    *)
      white=$fuji_white
      gray=$sumi_ink_4
      dark_gray=$sumi_ink_2
      light_purple=$sumi_ink_5
      dark_purple=$sumi_ink_6
      cyan=$wave_aqua
      green=$spring_violet_1
      orange=$autumn_orange
      red=$wave_red
      pink=$sakura_pink
      yellow=$ronin_yellow
      ;;
  esac
}