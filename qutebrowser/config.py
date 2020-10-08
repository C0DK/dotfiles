nord = {
    0: "#2E3440",
    1: "#3B4252",
    2: "#434C5E",
    3: "#4C566A",
    4: "#D8DEE9",
    5: "#E5E9F0",
    6: "#ECEFF4",
    7: "#8FBCBB",
    8: "#88C0D0",
    9: "#81A1C1",
    10: "#5E81AC",
    11: "#BF616A",
    12: "#D08770",
    13: "#EBCB8B",
    14: "#A3BE8C",
    15: "#B48EAD",
}
bg_color = nord[0]
fg_color = nord[4]

c.colors.completion.category.bg = bg_color
c.colors.completion.category.fg = fg_color

border_color = nord[1]
c.colors.completion.category.border.bottom = border_color
c.colors.completion.category.border.top = border_color

c.colors.completion.even.bg = bg_color
c.colors.completion.odd.bg = bg_color

c.colors.completion.fg = nord[3]

selected_bg = nord[0]

c.colors.completion.item.selected.bg = selected_bg
c.colors.completion.item.selected.border.bottom = selected_bg
c.colors.completion.item.selected.border.top = selected_bg

c.colors.completion.item.selected.fg = fg_color

match_color_fg = nord[6]
c.colors.completion.item.selected.match.fg = match_color_fg
c.colors.completion.match.fg = match_color_fg

c.colors.completion.scrollbar.bg = bg_color
c.colors.completion.scrollbar.fg = fg_color

c.colors.downloads.bar.bg = nord[0]
c.colors.downloads.error.bg = nord[11]
c.colors.downloads.error.fg = nord[6]
c.colors.downloads.start.fg = nord[15]

c.colors.hints.bg = nord[0]
c.hints.border = "1 px " + nord[3]
c.colors.hints.fg = nord[4]
c.colors.hints.match.fg = nord[3]

c.colors.keyhint.bg = nord[1]
c.colors.keyhint.fg = nord[5]
c.colors.keyhint.suffix.fg = nord[4]

message_fg = nord[6]
c.colors.messages.error.bg = nord[11]
c.colors.messages.error.border = nord[11]
c.colors.messages.error.fg = message_fg
c.colors.messages.info.bg = nord[0]
c.colors.messages.info.border = nord[0]
c.colors.messages.info.fg = message_fg
c.colors.messages.warning.bg = nord[13]
c.colors.messages.warning.border = nord[13]
c.colors.messages.warning.fg = message_fg

c.colors.prompts.bg = nord[0]
c.colors.prompts.fg = nord[6]
c.colors.prompts.selected.bg = nord[1]

statusbar_fg = nord[6]

c.colors.statusbar.caret.bg = nord[10]
c.colors.statusbar.caret.fg = statusbar_fg

c.colors.statusbar.caret.selection.bg = nord[9]
c.colors.statusbar.caret.selection.fg = statusbar_fg

c.colors.statusbar.command.bg = nord[1]
c.colors.statusbar.command.fg = statusbar_fg

c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg
c.colors.statusbar.command.private.fg = c.colors.statusbar.command.fg

c.colors.statusbar.insert.bg = nord[14]
c.colors.statusbar.insert.fg = nord[6]

c.colors.statusbar.normal.bg = nord[0]
c.colors.statusbar.normal.fg = nord[3]

c.colors.statusbar.passthrough.bg = nord[15]
c.colors.statusbar.passthrough.fg = nord[6]

c.colors.statusbar.private.bg = nord[4]
c.colors.statusbar.private.fg = nord[0]

c.colors.statusbar.progress.bg = nord[1]

c.colors.statusbar.url.error.fg = nord[11]
c.colors.statusbar.url.fg = nord[3]
c.colors.statusbar.url.hover.fg = nord[4]
c.colors.statusbar.url.success.http.fg = nord[12]
c.colors.statusbar.url.success.https.fg = nord[3]
c.colors.statusbar.url.warn.fg = nord[13]

c.colors.tabs.bar.bg = nord[1]
c.colors.tabs.even.bg = c.colors.tabs.bar.bg
c.colors.tabs.even.fg = nord[3]

c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg
c.colors.tabs.pinned.odd.bg = c.colors.tabs.odd.bg
c.colors.tabs.pinned.odd.fg = c.colors.tabs.odd.fg
c.colors.tabs.pinned.even.bg = c.colors.tabs.even.bg
c.colors.tabs.pinned.even.fg = c.colors.tabs.even.fg

c.colors.tabs.indicator.error = nord[11]
c.colors.tabs.indicator.start = nord[7]
c.colors.tabs.indicator.stop = nord[1]

c.colors.tabs.selected.even.bg = nord[1]
c.colors.tabs.selected.even.fg = nord[6]
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg

c.tabs.padding = {"bottom": 5, "left": 5, "right": 5, "top": 5}
c.tabs.title.format = "{audio} {current_title}"
#c.tabs.last_close = close
c.tabs.tabs_are_windows = True
c.tabs.show = "multiple"

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "wolfram-alpha": "https://www.wolframalpha.com/input/?i={}",
    "dictionary": "https://www.dictionary.com/browse/{}?s=t",
    "google": "https://www.google.com/search?q={}",
    "scholar": "https://scholar.google.com/scholar?q={}",
    "translate": "https://translate.google.com/?text={}",
    "arch": "https://wiki.archlinux.org/?search={}",
    "maps": "https://www.google.com/maps/search/{}/",
    "fontawesome": "https://fontawesome.com/icons?d=gallery&q={}",
}

c.content.notifications = False
