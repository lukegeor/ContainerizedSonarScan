#!/bin/bash

SONAR_TOKEN=c8187e0b2ece7a03324d2cacd929e2ed7271b6fb
dotnet sonarscanner begin /o:lukegeor /k:lukegeor_containerscan /d:sonar.token=$SONAR_TOKEN /d:sonar.host.url=https://sonarcloud.io /d:sonar.verbose=true /d:sonar.log.level=TRACE
make build
dotnet sonarscanner end /d:sonar.token=$SONAR_TOKEN