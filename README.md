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
DB_HOST = "database host"
DB_USER = "database username - not root !"
DB_PASSWORD = "database password"
DB_NAME = "database name"
```

## Run in Host machine instead of Docker
During development, continuously build when code changes and serve the local files with 11ty

Note that running locally instead of in Docker assumes there is a local database on your host machine.
If you don't want to develop in your host machine, use the Docker process detailed below.

```shell
npm install
npm start
```

Browse to http://localhost:8088

### Build locally without running
```shell
npm run build
```

The result is in the `public` folder. Note that folder gets deleted and re-created, so all files in `public` should be generated from this repository.

Check there are no vulnerabilities in the npm dependencies with `npm audit`

## Run in a Docker container
Create a node image, build this static website, and copy it in the nginx final image:

```shell
npm run docker:build
```

Compose a container and run it:

```shell
npm run docker:compose
```

Browse to http://localhost:8088

To stop running, execute `npm run docker:stop`

### More Docker commands
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

## troubleshooting

### docker-compose: command not found
Install docker-compose:

```
sudo curl -L "https://github.com/docker/compose/releases/download/2.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```
