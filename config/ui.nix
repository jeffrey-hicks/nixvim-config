{
  colorschemes.tokyonight.enable = true;

  plugins = {

    lualine    = { enable = true; };
    bufferline = { enable = true; };

    indent-blankline = { enable = true; };

    which-key = { enable = true; };
    nvim-tree = { enable = true; };

    mini = {
      enable = true;
      modules = {
        align   = { };
        comment = { };
      };
    };

    notify = { enable = true; };
    noice = {
      enable = true;
      presets = {
        lsp_doc_border  = true;
        command_palette = true;
        bottom_search   = true;
      };
      lsp = {
        signature = {
          enabled = true;
          opts = {
            relative = "editor";
            align = "message-right";
            position = {
              row = 5;
              col = -1;
            };
            size = {
              max_width = 40;
            };
          };
        };
        override = { 
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown"                = true;
          "cmp.entry.get_documentation"                  = true; 
        }; 
      };
    };
  };
}
