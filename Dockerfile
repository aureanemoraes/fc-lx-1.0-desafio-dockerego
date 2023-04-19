

## references:
# https://levelup.gitconnected.com/optimize-the-size-of-your-dockerized-go-application-down-to-2mb-7b826ecb062d 
# https://github.com/AlessioCoser/minimal-docker-container-for-golang


FROM golang:alpine3.17
WORKDIR /go/src/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo -o app .

FROM scratch
WORKDIR /
COPY --from=0 /go/src/app /
CMD ["/app"]