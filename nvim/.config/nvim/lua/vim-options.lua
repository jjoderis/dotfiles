vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.background = "light"

vim.keymap.set("", "<Space>", "<Nop>", { silent = true })
vim.g.maplocalleader = " "
vim.g.mapleader = " "

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- horizontal split and resize
vim.keymap.set("n", "-", ":split<Cr>", { silent = true })
vim.keymap.set("n", "<C-Up>", ":resize -2<Cr>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<Cr>", { silent = true })

-- vertical split and resize
vim.keymap.set("n", "|", ":vsplit<Cr>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<Cr>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<Cr>", { silent = true })

-- change indentation
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- move the selected line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>cy", [["+y]], { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>cp", [["+p]], { silent = true })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
