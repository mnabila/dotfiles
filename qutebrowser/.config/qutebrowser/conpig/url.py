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
    "fa": "https://fontawesome.com/search?q={}",
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
    "nyaa": "https://nyaa.si/?q={}",
    "go": "https://pkg.go.dev/search?q={}"
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
