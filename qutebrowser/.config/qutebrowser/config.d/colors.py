import subprocess

def readXresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props
xrdb = readXresources("*")

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = [
    xrdb["*color15"],
    xrdb["*color7"],
    xrdb["*color15"],
]

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = xrdb["*color0"]

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = xrdb["*color0"]

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = xrdb["*color15"]

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = xrdb["*color0"]

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = xrdb["*color0"]

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = xrdb["*color0"]

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = xrdb["*color0"]

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = xrdb["*color3"]

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = xrdb["*color3"]

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = xrdb["*color3"]

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = xrdb["*color0"]

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = xrdb["*color3"]

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = xrdb["*color3"]

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = xrdb["*color0"]

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = xrdb["*color0"]

# Color gradient start for download text.
# Type: QtColor
c.colors.downloads.start.fg = xrdb["*color15"]

# Color gradient start for download backgrounds.
# Type: QtColor
c.colors.downloads.start.bg = xrdb["*color4"]

# Color gradient end for download text.
# Type: QtColor
c.colors.downloads.stop.fg = xrdb["*color15"]

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = xrdb["*color2"]

# Color gradient interpolation system for download text.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.fg = "rgb"

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.bg = "rgb"

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = xrdb["*color15"]

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = xrdb["*color1"]

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = xrdb["*color3"]

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = xrdb["*color0"]

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = xrdb["*color3"]

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = xrdb["*color15"]

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = "#FFFF00"

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = xrdb["*color15"]

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = xrdb["*color1"]

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = xrdb["*color1"]

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = xrdb["*color0"]

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = xrdb["*color3"]

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = xrdb["*color3"]

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = xrdb["*color15"]

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = xrdb["*color0"]

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = xrdb["*color0"]

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = xrdb["*color15"]

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = "1px solid {}".format(xrdb["*color0"])

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = xrdb["*color0"]

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = xrdb["*color3"]

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = xrdb["*color15"]

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = xrdb["*color0"]

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = xrdb["*color0"]

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = xrdb["*color2"]

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = xrdb["*color15"]

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = xrdb["*color4"]

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = xrdb["*color15"]

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = xrdb["*color8"]

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = xrdb["*color15"]

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = xrdb["*color0"]

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = xrdb["*color15"]

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = xrdb["*color8"]

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = xrdb["*color0"]

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = xrdb["*color6"]

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = xrdb["*color0"]

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = xrdb["*color3"]

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = xrdb["*color15"]

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = xrdb["*color15"]

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = xrdb["*color15"]

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = xrdb["*color12"]

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = xrdb["*color15"]

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = xrdb["*color15"]

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = xrdb["*color3"]

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = xrdb["*color0"]

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = xrdb["*color4"]

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = xrdb["*color2"]

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = xrdb["*color1"]

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = "rgb"

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = xrdb["*color15"]

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = xrdb["*color0"]

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = xrdb["*color15"]

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = xrdb["*color0"]

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = xrdb["*color0"]

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = xrdb["*color3"]

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = xrdb["*color0"]

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = xrdb["*color3"]

# Foreground color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.fg = xrdb["*color15"]

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = xrdb["*color6"]

# Foreground color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.fg = xrdb["*color15"]

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = xrdb["*color6"]

# Foreground color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.fg = xrdb["*color15"]

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = xrdb["*color3"]

# Foreground color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.fg = xrdb["*color15"]

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = xrdb["*color3"]

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
# c.colors.webpage.bg = "#ffffff"

# Which algorithm to use for modifying how colors are rendered with darkmode.
# Type: String
c.colors.webpage.darkmode.algorithm = "lightness-cielab"

# Contrast for dark mode. This only has an effect when colors.webpage.darkmode.algorithm is set to lightness-hsl or brightness-rgb.
# Type: Float
# c.colors.webpage.darkmode.contrast = 0.9

# Render all web contents using a dark theme. Example configurations from Chromium’s chrome://flags:
# Type: Bool
c.colors.webpage.darkmode.enabled = False

# Render all colors as grayscale. This only has an effect when colors.webpage.darkmode.algorithm is set to lightness-hsl or brightness-rgb.
# Type: Bool
c.colors.webpage.darkmode.grayscale.all = True

# Desaturation factor for images in dark mode. If set to 0, images are left as-is. If set to 1, images are completely grayscale. Values between 0 and 1 desaturate the colors accordingly.
# Type: Float
c.colors.webpage.darkmode.grayscale.images = 0.5

# Which images to apply dark mode to. WARNING: With QtWebengine 5.15.0, this setting can cause frequent renderer process crashes due to a bug in Qt. Thus, the smart setting is ignored and treated like never in that case.
# Type: String
c.colors.webpage.darkmode.policy.images = "never"

# Which pages to apply dark mode to.
# Type: String
c.colors.webpage.darkmode.policy.page = "smart"
