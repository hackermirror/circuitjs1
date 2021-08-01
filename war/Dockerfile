# READ NOTE BELOW ABOUT RUNNING FOR DEV
# to build: docker build --no-cache -t circuitjs .
# to run: docker run -p 8080:80 circuitjs

FROM httpd:2.4-alpine
ENV BUILD_ENV=${BUILD_ENV:-production}

RUN apk add --no-cache git
RUN git clone https://github.com/hackermirror/circuitjs1.git
RUN ls circuitjs1/war/
RUN cp -r circuitjs1/war/. /usr/local/apache2/htdocs/

# !!!! NOTE FOR DEVELOPMENT !!!!
# dev_changes.sh checks for BUILD_ENV variable, which is "production" by default
# if BUILD_ENV = production, it does nothing
# if BUILD_ENV = development, it changes the line that imports the script necessary to communicate the iframe with the main window
# By default (production) it is:
# <script language="javascript" src="/electronics/js/iframe_comunication.js"></script>
# In development, by default, the script sets it to <script language=\"javascript\" src=\"$DEV_URL\"></script>
# where DEV_URL is http://0.0.0.0:3000/electronics/js/iframe_comunication.js by default but can be set passing it as an ENV variable on docker run, along with BUILD_ENV:
# docker run -e BUILD_ENV=development -e DEV_URL=http://0.0.0.0:3000/electronics/js/iframe_comunication.js  -p 8080:80 circuitjs

COPY ./dev_changes.sh /
RUN ["chmod", "+x", "/dev_changes.sh"]

USER root

CMD /dev_changes.sh && httpd-foreground



