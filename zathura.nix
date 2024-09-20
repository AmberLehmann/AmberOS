{ ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#201F25";
      default-fg = "#FFFFFF";
      recolor = true;
      recolor-lightcolor = "#1C1C25";
      recolor-darkcolor = "#FFFFFF";
      highlight-color = "rgba(255, 154, 239, 0.4)";
      highlight-active-color = "rgba(255, 137, 148, 0.5)";
      scroll-step = 80;
    };
  };
}
