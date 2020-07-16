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

config.bind("gh", "home", "normal")
config.bind("<Ctrl-Shift-J>", "tab-move +", "normal")
config.bind("<Ctrl-Shift-K>", "tab-move -", "normal")
config.bind("zl", "spawn --userscript qute-pass -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind("zul", "spawn --userscript qute-pass -e -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind("zpl", "spawn --userscript qute-pass -w -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
config.bind("zol", "spawn --userscript qute-pass -o -d 'dmenu -w 800 -x 300 -y 220 -i -l 10 -p Qute Pass' ", "normal")
