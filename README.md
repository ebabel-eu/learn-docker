# Learn Docker

## Run locally
```shell
npm install
npm start
```

Browse to http://localhost:8081

## Build locally without running
```shell
npm run build
```

The result is in the `public` folder. Note that folder gets deleted and re-created, so all files in `public` should be generated from the `src` folder.

## Run as a Docker container
Note: the Docker container doesn't have anything but nginx and static files.

Create an image (this is only done once):

```shell
docker build -t learn-docker-image .
```

Create a container and run it:

```shell
docker run --name learn-docker-container -d -p 8080:80 learn-docker-image
```

Browse to http://localhost:8080

## More Docker commands

- List all processes, even if not running: `docker ps -a`
- Stop a container: `docker stop learn-docker-container`
- Delete a container: `docker rm learn-docker-container`
- List all the local images: `docker images`
- Delete an image: `docker image rm learn-docker-image`

## todo
- Read from a database
- Generate a static page from a template and data from the database
- Build admin forms to easily manage the data in the database
