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
    "changelog": "open -t qute://help/changelog.html",
    "adblock-off" : "set content.blocking.enabled false",
    "adblock-on" : "set content.blocking.enabled true",
}
c.confirm_quit = ["downloads"]
c.search.ignore_case = "always"
c.search.incremental = True
c.new_instance_open_target = "tab-bg"
c.new_instance_open_target_window = "last-focused"
c.backend = "webengine"
c.completion.open_categories = [
    "searchengines",
    "quickmarks",
    "bookmarks",
    "history",
]
c.downloads.position = "top"
c.downloads.remove_finished = -1
c.editor.command = ["env", "LIBGL_ALWAYS_SOFTWARE=1", "kitty", "-e", "nvim", "{file}"]
c.scrolling.bar = "when-searching"
c.scrolling.smooth = False
c.statusbar.show = "always"
c.statusbar.padding = {"bottom": 2, "left": 0, "right": 0, "top": 2}
c.statusbar.position = "bottom"
c.statusbar.widgets = [
    "keypress",
    "url",
    "scroll",
    "history",
    "tabs",
    "progress",
]
c.url.default_page = "about:blank"
c.url.incdec_segments = ["path", "query"]
c.url.open_base_url = True
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
    "ytm": "https://music.youtube.com/search?q={}",
    "gc": "https://scholar.google.com/scholar?hl=id&q={}",
    "ad": "https://anidl.org/?s={}",
    "td": "https://listen.tidal.com/search?q={}",
    "nyaa": "https://nyaa.si/?q={}"
}
c.url.start_pages = "about:blank"
c.url.yank_ignored_parameters = [
    "ref",
    "utm_source",
    "utm_medium",
    "utm_campaign",
    "utm_term",
    "utm_content",
]
c.window.hide_decoration = True
c.window.title_format = "{perc}{current_title}{title_sep}qutebrowser"
