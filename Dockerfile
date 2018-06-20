FROM microsoft/dotnet:latest
MAINTAINER Luis Roberto Perez<luis.robertop87@gmail.com>
# Install required packages
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      ca-certificates \           
      apt-transport-https \
	  zip \
	  git \
	  curl \
	  wget \
	  bzip2 \
	  jq

ENV HOME /root

# Install Node.js
RUN apt-get install --yes curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

# install npm tools
RUN npm install --global bower gulp-cli @angular/cli

# Set dotnet tools path
ENV PATH="/root/.dotnet/tools:${PATH}"

# Install sonarscanner for dotnet
RUN dotnet tool install --global dotnet-sonarscanner --version 4.3.1
