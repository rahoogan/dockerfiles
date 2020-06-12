# Dockerfiles
A repo to store a bunch of useful solutions using docker
### Index

|--- [1. Nginx Cookies
](docker-nginx-cookies/README.md)

|--- [2. Git Private Repo
](docker_privaterepo/README.md)

|--- [3. Nginx + Flask
](docker-nginx/README.md)

# 1. Nginx Cookies

An example of a working nginx server, serving content from an upstream python webserver.
- Testing whether cookies set in response and request headers are being passed through.


# 2. Git Private Repo

This repo is based on an answer i provided on SO: https://stackoverflow.com/questions/51497325/pull-private-git-repo-in-docker-container/51580779#51580779

This allows you to automatically instantiate a private remote git repo into a container using the SSH (private key) method.

The following bash variables should be set:
```bash
# Email to configure for local container git env
export GIT_EMAIL=""

# User name to configure for local container git env
export GIT_USER=""

# Git clone URL for private repository
export GIT_URL=""

# User ID of user to launch container as
export USER_ID=""
```

An example docker-run command would be:
```bash
docker run \
  -itd \
  -e "HOME_DIR=/home/$USER_ID" \
  -e "USER_ID=$USER_ID" \
  -v /home/$USER_ID/.ssh/id_rsa:/home/$USER_ID/.ssh/id_rsa:ro \
  -v entrypoint.sh:/home/$USER_ID/entrypoint.sh \
  --user $USER_ID \
  <container ID>
```


# 3. Nginx + Flask

A simple nginx and flask server demo with redis

