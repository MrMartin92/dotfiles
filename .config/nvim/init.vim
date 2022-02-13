set number
set relativenumber
set showbreak=↪\ 
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
set scrolloff=5

call plug#begin()
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

let g:vscode_style = "dark"
colorscheme vscode

lua <<EOF
require('lualine').setup {
	options = {
		theme = 'vscode'
	}
}
EOF
