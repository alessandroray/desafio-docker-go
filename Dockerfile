FROM golang:1.21-alpine as builder

WORKDIR /usr/src/app

COPY ./main.go /usr/src/app/

RUN go mod init alessandroray/fullcycle

RUN CGO_ENABLED=0 go build main.go
 
CMD ["./main"]

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/main main

CMD ["./main"]