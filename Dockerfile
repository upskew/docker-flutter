FROM cirrusci/flutter

# Disable Google Analytics
RUN flutter config --no-analytics

# Switch to master channel
RUN flutter channel master

# Install Node.js
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get -y install nodejs
