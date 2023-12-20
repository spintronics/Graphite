FROM golang:1.21.5-bullseye

WORKDIR /app

COPY . .
COPY ../client/build/web ../client/build/web

RUN go mod download

RUN go build -o /build

EXPOSE 8080

CMD ["/build"]
