{
  plugins = {
    # lanugage support
    # typst-vim = { enable=true; };

    # lspsaga = { enable=true; };
    trouble = { enable=true; };

    treesitter = {
      enable =true;
      settings = {
        highlight.enable = true;
      };
      # indent =true;
      # folding=true;
    };
    treesitter-context = { enable=true; };
  
    lsp = {
      enable=true;
      servers = {
        pyright   = { enable=true; };
        # pylyzer   = { enable=true; };
        # typst-lsp = { enable=true; };
      };
    };
  };
}
