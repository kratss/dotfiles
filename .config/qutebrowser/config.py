# vim:foldmethod=marker:foldmarker=###,##

# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

import json
import os

with open(os.path.expanduser("~/.private/qute.json"), "r") as f:
    private_vars = json.load(f)
    kagi = private_vars["kagi"]
    keepassxc1 = private_vars["keepassxc"]

### Performance
c.qt.chromium.low_end_device_mode = "auto"


##
### Privacy and Security
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0",
    "https://accounts.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36",
    "https://*.slack.com/*",
)

# Load images automatically in web pages.
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")

# Enable JavaScript.
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "kagi.com")
config.set("content.javascript.enabled", True, "kagi.com/assistant")

# Allow locally loaded documents to access remote URLs.
config.set(
    "content.local_content_can_access_remote_urls",
    True,
    "file:///home/m/.local/share/qutebrowser/userscripts/*",
)
config.set(
    "content.local_content_can_access_file_urls",
    False,
    "file:///home/m/.local/share/qutebrowser/userscripts/*",
)

# Allow sites to write to (not read from) the clipboard
config.set("content.javascript.clipboard", "access-paste", "https://kagi.com")


c.content.local_storage = True

# URL parameters to strip with `:yank url`.
# Type: List of String
c.url.yank_ignored_parameters = [
    "ref",
    "utm_source",
    "utm_medium",
    "utm_campaign",
    "utm_term",
    "utm_content",
    "utm_name",
]
c.content.geolocation = False
##
### Preferences
c.url.searchengines = {
    "d": "https://duckduckgo.com/?q={}",
    "dict": "https://www.dict.cc/?s={}",
    "k": kagi,
    "l": "https://lite.duckduckgo.com/lite/?q={}",
    "DEFAULT": kagi,
}

# Time interval (in milliseconds) between auto-saves of
# config/cookies/etc.
c.auto_save.interval = 15000

config.set("content.notifications.enabled", True, "https://matrix.endor.cyou")
config.set("content.notifications.enabled", True, "https://element.endor.cyou")
config.set("content.notifications.enabled", True, "https://grok.com")
config.set("content.notifications.enabled", True, "https://*.proton.me")
config.set("content.notifications.enabled", True, "https://discord.com")
config.set("content.register_protocol_handler", False, "*.proton.me")
##
### Appearance
# Background color for hints. Note that you can use a `rgba(...)` value
c.fonts.default_size = "15pt"
c.colors.hints.bg = "rgba(6,25,35,.8)"
c.colors.hints.fg = "rgb(229,196,158)"
c.colors.statusbar.command.fg = "white"
c.colors.webpage.darkmode.enabled = False
c.content.fullscreen.window = True
c.downloads.remove_finished = 5000
c.hints.border = "0xp"
c.tabs.tabs_are_windows = True
c.tabs.show = "never"
c.tabs.position = "left"
c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"
c.window.title_format = "{audio}{private}{perc} {current_title}"
c.zoom.default = "100%"
##
### Keybindings
# Bindings for normal mode
config.unbind("f", mode="normal")
config.bind("f", "hint")
config.bind("dw", "hint all window")
config.bind("dp", "hint links run open -p {hint-url}")
config.bind("dy", "hint all yank")
config.unbind("d", mode="normal")
config.unbind("<Ctrl+q>")
# config.bind("dd", "tab-close")
config.bind(",r", "spawn --userscript readability")
config.bind("ck", "scroll-page 0 -1")
config.bind("cj", "scroll-page 0 1")
config.bind("u", "undo --window")
# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    "q": "close",
    "qa": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "wqa": "quit --save",
}

# Password manager integration
config.bind(
    "<Alt-Shift-u>",
    "spawn --userscript qute-keepassxc --key keepassxc",
    mode="insert",
)
config.bind(
    "pw",
    "spawn --userscript qute-keepassxc --key keepassxc",
    mode="normal",
)
config.bind(
    "pt", "spawn --userscript qute-keepassxc --key ABC1234 --totp", mode="normal"
)
##
### Other
c.qt.environ = {"NODE_PATH": "/usr/local/lib/node_modules"}
##

# c.content.cookies.store = False
