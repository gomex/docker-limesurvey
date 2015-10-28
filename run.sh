#!/bin/bash
chown www-data:www-data /app -R

if [ "$ALLOW_OVERRIDE" = "**False**" ]; then
    unset ALLOW_OVERRIDE
else
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
    a2enmod rewrite
fi

source /etc/apache2/envvars

## Persisting limesurvey configuration files

if [ ! -e /app/limesurvey/application/config/index.html ] ; then cp -r /app/limesurvey/application/config-sample/* /app/limesurvey/application/config/ ; fi

tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND
