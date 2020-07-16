from glob import glob
for a in glob(f'{config.configdir}/config.d/*'):
    config.source(a)
