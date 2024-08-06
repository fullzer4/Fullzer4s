FROM golang:1.22.5 as builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch

COPY --from=builder /app/main /main
COPY --from=builder /app/templates /templates

EXPOSE 8080

CMD ["/main"]

