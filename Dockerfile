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
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get -y install nodejs

# Install sqlite
RUN apt-get -y install sqlite3 libsqlite3-dev
