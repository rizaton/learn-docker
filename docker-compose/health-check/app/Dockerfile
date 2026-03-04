FROM golang:alpine3.23

RUN apk --no-cache add curl
RUN mkdir app

COPY main.go app

EXPOSE 8080

CMD ["go", "run", "app/main.go"]