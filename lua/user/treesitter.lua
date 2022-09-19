local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all", -- a list of parser names, or "all"
  sync_install = false, -- install parsers synchronously (only applied to `ensure_installed`)
  auto_install = true, -- automatically install missing parsers when entering buffer
  ignore_install = { "" }, -- list of parsers to ignore installing (for "all")
  highlight = {
    enable = true, -- `false` will disable the whole extension

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    disable = { "" }, -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
