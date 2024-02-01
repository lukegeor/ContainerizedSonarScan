#!/bin/bash

dotnet sonarscanner begin /o:lukegeor /k:lukegeor_containerscan /d:sonar.token=$SONAR_TOKEN /d:sonar.host.url=https://sonarcloud.io
make build-no-docker
#dotnet sonarscanner end /d:sonar.token=$SONAR_TOKEN
