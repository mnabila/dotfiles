# When a hint can be automatically followed without pressing Enter.
# Type: String
# Valid values:
#   - always: Auto-follow whenever there is only a single hint on a page.
#   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
#   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
#   - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = "unique-match"

# Duration (in milliseconds) to ignore normal-mode key bindings after a
# successful auto-follow.
# Type: Int
c.hints.auto_follow_timeout = 0

# CSS border value for hints.
# Type: String
c.hints.border = "1px solid #E3BE23"

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = "asdfghjkl"

# Dictionary file to be used by the word hints.
# Type: File
c.hints.dictionary = "/usr/share/dict/words"

# Hide unmatched hints in rapid mode.
# Type: Bool
c.hints.hide_unmatched_rapid_hints = True

# Minimum number of characters used for hint strings.
# Type: Int
c.hints.min_chars = 1

# Mode to use for hints.
# Type: String
# Valid values:
#   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
#   - letter: Use the characters in the `hints.chars` setting.
#   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = "letter"

# Comma-separated list of regular expressions to use for 'next' links.
# Type: List of Regex
c.hints.next_regexes = [
    "\\bnext\\b",
    "\\bmore\\b",
    "\\bnewer\\b",
    "\\b[>→≫]\\b",
    "\\b(>>|»)\\b",
    "\\bcontinue\\b",
]

# Comma-separated list of regular expressions to use for 'prev' links.
# Type: List of Regex
c.hints.prev_regexes = [
    "\\bprev(ious)?\\b",
    "\\bback\\b",
    "\\bolder\\b",
    "\\b[<←≪]\\b",
    "\\b(<<|«)\\b",
]

# Scatter hint key chains (like Vimium) or not (like dwb). Ignored for
# number hints.
# Type: Bool
c.hints.scatter = True

# Make characters in hint strings uppercase.
# Type: Bool
c.hints.uppercase = False

# Leave hint mode when starting a new page load.
# Type: Bool
c.hints.leave_on_load = True

