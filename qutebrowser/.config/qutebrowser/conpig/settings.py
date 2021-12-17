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
    "adblock-off": "set content.blocking.enabled false",
    "adblock-on": "set content.blocking.enabled true",
}
c.confirm_quit = ["downloads"]
c.search.ignore_case = "always"
c.search.incremental = True
c.new_instance_open_target = "tab"
c.new_instance_open_target_window = "last-focused"
c.backend = "webengine"
c.downloads.position = "top"
c.downloads.remove_finished = -1
c.editor.command = ["env", "LIBGL_ALWAYS_SOFTWARE=1", "kitty", "-e", "nvim", "{file}"]
c.scrolling.bar = "when-searching"
c.scrolling.smooth = False
c.window.hide_decoration = True
c.window.title_format = "{perc}{current_title}{title_sep}qutebrowser"
c.fileselect.handler = "external"
c.fileselect.multiple_files.command = [
    "env",
    "LIBGL_ALWAYS_SOFTWARE=1",
    "kitty",
    "-e",
    "ranger",
    "--choosefiles={}",
]
c.fileselect.single_file.command = [
    "env",
    "LIBGL_ALWAYS_SOFTWARE=1",
    "kitty",
    "-e",
    "ranger",
    "--choosefile={}",
]
c.keyhint.radius = 0
