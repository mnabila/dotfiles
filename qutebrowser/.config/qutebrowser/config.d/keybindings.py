# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {
    "<Ctrl+6>": "<Ctrl+^>",
    "<Ctrl+Enter>": "<Ctrl+Return>",
    "<Ctrl+j>": "<Return>",
    "<Ctrl+m>": "<Return>",
    "<Ctrl+[>": "<Escape>",
    "<Enter>": "<Return>",
    "<Shift+Enter>": "<Return>",
    "<Shift+Return>": "<Return>",
}

config.bind("<Ctrl-Shift-J>", "tab-move +", "normal")
config.bind("<Ctrl-Shift-K>", "tab-move -", "normal")
config.bind("zl", "spawn --userscript qute-pass -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind("zul", "spawn --userscript qute-pass -e -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind("zpl", "spawn --userscript qute-pass -w -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind("zol", "spawn --userscript qute-pass -o -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind(",y1", "hint links spawn youtube-viewer --auto-caption --resolution=144p {hint-url}", "normal")
config.bind(",y2", "hint links spawn youtube-viewer --auto-caption --resolution=240p {hint-url}", "normal")
config.bind(",y3", "hint links spawn youtube-viewer --auto-caption --resolution=360p {hint-url}", "normal")
config.bind(",y4", "hint links spawn youtube-viewer --auto-caption --resolution=480p {hint-url}", "normal")
config.bind(",y7", "hint links spawn youtube-viewer --auto-caption --resolution=720p {hint-url}", "normal")
config.bind(",y10", "hint links spawn youtube-viewer --auto-caption --resolution=1080p {hint-url}", "normal")
