# Loading autoconfig.yml
# When a config.py file exists, autoconfig.yml is not loaded automatically.
# To load autoconfig.yml automatically, add the following snippet to config.py
config.load_autoconfig()

from glob import glob
for a in glob(f'{config.configdir}/config.d/*'):
    config.source(a)

