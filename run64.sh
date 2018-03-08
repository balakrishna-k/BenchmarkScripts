#!/bin/bash

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar &> 64B8IPCB.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar &> 64B8AIPCB.txt
echo "Done with 64B 8 Threads, IPC and Branch Misses"


#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar 64B.jar 64B.jar 64B.jar &> 64B4IPCB.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar  64B.jar 64B.jar 64B.jar &> 64B4AIPCB.txt
echo "Done with 64B 4 Threads, IPC and Branch Misses"


#Run 2 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar 64B.jar &> 64B2IPCB.txt
#Run 2 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar 64B.jar &> 64B2AIPCB.txt
echo "Done with 64B 2 Threads, IPC and Branch Misses"
