FROM golang:1.24-alpine
WORKDIR /app
COPY . .
RUN go build hello.go
CMD ["./hello"]
EXPOSE 8080