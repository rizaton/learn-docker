FROM golang:alpine3.23

RUN apk add --no-cache curl ca-certificates
RUN mkdir app
COPY main.go app

EXPOSE 8080

HEALTHCHECK --interval=5s --start-period=5s CMD [ "curl", "-f", "http://localhost:8080/health" ]

CMD [ "go", "run", "app/main.go" ]