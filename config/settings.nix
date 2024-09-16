{
  globals.mapleader = " ";

  opts = {
    number         = true;
    relativenumber = true;
    termguicolors  = true;
    scrolloff = 20;
    clipboard = "unnamedplus";
    cursorline = true;
    wrap = false;
    ff = "unix";
    # ffs = "unix";
    # showtabline = 2;

    # Better splitting
    splitbelow = true;
    splitright = true;

    # Enable mouse mode
    mouse = "a"; # Mouse

    # Enable ignorecase + smartcase for better searching
    ignorecase = true;
    smartcase  = true; # Don't ignore case with capitals
    grepprg    = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    # Set completeopt to have a better completion experience
    completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

    # Enable persistent undo history
    swapfile = false;
    backup   = false;
    undofile = true;

    # Tab options
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;
    
    # foldenable = true;
    #foldmethod = "indent";
    # foldmarker = "///,\\\\\\";

    title = true;
  };

  keymaps = [
    # { mode=["n"]; key=""; action=""; options.desc = ""; }
    # { mode=["n"]; key= "j"; action= "jzz"; options.desc = ""; }
    # { mode=["n"]; key= "k"; action= "kzz"; options.desc = ""; }
    # { mode=["n"]; key= "#"; action= "#zz"; options.desc = ""; }
    # { mode=["n"]; key= "*"; action= "*zz"; options.desc = ""; }
    # { mode=["n"]; key= "n"; action= "nzz"; options.desc = ""; }
    # { mode=["n"]; key= "N"; action= "Nzz"; options.desc = ""; }
    # { mode=["n"]; key= "%"; action= "%zz"; options.desc = ""; }

    { mode=["n"]; key="<leader><leader>"; action=":"; options.desc = "Command Mode"; }
    { mode=["n"]; key="<leader>d"; action="za"; options.desc = "Fold toggle - all"; }
    { mode=["n"]; key="<leader>f"; action="zA"; options.desc = "Fold toggle - single"; }
    { mode=["n"]; key="<leader>o"; action="zR"; options.desc = "Folds-Open All"; }
    { mode=["n"]; key="<leader>h"; action="zM"; options.desc = "Folds-Close All"; }
    { mode=["n"]; key="<leader>c"; action='':let @/ = ""<CR>''; options.desc = "Clear Search"; }
    { mode=["n"]; key="<F4>"; action=":w<CR>"; options.desc = "Save File"; }
    # { mode=["n"]; key="<F4>"; action=":w <bar> e <bar> :foldopen!<CR>"; options.desc = "Save File"; }
    # { mode=["n"]; key="<F4>"; action=":w <bar> e<CR>"; options.desc = "Save File"; }
    { mode=["n"]; key="<Tab>"; action="<C-w>w"; options.desc = "Cycle window"; }
    { mode=["n"]; key="<a-Right>"; action=":bn<CR>"; options.desc = "Cycle buffer"; }
    { mode=["n"]; key="<a-Left>"; action=":bp<CR>"; options.desc = "Cycle buffer"; }

    { mode=["t"]; key="<Esc>"; action="<C-\\><C-n>"; options.desc = "Exit terminal mode"; }
    { mode=["t"]; key="<C-v><Esc>"; action="<Esc>"; options.desc = "<Esc> in terminal mode"; }
  ];
}
