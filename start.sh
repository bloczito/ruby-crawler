#!/bin/bash

#docker run \
#    -it \
#    --rm \
#    --name my-running-script \
#    -v "$PWD":/usr/src/myapp \
#    -w /usr/src/myapp \
#    ruby \
#    ruby main.rb


docker run \
    -it \
    --name ruby-crawler \
    -v "$PWD":/usr/src/app \
    ruby-crawler
    