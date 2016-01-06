FROM debian
MAINTAINER Tobias Hofmann <tobi...@gmail.com>
WORKDIR /tmp
# update apt and install apache2, wget and unzip
RUN apt-get update \
    && apt-get install -y \
    apache2 \
    unzip \
    git \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install nodejs -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# install grunt
RUN npm install grunt-cli -g \
    && git clone https://github.com/SAP/openui5.git
WORKDIR /tmp/openui5
# build and install openui5
RUN curl -sL https://raw.githubusercontent.com/tobiashofmann/docker-openui5-rt/master/create.sh | bash -
WORKDIR /tmp
# clean up
RUN rm -R /tmp/*
EXPOSE 80
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND
