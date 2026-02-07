# check=skip=JSONArgsRecommended
FROM golang:alpine3.23

ARG app=main

RUN mkdir app
COPY main.go app
RUN mv app/main.go app/${app}.go

EXPOSE 8080

ENV app=${app}
# CMD ["go", "run", "app/${arg}.go"]
CMD go run app/${app}.go