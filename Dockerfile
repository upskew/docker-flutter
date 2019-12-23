FROM cirrusci/flutter

# Run as ROOT
USER root

# Disable Google Analytics
RUN flutter config --no-analytics

# Artifact precache
RUN flutter precache

# Run Flutter doctor
RUN flutter doctor -v

# Switch to master channel
RUN flutter channel master

# Install Node.js
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get -y install nodejs
