FROM node:14.13.1
COPY . /workspace/learn-docker
WORKDIR "/workspace/learn-docker"

# Clean npm install with "ci" instead of "i"
RUN npm ci 
RUN npm run build

FROM nginx:1.22.0
COPY /workspace/learn-docker/public /usr/share/nginx/html
