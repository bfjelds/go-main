# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.
GOCMD=GO111MODULE=on GOARCH=amd64 go
GOBUILD=$(GOCMD) build -v
GOTEST=$(GOCMD) test -v
GOHOSTOS=$(strip $(shell $(GOCMD) env get GOHOSTOS))

#
MOCVER ?= $(shell go list -u -m github.com/bfjelds/go-library | awk '{print $$2}')
TAG ?= $(shell git describe --tags)
COMMIT ?= $(shell git describe --always)
BUILD_DATE ?= $(shell date -u +%m/%d/%Y)
LDFLAGS="-X main.version=$(TAG) -X main.libraryversion=$(MOCVER) -X main.commit=$(COMMIT) -X main.date=$(BUILD_DATE)"

OUTEXE=bin/main.exe
OUT=bin/main

# Active module mode, as we use go modules to manage dependencies
export GO111MODULE=on

#
PKG :=

all: format main

nofmt: main

clean:
	go clean
	rm -rf bin
.PHONY: vendor
vendor:
	go mod tidy

format:
	gofmt -s -w .

main:
	$(GOBUILD) -ldflags $(LDFLAGS) -o ${OUT} github.com/bfjelds/go-main
	${OUT}
	GOOS=windows $(GOBUILD) -ldflags $(LDFLAGS) -o ${OUTEXE} github.com/bfjelds/go-main

