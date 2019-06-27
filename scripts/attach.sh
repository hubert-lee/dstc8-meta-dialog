#!/bin/bash

# docker-compose에 의해 생성된 컨테이너에 접속합니다.
# hanamdin 계정으로 접속합니다.
# api는 정의된 서비스들 중, 접속할 서비스명을 지정합니다.

if [ $# == 0 ]; then
    docker-compose exec -u $(id -u):$(id -g) api /bin/bash
elif [ $1 == "root" ]; then
    docker-compose exec api /bin/bash
fi

