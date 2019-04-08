1. build
    Before you build docker image, you should put gcc for pmon and kernel into current dir "opt".
    
    docker build --build-arg GCC_PATH=./opt -t loongson:2019.4 .

2. run

    docker run -ti -v /path/to/your/code/:/home/loongson/project loongson:2019.4 /bin/bash

