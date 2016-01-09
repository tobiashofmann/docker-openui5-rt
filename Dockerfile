FROM tobiashofmann/openui5-rt:1.25
MAINTAINER Tobias Hofmann <tobi...@gmail.com>
WORKDIR /tmp
RUN git clone https://github.com/SAP/openui5.git
WORKDIR /tmp/openui5
# build and install openui5 versions 1.26
RUN curl -sL https://raw.githubusercontent.com/tobiashofmann/docker-openui5-rt/1.26/create.sh | bash -
EXPOSE 80
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND