# Flutter base image
# https://github.com/cirruslabs/docker-images-flutter
# License: MIT (https://github.com/cirruslabs/docker-images-flutter/blob/master/LICENSE)
FROM ghcr.io/cirruslabs/android-sdk:35

USER root

ENV FLUTTER_HOME=${HOME}/sdks/flutter \
    FLUTTER_VERSION=3.38.2
ENV FLUTTER_ROOT=$FLUTTER_HOME

ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN git clone --depth 1 --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME}

RUN yes | flutter doctor --android-licenses \
    && flutter doctor \
    && chown -R root:root ${FLUTTER_HOME}

# Install Node.js
RUN sudo apt-get update
RUN sudo apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash -
RUN sudo apt-get -y install nodejs

# Verify Node.js version
RUN node -v

# Install sqlite
RUN sudo apt-get -y install sqlite3 libsqlite3-dev

# Install Git LFS
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash \
    && sudo apt-get install -y git-lfs \
    && git lfs install

# Install clang++ and lld linker
RUN sudo apt-get -y install clang lld
