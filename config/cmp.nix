{
  extraConfigLua = ''
    -- LSP Hover Doc Scrolling
    vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
      if not require("noice.lsp").scroll(4) then
        return "<c-f>"
      end
    end, { silent = true, expr = true })

    vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
      if not require("noice.lsp").scroll(-4) then
        return "<c-b>"
      end
    end, { silent = true, expr = true })
  '';

  # extraPlugins = [ pkgs.vimPlugins.lsp_signature-nvim ];

  plugins = {
    cmp-buffer   = { enable = true; };
    cmp-emoji    = { enable = true; };
    cmp-nvim-lsp = { enable = true; };
    cmp-path     = { enable = true; };
    # cmp-nvim-lsp-signature-help = { enable = true; };
    cmp_luasnip  = { enable = true; };
    cmp-cmdline  = { enable = true; };
    luasnip = {
      enable = true;
      # settings = {
      #   enable_autosnippets = true;
      #   store_selection_keys = "<F12>";
      # };
    };

    cmp = {
      enable = true;
      # cmdline = { };
      settings = {
        view.docs.auto_open = false;
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        # experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries=10;
        };
        formatting = { fields = ["kind" "abbr" "menu"]; };
        sources = [
          { name = "nvim_lsp"; keyword_length = 3; }
          { name = "luasnip"; keyword_length = 3; }
          { name = "cmdline"; keyword_length = 3; }
          # { name = "nvim_lsp_signature_help"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keyword_length = 3; 
          }
          # { name = "nvim_lua"; keyword_length = 3; }
          { name = "path"; keyword_length = 3; }
        ];
        window = {
          completion = {
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
            scrollbar = false;
            sidePadding = 0;
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          };

          settings.documentation = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
          };
        };
        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<F12>" =
            "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<Tab>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
          "<S-Tab>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
      };
    };
  };
}
