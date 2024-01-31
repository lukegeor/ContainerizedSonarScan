.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS = -ec
DOTNETSDK_IMAGE := mcr.microsoft.com/dotnet/sdk:8.0
RUNTIME ?= win10-x64

# Run all targets regardless of the timestamps of any files
.PHONY: *

build:
	docker run --rm -w /wd -v $(CURDIR)/..:/wd:z $(DOTNETSDK_IMAGE) <<'EOF'
		dotnet publish -c Release -r $(RUNTIME) /wd/ContainerizedSonarScan.sln
	EOF

test: build
	docker run --rm -w /wd -v $(CURDIR)/..:/wd:z $(DOTNETSDK_IMAGE) << 'EOF'
		dotnet test -c Release -r $(RUNTIME) /wd/ContainerizedSonarScan.sln
	EOF
