#FROM Instruction
docker build -t rizaton/from from

docker image ls

#RUN Instruction
docker build -t rizaton/run run

docker build -t rizaton/run run --progress=plain --no-cache

#CMD Instruction
docker build -t rizaton/command command

docker image inspect rizaton/command

docker container create --name command rizaton/command

docker container start command

docker container logs command