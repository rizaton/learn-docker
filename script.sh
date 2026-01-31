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