# to build: docker build --no-cache -t circuitjs1 .
# to run: docker run -p 8080:80 cirjs1tj
FROM httpd:2.4-alpine
RUN apk add --no-cache git
RUN git clone https://github.com/raquelhortab/circuitjs1.git
RUN ls circuitjs1/war/
RUN cp -r circuitjs1/war/. /usr/local/apache2/htdocs/
