FROM node:14.13.1
COPY . /workspace/learn-docker
WORKDIR "/workspace/learn-docker"
# Clean npm install with "ci" instead of "i"
RUN npm ci 
RUN npm run build

# Second stage of the build, copying from the node image to the nginx image that will serve static files.
# Note the previous stage, stage 0, will be left out of the final image, which reduces the total size of the Docker image.
FROM nginx:1.22.0
COPY --from=0 /workspace/learn-docker/public /usr/share/nginx/html
