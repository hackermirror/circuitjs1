# we are extending everything from tomcat:8.0 image ...
FROM httpd:2.4-alpine
RUN apk add --no-cache git
RUN git clone https://github.com/raquelhortab/circuitjs1.git
RUN ls circuitjs1/war/
RUN cp -r circuitjs1/war/. /usr/local/apache2/htdocs/
