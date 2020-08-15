FROM cirrusci/flutter

# Disable Google Analytics
RUN flutter config --no-analytics

# Switch to master channel
RUN flutter channel master

# Upgrade Flutter
RUN flutter upgrade

# Run Flutter doctor
RUN flutter doctor -v

# Install Node.js
RUN sudo apt-get update
RUN sudo apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN sudo apt-get -y install nodejs

# Install sqlite
RUN sudo apt-get -y install sqlite3 libsqlite3-dev
