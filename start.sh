#!/bin/bash

#docker run \
#    -it \
#    --rm \
#    --name my-running-script \
#    -v "$PWD":/usr/src/myapp \
#    -w /usr/src/myapp \
#    ruby \
#    ruby main.rb


docker build -t ruby-crawler . && docker run --rm ruby-crawler