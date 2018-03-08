#!/bin/bash

echo "Good luck!"

#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 255B.jar 255B.jar 255B.jar 255B.jar &> 255B4IPCB.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 255B.jar  255B.jar 255B.jar 255B.jar &> 255B4AIPCB.txt
echo "Done with 255B 4 Threads, IPC and Branch Misses"

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar &> 255B8IPCB.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar &> 255B8AIPCB.txt
echo "Done with 255B 8 Threads, IPC and Branch Misses"

#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar 788B.jar 788B.jar 788B.jar &> 788B4IPCB.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar  788B.jar 788B.jar 788B.jar &> 788B4AIPCB.txt
echo "Done with 788B 4 Threads, IPC and Branch Misses"

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar &> 788B8IPCB.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar &> 788B8AIPCB.txt
echo "Done with 788B 8 Threads, IPC and Branch Misses"

#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T4IPCB.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar  2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T4AIPCB.txt
echo "Done with 2.8T 4 Threads, IPC and Branch Misses"

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T8IPCB.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T8AIPCB.txt
echo "Done with 2.8T 8 Threads, IPC and Branch Misses"

