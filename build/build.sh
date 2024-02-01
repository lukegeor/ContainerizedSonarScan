#!/bin/bash

dotnet sonarscanner begin /o:lukegeor /k:lukegeor_containerscan /d:sonar.token=$SONAR_TOKEN /d:sonar.host.url=https://sonarcloud.io /d:sonar.verbose=true /d:sonar.log.level=TRACE
make build
dotnet sonarscanner end /d:sonar.token=$SONAR_TOKEN
