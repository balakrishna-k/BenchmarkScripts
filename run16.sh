#!/bin/bash

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar &> 16B8IPCB.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar 16B.jar &> 16B8AIPCB.txt
echo "Done with 16B 8 Threads, IPC and Branch Misses"


#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar 16B.jar 16B.jar 16B.jar &> 16B4IPCB.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar  16B.jar 16B.jar 16B.jar &> 16B4AIPCB.txt
echo "Done with 16B 4 Threads, IPC and Branch Misses"


#Run 2 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar 16B.jar &> 16B2IPCB.txt
#Run 2 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar 16B.jar &> 16B2AIPCB.txt
echo "Done with 16B 2 Threads, IPC and Branch Misses"
