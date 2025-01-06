# vim:foldmethod=marker:foldmarker=###,##

# Include main config.py file at qutebrowser in XDG base dir
import os
_home = os.path.expanduser('~')
xdg_data_home = os.environ.get('XDG_DATA_HOME') or \
            os.path.join(_home, '.local', 'share')
xdg_config_home = os.environ.get('XDG_CONFIG_HOME') or \
            os.path.join(_home, '.config')
with open(xdg_config_home + "/qutebrowser/config.py") as file:
    exec(file.read())

c.window.title_format = 'qb[DC]{audio}{private}{title_sep}{perc} {host}'
c.colors.statusbar.command.bg = 'red'

