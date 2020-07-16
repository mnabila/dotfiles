# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 100

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = "50%"

# Move on to the next part when there's only one possible completion
# left.
# Type: Bool
c.completion.quick = True

# When to show the autocompletion window.
# Type: String
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = "always"

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = False

# Width (in pixels) of the scrollbar in the completion window.
# Type: Int
c.completion.scrollbar.width = 10

# Padding (in pixels) of the scrollbar handle in the completion window.
# Type: Int
c.completion.scrollbar.padding = 2

# Format of timestamps (e.g. for the history completion). See
# https://sqlite.org/lang_datefunc.html for allowed substitutions.
# Type: String
c.completion.timestamp_format = "%Y-%m-%d"

# A list of patterns which should not be shown in the history. This only
# affects the completion. Matching URLs are still saved in the history
# (and visible on the qute://history page), but hidden in the
# completion. Changing this setting will cause the completion history to
# be regenerated on the next start, which will take a short while.
# Type: List of UrlPattern
c.completion.web_history.exclude = []

# Number of URLs to show in the web history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.web_history.max_items = -1

# Delay (in milliseconds) before updating completions after typing a
# character.
# Type: Int
c.completion.delay = 0

# Minimum amount of characters needed to update completions.
# Type: Int
c.completion.min_chars = 1

# Execute the best-matching command on a partial match.
# Type: Bool
c.completion.use_best_match = False

