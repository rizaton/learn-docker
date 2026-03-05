FROM golang:alpine3.23

ENV APP_PORT=8080
ENV MODE=local

RUN mkdir app
COPY main.go app

EXPOSE ${APP_PORT}

CMD ["go", "run", "app/main.go"]