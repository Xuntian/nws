###

FROM xuntian/npl-runtime:20171103
MAINTAINER xuntian li.zq@foxmail.com

RUN apt-get -y update && apt-get -y install rsync inotify-tools && apt-get clean && rm -rf /var/lib/apt/lists/*
