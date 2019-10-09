#!/usr/bin/env bash
docker build -t php:7.4 .
#docker stop lnmp
#docker rm lnmp
#docker run --name lnmp -it php:7.4 bash