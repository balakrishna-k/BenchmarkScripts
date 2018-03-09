#!/bin/bash

#Run 2 threads of the Decoder, sampling every 100 ms
docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar 788B.jar &> 788B2L1L2.txt
#Run 2 threads of the Decoder to gather average statistics
docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar 788B.jar &> 788B2AL1L2.txt
echo "Done with 788B 2 Threads, L1 AND L2"
