#!/usr/bin/env python3
# Inspire by: https://github.com/KnownAsDon/QuteBrowser-Nord-Theme/raw/master/config.py


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

match_color_fg = nord[4]

### Completion is everything in `:`
## Background color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.bg = nord[0]

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = nord[1]

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = nord[1]

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = nord[4]

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = nord[0]

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = c.colors.completion.even.bg

## Text color of the completion widget.
## Type: QtColor
c.colors.completion.fg = nord[3]

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = nord[0]

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = nord[0]

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.item.selected.border.top = nord[0]

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = nord[4]

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.match.fg = nord[6]

## Foreground color of the matched text in the completion.
## Type: QssColor
c.colors.completion.match.fg = match_color_fg

## Color of the scrollbar in completion view
## Type: QssColor
c.colors.completion.scrollbar.bg = nord[0]

## Color of the scrollbar handle in completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = nord[4]
c.completion.scrollbar.width = 5

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = nord[0]

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = nord[11]

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = nord[6]

## Color gradient start for download text.
## Type: QtColor
c.colors.downloads.start.fg = nord[15]

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
c.colors.hints.bg = nord[0]
c.hints.border = "1 px " + nord[3]

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = nord[4]

## Font color for the matched part of hints.
## Type: QssColor
# TODO helper functions for all matches
c.colors.hints.match.fg = nord[3]

## Background color of the keyhint widget.
## Type: QssColor
c.colors.keyhint.bg = nord[1]

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = nord[5]

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = nord[4]

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = nord[11]

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = nord[11]

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = nord[6]

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = nord[0]

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = nord[0]

## Foreground color an info message.
## Type: QssColor
c.colors.messages.info.fg = nord[6]

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = nord[13]

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = nord[13]

## Foreground color a warning message.
## Type: QssColor
c.colors.messages.warning.fg = nord[6]

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = nord[0]

## Border used around UI elements in prompts.
## Type: String
# c.colors.prompts.border = "1px solid " + nord["base3"]

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = nord[6]

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = nord[1]

## Background color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.bg = nord[10]

## Foreground color of the statusbar in caret mode.
## Type: QssColor
c.colors.statusbar.caret.fg = nord[6]

## Background color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.bg = nord[9]

## Foreground color of the statusbar in caret mode with a selection.
## Type: QssColor
c.colors.statusbar.caret.selection.fg = nord[6]

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = nord[1]

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = nord[6]

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = c.colors.statusbar.command.fg

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = nord[14]

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = nord[6]

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = nord[0]

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = nord[3]

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = nord[15]

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = nord[6]

## Background color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.bg = nord[4]

## Foreground color of the statusbar in private browsing mode.
## Type: QssColor
c.colors.statusbar.private.fg = nord[0]

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = nord[1]

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = nord[11]

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = nord[3]

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = nord[4]

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = nord[12]

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = nord[3]

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = nord[13]

c.tabs.padding = {"bottom": 5, "left": 5, "right": 5, "top": 5}

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.bar.bg = nord[1]
## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = c.colors.tabs.bar.bg

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = nord[3]

c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.odd.fg = c.colors.tabs.even.fg
c.colors.tabs.pinned.odd.bg = c.colors.tabs.odd.bg
c.colors.tabs.pinned.odd.fg = c.colors.tabs.odd.fg
c.colors.tabs.pinned.even.bg = c.colors.tabs.even.bg
c.colors.tabs.pinned.even.fg = c.colors.tabs.even.fg
## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = nord[11]

## Color gradient start for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.start = nord[7]

## Color gradient end for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.stop = nord[1]

c.tabs.title.format = "{audio} {current_title}"
## Background color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.bg = nord[1]

## Foreground color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.fg = nord[6]

## Background color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg

## Foreground color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg

## Background color for webpages if unset (or empty to use the theme's
## color)
## Type: QtColor
# c.colors.webpage.bg = 'white'

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "wolfram-alpha": "https://www.wolframalpha.com/input/?i={}",
    "dictionary": "https://www.dictionary.com/browse/{}?s=t",
    "google": "https://www.google.com/search?q={}",
    "scholar": "https://scholar.google.com/scholar?q={}",
    "translate": "https://translate.google.com/?text={}",
    "arch": "https://wiki.archlinux.org/?search={}",
    "maps": "https://www.google.com/maps/search/{}/",
}
