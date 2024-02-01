.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS = -ec
DOTNETSDK_IMAGE := dotnet-build
RUNTIME ?= win-x64
UID=$(shell id -u)
GID=$(shell id -g)
USERS=-u $(UID):$(GID)

# Run all targets regardless of the timestamps of any files
.PHONY: *

dockerprep:
	docker build -t $(DOTNETSDK_IMAGE) - < ./Dockerfile

build: dockerprep
	docker run -i $(USERS) --rm -w /home/lgeorgalas/repos/ContainerizedSonarScan/build --entrypoint /bin/bash -v /tmp:/tmp -v $(CURDIR)/..:/home/lgeorgalas/repos/ContainerizedSonarScan:z $(DOTNETSDK_IMAGE) -e <<'EOF'
		dotnet publish -c Release -r $(RUNTIME) ../ContainerizedSonarScan.sln
	EOF

test: dockerprep build
	docker run -i $(USERS) --rm -w /home/lgeorgalas/repos/ContainerizedSonarScan/build --entrypoint /bin/bash -v /tmp:/tmp -v $(CURDIR)/..:/home/lgeorgalas/repos/ContainerizedSonarScan:z $(DOTNETSDK_IMAGE) -e << 'EOF'
		dotnet test -c Release -r $(RUNTIME) ../ContainerizedSonarScan.sln
	EOF

build-no-docker:
	DOTNET_NUGET_SIGNATURE_VERIFICATION=false dotnet publish -c Release -r $(RUNTIME) ../ContainerizedSonarScan.sln

test-no-docker: build-no-docker
	DOTNET_NUGET_SIGNATURE_VERIFICATION=false dotnet test -c Release -r $(RUNTIME) ../ContainerizedSonarScan.sln
