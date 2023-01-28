#!/bin/bash

set -e

CUR=`pwd`

for CONF in `find ${CUR}/sites-available/ -type f` ; do
  ln -f -s ${CONF} /etc/nginx/sites-enabled/
done

for CONF in `find ${CUR}/stream-available/ -type f` ; do
  ln -f -s ${CONF} /etc/nginx/stream-enabled/
done

for CONF in `find ${CUR}/consul-template.d/conf/ -type f -name "*.conf"` ; do
  ln -f -s ${CONF} /etc/consul-template.d/conf/
done

for TMPL in `find ${CUR}/consul-template.d/templates/ -type f -name "*.tmpl"` ; do
  ln -f -s ${TMPL} /etc/consul-template.d/templates/
done

exit 0
