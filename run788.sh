#!/bin/bash

#Run 2 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar 788B.jar &> 788B2IPCB.txt
#Run 2 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar 788B.jar &> 788B2AIPCB.txt
echo "Done with 788B 2 Threads, IPC and Branch Misses"
