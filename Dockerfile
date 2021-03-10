# Start by building the application.
FROM golang:buster as build

WORKDIR /go/src/app
ADD . /go/src/app

RUN go build -o /go/bin/app

# Now copy it into our base image.
FROM gcr.io/distroless/base-debian10
COPY --from=build /go/bin/app /
CMD ["/app"]