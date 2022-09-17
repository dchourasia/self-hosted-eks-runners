#!/bin/bash

./run.sh --check --url $repoUrl --pat $TOKEN
./config.sh --url $repoUrl --unattended --token $TOKEN --pat $TOKEN
./run.sh
