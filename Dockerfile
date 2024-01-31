FROM node:14.5.0

# Installing node-gyp dependencies and git
# RUN apt-get -y update
# RUN apt-get -y install build-essential
# RUN apt-get install -y git

# Installing golang
RUN curl -O https://dl.google.com/go/go1.14.6.linux-amd64.tar.gz
RUN sha256sum go1.14.6.linux-amd64.tar.gz
RUN tar xvf go1.14.6.linux-amd64.tar.gz
RUN chown -R root:root ./go
RUN mv go /usr/local
ENV PATH=$PATH:/usr/local/go/bin

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install
RUN npm install -g node-gyp@7.1.2
RUN node-gyp -v

# Copy the application files to the working directory
COPY . .

# Expose the port on which your app will run
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "start"]

# Installing node-gyp
