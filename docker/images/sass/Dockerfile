FROM google/dart

RUN mkdir /opt/src
COPY ./sass /opt
RUN chmod +x /opt/sass
WORKDIR /opt

ENTRYPOINT ["/opt/sass", "--watch", "/opt/src/scss/app.scss:/opt/src/public/assets/css/index.css"]