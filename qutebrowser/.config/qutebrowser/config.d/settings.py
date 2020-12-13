# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    "q": "close",
    "qa": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "wqa": "quit --save",
    "tor-proxy": "set content.proxy socks://127.0.0.1:9050",
    "ssh-proxy": "set content.proxy socks://127.0.0.1:1080",
    "system-proxy": "set content.proxy system",
    "settings": "open -t qute://settings",
}

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ["downloads"]

# Maximum time (in minutes) between two history items for them to be
# considered being from the same browsing session. Items with less time
# between them are grouped when being displayed in `:history`. Use -1 to
# disable separation.
# Type: Int
c.history_gap_interval = 30

# When to find text on a page case-insensitively.
# Type: IgnoreCase
# Valid values:
#   - always: Search case-insensitively.
#   - never: Search case-sensitively.
#   - smart: Search case-sensitively if there are capital characters.
c.search.ignore_case = "always"

# Find text on a page incrementally, renewing the search for each typed
# character.
# Type: Bool
c.search.incremental = True

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
#   - tab: Open a new tab in the existing window and activate the window.
#   - tab-bg: Open a new background tab in the existing window and activate the window.
#   - tab-silent: Open a new tab in the existing window without activating the window.
#   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
#   - window: Open in a new window.
c.new_instance_open_target = "tab-bg"

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is set to `window`, this is ignored.
# Type: String
# Valid values:
#   - first-opened: Open new tabs in the first (oldest) opened window.
#   - last-opened: Open new tabs in the last (newest) opened window.
#   - last-focused: Open new tabs in the most recently focused window.
#   - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = "last-focused"

# Name of the session to save by default. If this is set to null, the
# session which was last loaded is saved.
# Type: SessionName
c.session.default_name = None

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = False

# Backend to use to display websites. qutebrowser supports two different
# web rendering engines / backends, QtWebKit and QtWebEngine. QtWebKit
# was discontinued by the Qt project with Qt 5.6, but picked up as a
# well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry than
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice.
# Type: String
# Valid values:
#   - webengine: Use QtWebEngine (based on Chromium).
#   - webkit: Use QtWebKit (based on WebKit, similar to Safari).
c.backend = "webengine"

# Additional arguments to pass to Qt, without leading `--`. With
# QtWebEngine, some Chromium arguments (see
# https://peter.sh/experiments/chromium-command-line-switches/ for a
# list) will work.
# Type: List of String
c.qt.args = []

# Force software rendering for QtWebEngine. This is needed for
# QtWebEngine to work with Nouveau drivers and can be useful in other
# scenarios related to graphic issues.
# Type: String
# Valid values:
#   - software-opengl: Tell LibGL to use a software implementation of GL (`LIBGL_ALWAYS_SOFTWARE` / `QT_XCB_FORCE_SOFTWARE_OPENGL`)
#   - qt-quick: Tell Qt Quick to use a software renderer instead of OpenGL. (`QT_QUICK_BACKEND=software`)
#   - chromium: Tell Chromium to disable GPU support and use Skia software rendering instead. (`--disable-gpu`)
#   - none: Don't force software rendering.
c.qt.force_software_rendering = "none"

# Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
# environment variable and is useful to force using the XCB plugin when
# running QtWebEngine on Wayland.
# Type: String
c.qt.force_platform = None

# Which Chromium process model to use. Alternative process models use
# less resources, but decrease security and robustness. See the
# following pages for more details:    -
# https://www.chromium.org/developers/design-documents/process-models
# - https://doc.qt.io/qt-5/qtwebengine-features.html#process-models
# Type: String
# Valid values:
#   - process-per-site-instance: Pages from separate sites are put into separate processes and separate visits to the same site are also isolated.
#   - process-per-site: Pages from separate sites are put into separate processes. Unlike Process per Site Instance, all visits to the same site will share an OS process. The benefit of this model is reduced memory consumption, because more web pages will share processes. The drawbacks include reduced security, robustness, and responsiveness.
#   - single-process: Run all tabs in a single process. This should be used for debugging purposes only, and it disables `:open --private`.
c.qt.process_model = "process-per-site-instance"

# When to use Chromium's low-end device mode. This improves the RAM
# usage of renderer processes, at the expense of performance.
# Type: String
# Valid values:
#   - always: Always use low-end device mode.
#   - auto: Decide automatically (uses low-end mode with < 1 GB available RAM).
#   - never: Never use low-end device mode.
c.qt.low_end_device_mode = "auto"

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 in the environment. It's off by default
# as it can cause issues with some bitmap fonts. As an alternative to
# this, it's possible to set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = False

# Time interval (in milliseconds) between auto-saves of
# config/cookies/etc.
# Type: Int
c.auto_save.interval = 15000

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = False

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = None

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = True

# Remember the last used download directory.
# Type: Bool
c.downloads.location.remember = True

# What to display in the download filename input.
# Type: String
# Valid values:
#   - path: Show only the download path.
#   - filename: Show only download filename.
#   - both: Show download path and filename.
c.downloads.location.suggestion = "path"

# Which categories to show (in which order) in the :open completion.
# Type: FlagList
# Valid values:
#   - searchengines
#   - quickmarks
#   - bookmarks
#   - history
c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
]

# Default program used to open downloads. If null, the default internal
# handler is used. Any `{}` in the string will be expanded to the
# filename, else the filename will be appended.
# Type: String
c.downloads.open_dispatcher = None

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = "top"

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = -1

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
# c.editor.command = ["vim", "-f", "{file}", "-c", "normal {line}G{column0}l"]
c.editor.command = ["st", "-e", "nvim", "{file}"]

# Encoding to use for the editor.
# Type: Encoding
c.editor.encoding = "utf-8"

# Allow Escape to quit the crash reporter.
# Type: Bool
c.input.escape_quits_reporter = True

# Which unbound keys to forward to the webview in normal mode.
# Type: String
# Valid values:
#   - all: Forward all unbound keys.
#   - auto: Forward unbound non-alphanumeric keys.
#   - none: Don't forward any keys.
c.input.forward_unbound_keys = "auto"

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# Enter insert mode if an editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_enter = True

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = True

# Switch to insert mode when clicking flash and other plugins.
# Type: Bool
c.input.insert_mode.plugins = False

# Leave insert mode when starting a new page load. Patterns may be
# unreliable on this setting, and they may match the url you are
# navigating to, or the URL you are navigating from.
# Type: Bool
c.input.insert_mode.leave_on_load = True

# Include hyperlinks in the keyboard focus chain when tabbing.
# Type: Bool
c.input.links_included_in_focus_chain = True

# Timeout (in milliseconds) for partially typed key bindings. If the
# current input forms only partial matches, the keystring will be
# cleared after this time.
# Type: Int
c.input.partial_timeout = 5000

# Enable Opera-like mouse rocker gestures. This disables the context menu.
# Type: Bool
c.input.mouse.rocker_gestures = False

# Enable spatial navigation. Spatial navigation consists in the ability
# to navigate between focusable elements in a Web page, such as
# hyperlinks and form controls, by using Left, Right, Up and Down arrow
# keys. For example, if the user presses the Right key, heuristics
# determine whether there is an element he might be trying to reach
# towards the right and which element he probably wants.
# Type: Bool
c.input.spatial_navigation = False

# Keychains that shouldn't be shown in the keyhint dialog. Globs are
# supported, so `;*` will blacklist all keychains starting with `;`. Use
# `*` to disable keyhints.
# Type: List of String
c.keyhint.blacklist = []

# Rounding radius (in pixels) for the edges of the keyhint dialog.
# Type: Int
c.keyhint.radius = 0

# Time (in milliseconds) from pressing a key to seeing the keyhint
# dialog.
# Type: Int
c.keyhint.delay = 500

# Duration (in milliseconds) to show messages in the statusbar for. Set
# to 0 to never clear messages.
# Type: Int
c.messages.timeout = 2000

# Show a filebrowser in upload/download prompts.
# Type: Bool
c.prompt.filebrowser = True

# Rounding radius (in pixels) for the edges of prompts.
# Type: Int
c.prompt.radius = 0

# When to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
c.scrolling.bar = "when-searching"

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Languages to use for spell checking. You can check for available
# languages and install dictionaries using scripts/dictcli.py. Run the
# script with -h/--help for instructions.
# Type: List of String
# Valid values:
#   - af-ZA: Afrikaans (South Africa)
#   - bg-BG: Bulgarian (Bulgaria)
#   - ca-ES: Catalan (Spain)
#   - cs-CZ: Czech (Czech Republic)
#   - da-DK: Danish (Denmark)
#   - de-DE: German (Germany)
#   - el-GR: Greek (Greece)
#   - en-AU: English (Australia)
#   - en-CA: English (Canada)
#   - en-GB: English (United Kingdom)
#   - en-US: English (United States)
#   - es-ES: Spanish (Spain)
#   - et-EE: Estonian (Estonia)
#   - fa-IR: Farsi (Iran)
#   - fo-FO: Faroese (Faroe Islands)
#   - fr-FR: French (France)
#   - he-IL: Hebrew (Israel)
#   - hi-IN: Hindi (India)
#   - hr-HR: Croatian (Croatia)
#   - hu-HU: Hungarian (Hungary)
#   - id-ID: Indonesian (Indonesia)
#   - it-IT: Italian (Italy)
#   - ko: Korean
#   - lt-LT: Lithuanian (Lithuania)
#   - lv-LV: Latvian (Latvia)
#   - nb-NO: Norwegian (Norway)
#   - nl-NL: Dutch (Netherlands)
#   - pl-PL: Polish (Poland)
#   - pt-BR: Portuguese (Brazil)
#   - pt-PT: Portuguese (Portugal)
#   - ro-RO: Romanian (Romania)
#   - ru-RU: Russian (Russia)
#   - sh: Serbo-Croatian
#   - sk-SK: Slovak (Slovakia)
#   - sl-SI: Slovenian (Slovenia)
#   - sq: Albanian
#   - sr: Serbian
#   - sv-SE: Swedish (Sweden)
#   - ta-IN: Tamil (India)
#   - tg-TG: Tajik (Tajikistan)
#   - tr-TR: Turkish (Turkey)
#   - uk-UA: Ukrainian (Ukraine)
#   - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = []

# When to show the statusbar.
# Type: String
c.statusbar.show = "always"

# Padding (in pixels) for the statusbar.
# Type: Padding
c.statusbar.padding = {"bottom": 2, "left": 0, "right": 0, "top": 2}

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = "bottom"

# List of widgets displayed in the statusbar.
# Type: List of String
# Valid values:
#   - url: Current page URL.
#   - scroll: Percentage of the current page position like `10%`.
#   - scroll_raw: Raw percentage of the current page position like `10`.
#   - history: Display an arrow when possible to go back/forward in history.
#   - tabs: Current active tab, e.g. `2`.
#   - keypress: Display pressed keys when composing a vi command.
#   - progress: Progress bar for the current page loading.
c.statusbar.widgets = [
    "keypress",
    "url",
    "scroll",
    "history",
    "tabs",
    "progress",
]

# What search to start when something else than a URL is entered.
# Type: String
# Valid values:
#   - naive: Use simple/naive check.
#   - dns: Use DNS requests (might be slow!).
#   - never: Never search automatically.
c.url.auto_search = "naive"

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = "about:blank"

# URL segments where `:navigate increment/decrement` will search for a
# number.
# Type: FlagList
# Valid values:
#   - host
#   - port
#   - path
#   - query
#   - anchor
c.url.incdec_segments = ["path", "query"]

# Open base URL of the searchengine if a searchengine shortcut is
# invoked without parameters.
# Type: Bool
c.url.open_base_url = True

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "ag": "http://anigrab.herokuapp.com/?keyword={}",
    "au": "https://aur.archlinux.org/packages/?O=0&K={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "dc": "http://www.deviantart.com/?q={}",
    "dz": "https://www.deezer.com/search/{}",
    "fa": "https://fontawesome.com/icons?d=gallery&q={}",
    "g": "https://www.google.com/search?hl=en&q={}",
    "gh": "https://github.com/search?q={}",
    "gl": "https://gitlab.com/search?search={}",
    "hd": "https://hub.docker.com/search?q={}&type=image",
    "mal": "https://myanimelist.net/search/all?q={}",
    "js": "https://www.npmjs.com/search?q={}",
    "py": "https://pypi.org/search/?q={}",
    "r": "https://www.reddit.com/search/?q={}",
    "wp": "https://id.wikipedia.org/w/index.php?search={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "gc": "https://scholar.google.com/scholar?hl=id&q={}",
}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = "about:blank"

# URL parameters to strip with `:yank url`.
# Type: List of String
c.url.yank_ignored_parameters = [
    "ref",
    "utm_source",
    "utm_medium",
    "utm_campaign",
    "utm_term",
    "utm_content",
]

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = True

# Format to use for the window title. The same placeholders like for
# `tabs.title.format` are defined.
# Type: FormatString
c.window.title_format = "{perc}{current_title}{title_sep}qutebrowser"

# Loading autoconfig.yml
# When a config.py file exists, autoconfig.yml is not loaded automatically.
# To load autoconfig.yml automatically, add the following snippet to config.py
config.load_autoconfig()
