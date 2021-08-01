#!/bin/sh
DEV_URL=${DEV_URL:-http://0.0.0.0:3000/electronics/js/iframe_comunication.js}
DEV_SCRIPT="<script language=\"javascript\" src=\"$DEV_URL\"></script>"
echo "Gonna check if development changes need to be made"
if [ "$BUILD_ENV" = "development" ]; then
  cd /usr/local/apache2
  echo "We are in development, making some changes"
  mkdir circuitjs1/war/dev
  cp circuitjs1/war/circuitjs.html circuitjs1/war/dev/circuitjs.html
  sed -i "176s|.*|$DEV_SCRIPT|" circuitjs1/war/dev/circuitjs.html
  cp circuitjs1/war/dev/circuitjs.html circuitjs1/war/circuitjs.html
  cp -r circuitjs1/war/. /usr/local/apache2/htdocs/
  echo "Changed the communication script url, now being:"
  awk 'NR==176' /usr/local/apache2/circuitjs1/war/circuitjs.html
else
  echo "We are in production so no changes where made"
fi
echo "Done."
