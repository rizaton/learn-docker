# FROM Instruction
docker build -t rizaton/from from

docker image ls

# RUN Instruction
docker build -t rizaton/run run

docker build -t rizaton/run run --progress=plain --no-cache

# CMD Instruction
docker build -t rizaton/command command

docker image inspect rizaton/command

docker container create --name command rizaton/command

docker container start command

docker container logs command

# LABEL Instruction
docker build -t rizaton/label label

docker image inspect rizaton/label

# ADD Instruction
docker build -t rizaton/add add

docker image inspect rizaton/add

docker container create --name add rizaton/add

docker container start add

docker container logs add

# ADD Instruction
docker build -t rizaton/copy copy

docker image inspect rizaton/copy

docker container create --name copy rizaton/copy

docker container start copy

docker container logs copy

# Docker Ignore
docker build -t rizaton/ignore ignore

docker container create --name ignore rizaton/ignore

docker container start ignore

docker container logs ignore

# EXPOSE Instruction
docker build -t rizaton/expose expose

docker image inspect rizaton/expose

docker container create --name expose -p 8080:8080 rizaton/expose

docker container start expose

docker container logs expose

# ENV Instruction
docker build -t rizaton/env env

docker image inspect rizaton/env

docker container create --name env --env APP_PORT=9090 -p 9090:9090 rizaton/env

docker container start env

docker container logs env

docker container stop env

# VOLUME Instruction
docker build -t rizaton/volume volume

docker image inspect rizaton/volume

docker container create --name volume -p 8080:8080 rizaton/volume

docker container start volume

docker container logs volume

docker container stop volume

docker container inspect volume

# WORKDIR Instruction
docker build -t rizaton/workdir workdir

docker container create --name workdir -p 8080:8080 rizaton/workdir

docker container start workdir

docker container logs workdir

docker container exec -it workdir /bin/sh

docker container stop workdir

# WORKDIR Instruction
docker build -t rizaton/user user

docker container create --name user -p 8080:8080 rizaton/user

docker container start user

docker container logs user

docker container exec -it user /bin/sh

docker container stop user

# ARG Instruction
docker build -t rizaton/arg arg --build-arg app=rizaton

docker container create --name arg -p 8080:8080 rizaton/arg

docker container start arg

docker container exec -it arg /bin/sh

docker container logs arg

# HEALTHCHECK Instruction
docker build -t rizaton/health health

docker container create --name health -p 8080:8080 rizaton/health

docker container start health

docker container ls

#  ENTRYPOINT Instruction
docker build -t rizaton/entrypoint entrypoint

docker image inspect rizaton/entrypoint

docker container create --name entrypoint -p 8080:8080 rizaton/entrypoint

docker container start entrypoint

docker container inspect entrypoint

#  Multi Stage Build
docker build -t rizaton/multi multi

docker image ls

docker container create --name multi -p 8080:8080 rizaton/multi

docker container start multi

docker container inspect multi

# Docker push
docker login -u rizaton

docker push rizaton/multi

# Docker push custom repository - Digital Ocean
docker tag rizaton/multi registry.digitalocean.com/rizaton/multi

docker --config /Users/rizaton/.docker-digital-ocean/ push registry.digitalocean.com/rizaton/multi

docker --config /Users/rizaton/.docker-digital-ocean/ pull registry.digitalocean.com/rizaton/multi
