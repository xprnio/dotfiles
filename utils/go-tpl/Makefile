SOURCE := cmd/main.go
BINARY_NAME := go-tpl
BUILD_DIR := bin

GOCMD := go
GOTOOL := $(GOCMD) tool
GOTEST := $(GOCMD) test
GOBUILD := $(GOCMD) build
GOCLEAN := $(GOCMD) clean

.PHONY: clean test build
all: clean test build

clean:
	$(GOCLEAN) -testcache
	rm -rf "$(BUILD_DIR)/$(BINARY_NAME)"

test: clean
	$(GOTEST) -v ./...

coverage.out: test
	$(GOTEST) -coverprofile=coverage.out -v ./...

cover: coverage.out
	$(GOTOOL) cover -html=coverage.out

build: clean
	$(GOBUILD) -o "$(BUILD_DIR)/$(BINARY_NAME)" $(SOURCE)

