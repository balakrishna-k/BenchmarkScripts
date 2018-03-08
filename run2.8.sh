#!/bin/bash

#Run 2 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar 2.8T.jar &> 2.8T2IPCB.txt
#Run 2 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar 2.8T.jar &> 2.8T2AIPCB.txt
echo "Done with 2.8T 2 Threads, IPC and Branch Misses"
