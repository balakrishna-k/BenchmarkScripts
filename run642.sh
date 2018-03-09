#!/bin/bash

#Run 8 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar &> 64B8L1L2.txt
#Run 8 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar 64B.jar &> 64B8AL1L2.txt
echo "Done with 64B 8 Threads, L1 AND L2"


#Run 4 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar 64B.jar 64B.jar 64B.jar &> 64B4L1L2.txt
#Run 4 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar  64B.jar 64B.jar 64B.jar &> 64B4AL1L2.txt
echo "Done with 64B 4 Threads, L1 AND L2"


#Run 2 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar 64B.jar &> 64B2L1L2.txt
#Run 2 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar 64B.jar &> 64B2AL1L2.txt
echo "Done with 64B 2 Threads, L1 AND L2"
