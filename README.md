# Learn Docker
Learn Docker and eleventy.

## Set database connection parameters
Create a .env file that will hold the parameters required to connect to it.
This .env file is never commited to the repository and must remain a secret.

```shell
touch .env
```

Note the values here need to be updated with the real connection secrets to your database:

```javascript
DB_HOST="database host"
DB_USER = "database username - not root !"
DB_PASSWORD = "database password"
DB_NAME = "database name"
```

## Run locally
```shell
npm install
npm start
```

Browse to http://localhost:8080

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
docker run --name learn-docker-container -d -p 8081:80 learn-docker-image
```

Browse to http://localhost:8081

## More Docker commands

- List all processes, even if not running: `docker ps -a`
- Stop a container: `docker stop learn-docker-container`
- Delete a container: `docker rm learn-docker-container`
- List all the local images: `docker images`
- Delete an image: `docker image rm learn-docker-image`

## todo
- Setup a mysql database - see https://dockerlabs.collabnix.com/intermediate/workshop/DockerCompose/Create_first_docker-compose_file_with_ngnix_and_mysql.html
- Read from a database - see tutorial on https://www.raymondcamden.com/2021/04/15/building-a-database-driven-eleventy-site
- Generate a static page from a template and data from the database.
- Build admin forms to easily manage the data in the database.
- Deploy to S3 using the aws command line, like my other sites.
