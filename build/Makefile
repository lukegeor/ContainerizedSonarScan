.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS = -ec
DOTNETSDK_IMAGE := mcr.microsoft.com/dotnet/sdk:8.0
RUNTIME ?= win-x64

# Run all targets regardless of the timestamps of any files
.PHONY: *

build:
	docker run -i --rm -w /wd --entrypoint /bin/bash -v $(CURDIR)/..:/wd:z $(DOTNETSDK_IMAGE) -e <<'EOF'
		dotnet publish -c Release -r $(RUNTIME) /wd/ContainerizedSonarScan.sln
	EOF

test: build
	docker run -i --rm -w /wd --entrypoint /bin/bash -v $(CURDIR)/..:/wd:z $(DOTNETSDK_IMAGE) -e << 'EOF'
		dotnet test -c Release -r $(RUNTIME) /wd/ContainerizedSonarScan.sln
	EOF
