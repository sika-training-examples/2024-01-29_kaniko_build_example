FROM golang:1.21 as build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build

FROM debian:12-slim
COPY --from=build /build/helloworld /usr/local/bin/helloworld
CMD [ "/usr/local/bin/helloworld" ]
