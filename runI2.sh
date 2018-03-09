#!/bin/bash

#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 255B.jar 255B.jar 255B.jar 255B.jar &> 255B4L1L2.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 255B.jar  255B.jar 255B.jar 255B.jar &> 255B4AL1L2.txt
echo "Done with 255B 4 Threads"

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar &> 255B8L1L2.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar 255B.jar &> 255B8AL1L2.txt
echo "Done with 255B 8 Threads"

#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar 788B.jar 788B.jar 788B.jar &> 788B4L1L2.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar  788B.jar 788B.jar 788B.jar &> 788B4AL1L2.txt
echo "Done with 788B 4 Threads"

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar &> 788B8L1L2.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar 788B.jar &> 788B8AL1L2.txt
echo "Done with 788B 8 Threads"

#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T4L1L2.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 2.8T.jar  2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T4AL1L2.txt
echo "Done with 2.8T 4 Threads"

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T8L1L2.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar 2.8T.jar &> 2.8T8AL1L2.txt
echo "Done with 2.8T 8 Threads"

