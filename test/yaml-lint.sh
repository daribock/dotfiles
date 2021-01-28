#!/bin/sh

path=$(pwd)

# For testing locally

docker run -e RUN_LOCAL=true -v "$path":/tmp/lint github/super-linter