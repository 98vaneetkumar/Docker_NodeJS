FROM ubuntu

RUN sudo apt-get update
RUN sudo apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN sudo apt-get upgrade    
RUN sudo apt-get install -y nodejs
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js

RUN npm install

ENTRYPOINT ["node",'index.js']


#This is direct way to run node Js (We have package node inside the docker so that's why we use directly.)

FROM node
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js
RUN npm install
ENTRYPOINT ["node",'index.js']




# docker build -t youtube-nodejs
# -it ---- interactive container instance
# docker run -it youtube-nodejs

# mapping the port

# docker run -it -p 8000:8000 youtube-nodejs

#  -e -- environmnet

# docker run -it -e PORT=8000 -p 4000:4000 123213213(this is id of image no need to send full key set only some values)
