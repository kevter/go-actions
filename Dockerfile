# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang:1.16-alpine

# Copy the local package files to the container's workspace.
COPY . /go/src/github.com/kevter/go-actions
WORKDIR /go/src/github.com/kevter/go-actions

# Build the outyet command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
# RUN go install github.com/kevter/go-actions
RUN go get ./
RUN go build -o go-actions

# # Run the outyet command by default when the container starts.
# ENTRYPOINT /go/bin/go-actions
CMD ./go-actions

# Document that the service listens on port 8081.
EXPOSE 8081