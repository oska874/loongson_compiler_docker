1. build
    
    docker build  -t loongson:2019.4 .

2. run

    docker run -ti -v /path/to/your/code/:/home/loongson/project loongson:2019.4 /bin/bash

3. use

    gcc for kernel is located at `/opt/gcc-4.9.3-64-gnu/`(can also be used to compile modules and applications), gcc for pmon is located at `/opt/gcc-4.4-gnu/`
