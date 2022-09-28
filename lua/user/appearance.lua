local M = {}

M.icons = {
  dos = "", -- e70f
  unix = "", -- f17c
  mac = "", -- f179
  code = "", -- e000
  paste = "", -- f691
  dot = "", -- f62e
  duck = " ", -- f6e4
  page = "☰", -- 2630
  buffer = "﬘", -- fb18
  arrow = "", -- e285
  play_arrow = "", -- e602
  line_number = "", -- e0a1
  connected = "", -- f817
  disconnected = "", -- f818
  gears = "", -- f085
  poop = "💩", -- 1f4a9
  question = "", -- f128
  bug = "", -- f188
  git = {
    logo = "", -- f7a1
    branch = "", -- f418
  },
  square = {
    plus = "", -- f0fe
    minus = "", --f146
    dot = "", --f264
  },
  circle = {
    plus = "", -- f055
    minus = "", --f056
    dot = "", -- f192
  },
  file = {
    locked = "", -- f023
    not_modifiable = "", -- f05e
    unsaved = "", -- f0c7
    modified = "", -- f040
  },
  diagnostic = {
    ok = "", -- f058
    error = "", -- f057
    warning = "", -- f06a
    info = "", -- f05a
    -- hint = "", -- f834
    hint = "", -- f059
  },
  sep = {
    right_filled = "", -- e0b2
    left_filled = "", -- e0b0
    right = "", -- e0b3
    left = "", -- e0b1
  },
}

-- Gruvbox
local gruvbox = {
  gray = "#928374",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
  dark = {
    bg = "#282828",
    bg0_h = "#1d2021",
    bg0 = "#282828",
    bg1 = "#3c3836",
    bg2 = "#504945",
    bg3 = "#665c54",
    bg4 = "#7c6f64",
    fg0 = "#fbf1c7",
    fg1 = "#ebdbb2",
    fg2 = "#d5c4a1",
    fg3 = "#bdae93",
    fg4 = "#a89984",
  },
  light = {
    bg = "#fbf1c7",
    bg0_h = "#f9f5d7",
    bg0 = "#fbf1c7",
    bg1 = "#ebdbb2",
    bg2 = "#d5c4a1",
    bg3 = "#bdae93",
    bg4 = "#a89984",
    fg0 = "#282828",
    fg1 = "#3c3836",
    fg2 = "#504945",
    fg3 = "#665c54",
    fg4 = "#7c6f64",
  },
}

local color_map = {
  gruvbox = {
    dark = {
      n = { gruvbox.dark.fg3, gruvbox.dark.bg2 },
      i = { gruvbox.bright_blue, gruvbox.faded_blue },
      ic = { gruvbox.bright_blue, gruvbox.faded_blue },
      R = { gruvbox.bright_red, gruvbox.faded_red },
      v = { gruvbox.bright_orange, gruvbox.faded_orange },
      V = { gruvbox.bright_orange, gruvbox.faded_orange },
      c = { gruvbox.bright_yellow, gruvbox.faded_yellow },
      s = { gruvbox.bright_orange, gruvbox.faded_orange },
      S = { gruvbox.bright_orange, gruvbox.faded_orange },
      t = { gruvbox.bright_aqua, gruvbox.faded_aqua },
      nt = { gruvbox.dark.fg3, gruvbox.dark.bg2 },
      ["\22"] = { gruvbox.bright_orange, gruvbox.faded_orange },
      ["\19"] = { gruvbox.bright_orange, gruvbox.faded_orange },
      substrate = gruvbox.dark.bg1,
      git_icon = gruvbox.bright_orange,
      git_branch = gruvbox.dark.fg2,
      diff_add = gruvbox.bright_green,
      diff_modified = gruvbox.bright_orange,
      diff_remove = gruvbox.bright_red,
      lsp_icon = gruvbox.bright_purple,
      lsp_name = gruvbox.dark.fg4,
      ok = gruvbox.bright_green,
      error = gruvbox.bright_red,
      warn = gruvbox.bright_yellow,
      info = gruvbox.bright_blue,
      hint = gruvbox.bright_aqua,
    },
    light = {
      n = { gruvbox.light.fg3, gruvbox.light.bg2 },
      i = { gruvbox.bright_blue, gruvbox.neutral_blue },
      ic = { gruvbox.bright_blue, gruvbox.neutral_blue },
      R = { gruvbox.bright_red, gruvbox.neutral_red },
      v = { gruvbox.bright_orange, gruvbox.neutral_orange },
      V = { gruvbox.bright_orange, gruvbox.neutral_orange },
      c = { gruvbox.bright_yellow, gruvbox.neutral_yellow },
      s = { gruvbox.bright_orange, gruvbox.neutral_orange },
      S = { gruvbox.bright_orange, gruvbox.neutral_orange },
      t = { gruvbox.bright_aqua, gruvbox.neutral_aqua },
      nt = { gruvbox.light.fg3, gruvbox.light.bg2 },
      ["\22"] = { gruvbox.bright_orange, gruvbox.neutral_orange },
      ["\19"] = { gruvbox.bright_orange, gruvbox.neutral_orange },
      substrate = gruvbox.light.bg1,
      git_icon = gruvbox.neutral_orange,
      git_branch = gruvbox.light.fg2,
      diff_add = gruvbox.neutral_green,
      diff_modified = gruvbox.neutral_orange,
      diff_remove = gruvbox.neutral_red,
      lsp_icon = gruvbox.neutral_purple,
      lsp_name = gruvbox.light.fg4,
      ok = gruvbox.neutral_green,
      error = gruvbox.neutral_red,
      warn = gruvbox.neutral_yellow,
      info = gruvbox.neutral_blue,
      hint = gruvbox.neutral_aqua,
    },
  },
}

for _, table in pairs(color_map) do
  for _, subtable in pairs(table) do
    setmetatable(subtable, {
      __index = function()
        return subtable.n
      end,
    })
  end
end

local theme_map = color_map[vim.g.colors_name] or color_map["gruvbox"]

M.colors = theme_map[vim.opt.background:get()] or theme_map["dark"]

return M
