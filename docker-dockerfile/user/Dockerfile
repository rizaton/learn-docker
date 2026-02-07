FROM golang:alpine3.23

RUN mkdir /app

WORKDIR /app

RUN addgroup -S rizatongroup
RUN adduser -S -D -h /app rizatonuser rizatongroup
RUN chown -R rizatonuser:rizatongroup /app

USER rizatonuser

COPY main.go /app

EXPOSE 8080

CMD ["go", "run", "main.go"]