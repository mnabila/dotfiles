import subprocess


def readXresources(prefix):
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop.strip("*")] = value
    return props


xrdb = readXresources("*color")

#
# completion
#
c.colors.completion.category.bg = xrdb["color0"]
c.colors.completion.category.border.bottom = xrdb["color0"]
c.colors.completion.category.border.top = xrdb["color0"]
c.colors.completion.category.fg = xrdb["color15"]
c.colors.completion.even.bg = xrdb["color0"]
c.colors.completion.fg = [
    xrdb["color15"],
    xrdb["color7"],
    xrdb["color15"],
]
c.colors.completion.item.selected.bg = xrdb["color3"]
c.colors.completion.item.selected.border.bottom = xrdb["color0"]
c.colors.completion.item.selected.border.top = xrdb["color0"]
c.colors.completion.item.selected.match.fg = xrdb["color0"]
c.colors.completion.match.fg = xrdb["color3"]
c.colors.completion.odd.bg = xrdb["color0"]
c.colors.completion.scrollbar.bg = xrdb["color0"]
c.colors.completion.scrollbar.fg = xrdb["color3"]

# download
c.colors.downloads.bar.bg = xrdb["color0"]
c.colors.downloads.error.bg = xrdb["color1"]
c.colors.downloads.start.bg = xrdb["color4"]
c.colors.downloads.stop.bg = xrdb["color10"]

# hint
c.colors.hints.bg = xrdb["color3"]
c.colors.hints.fg = xrdb["color0"]
c.colors.hints.match.fg = xrdb["color8"]

# keyhint
c.colors.keyhint.bg = "rgba(40, 40, 40, 100%)"
c.colors.keyhint.fg = xrdb["color15"]
c.colors.keyhint.suffix.fg = xrdb["color3"]

# messages
c.colors.messages.error.bg = xrdb["color1"]
c.colors.messages.error.fg = xrdb["color15"]
c.colors.messages.error.border = xrdb["color1"]
c.colors.messages.info.bg = xrdb["color7"]
c.colors.messages.info.fg = xrdb["color0"]
c.colors.messages.info.border = xrdb["color7"]
c.colors.messages.warning.bg = xrdb["color11"]
c.colors.messages.warning.fg = xrdb["color0"]
c.colors.messages.warning.border = xrdb["color11"]

# prompt
c.colors.prompts.bg = xrdb["color0"]
c.colors.prompts.fg = xrdb["color15"]
c.colors.prompts.border = "1px solid {}".format(xrdb["color0"])
c.colors.prompts.selected.bg =xrdb["color3"]
c.colors.prompts.selected.fg =xrdb["color0"]

# statusbar
c.colors.statusbar.insert.bg = xrdb["color10"]
c.colors.statusbar.insert.fg = xrdb["color0"]
c.colors.statusbar.normal.bg = xrdb["color0"]
c.colors.statusbar.normal.fg = xrdb["color15"]
c.colors.statusbar.passthrough.bg = xrdb["color12"]
c.colors.statusbar.passthrough.fg = xrdb["color0"]
c.colors.statusbar.private.bg = xrdb["color8"]
c.colors.statusbar.private.fg = xrdb["color15"]
c.colors.statusbar.progress.bg = xrdb["color15"]

# statusbar.caret
c.colors.statusbar.caret.bg = xrdb["color5"]
c.colors.statusbar.caret.fg = xrdb["color0"]
c.colors.statusbar.caret.selection.bg = xrdb["color3"]
c.colors.statusbar.caret.selection.fg = xrdb["color0"]

# statusbar.command
c.colors.statusbar.command.bg = xrdb["color0"]
c.colors.statusbar.command.fg = xrdb["color15"]
c.colors.statusbar.command.private.bg = xrdb["color8"]
c.colors.statusbar.command.private.fg = xrdb["color15"]

# statusbar.url
c.colors.statusbar.url.error.fg = xrdb["color1"]
c.colors.statusbar.url.fg = xrdb["color15"]


# tabs
c.colors.tabs.bar.bg = xrdb["color14"]
c.colors.tabs.even.bg = xrdb["color0"]
c.colors.tabs.even.fg = xrdb["color15"]
c.colors.tabs.indicator.error = xrdb["color1"]
c.colors.tabs.indicator.start = xrdb["color4"]
c.colors.tabs.indicator.stop = xrdb["color2"]
c.colors.tabs.odd.bg = xrdb["color0"]
c.colors.tabs.odd.fg = xrdb["color15"]
c.colors.tabs.selected.even.bg = xrdb["color3"]
c.colors.tabs.selected.even.fg = xrdb["color0"]
c.colors.tabs.selected.odd.bg = xrdb["color3"]
c.colors.tabs.selected.odd.fg = xrdb["color0"]

