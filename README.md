# app

app app

## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

Already a pro? Just edit this README.md and make it your own. Want to make it easy? [Use the template at the bottom](#editing-this-readme)!

# Docker Commands


docker build -t youtube-nodejs
-it ---- interactive container instance
docker run -it youtube-nodejs

mapping the port

docker run -it -p 8000:8000 youtube-nodejs

 -e -- environmnet

docker run -it -e PORT=8000 -p 4000:4000 123213213(this is id of image no need to send full key set only some values)

# Docker Script

FROM ubuntu
RUN sudo apt-get update
RUN sudo apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN sudo apt-get upgrade    
RUN sudo apt-get install -y nodejs

COPY package*.json ./
 # Or
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js

RUN npm install

ENTRYPOINT ["node",'index.js']


## Docker Script for node js

FROM node
COPY package*.json ./
COPY index.js index.js
RUN npm install
ENTRYPOINT ["node",'index.js']


# Docker install node js latest version

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - && sudo apt-get install -y nodejs


# Some points

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


RUN npm install
# If you are building your code for production
# RUN npm ci --only=production


# Bundle app source
COPY . .
EXPOSE 3000
CMD [ "node", "server.js" ]



# Notes

1.  Building Docker image
       docker build -t node-web-app .

2.  Check the Docker images
        docker images

3.  Run the docker image
        docker run -p 49160:3000 -d node-web-app

4.  Get the container id
         docker ps

5.  Lets know where it is running on
         docker logs <container_id>

6. docker-compose up --build
7. docker-compose down --build   
8. docker-compose up -d
            