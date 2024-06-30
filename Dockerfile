# Flutter base image
# https://github.com/cirruslabs/docker-images-flutter
# License: MIT (https://github.com/cirruslabs/docker-images-flutter/blob/master/LICENSE)
FROM cirrusci/android-sdk:30

USER root

ENV FLUTTER_HOME=${HOME}/sdks/flutter \
    FLUTTER_VERSION=master
ENV FLUTTER_ROOT=$FLUTTER_HOME

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME} \
    && flutter channel stable \
    && flutter upgrade

RUN yes | flutter doctor --android-licenses \
    && flutter doctor \
    && chown -R root:root ${FLUTTER_HOME}

# Install Node.js
RUN sudo apt-get update
RUN sudo apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get -y install nodejs

# Install sqlite
RUN sudo apt-get -y install sqlite3 libsqlite3-dev
