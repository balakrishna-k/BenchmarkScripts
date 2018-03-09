#!/bin/bash

echo "Starting 1 thread runs for all 5 input sets, collecting information about L1 AND L2 MPKI"
	echo "-----"

	#Run 1 threads of the Decoder for 16B instr, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 16B.jar &> 16B1L1L2.txt
	#Run 1 thread of the Decoder for 16B instr to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 16B.jar &> 16B1AL1L2.txt
	echo "Done with 16B 1 Thread"
	echo "-----"


	#Run 1 threads of the Decoder for 64B instr sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar &> 64B1L1L2.txt
	#Run 1 thread of the Decoder for 64B instr to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 64B.jar &> 64B1AL1L2.txt
	echo "Done with 64B 1 Thread"
	echo "-----"


	#Run 1 threads of the Decoder for 225B, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 255B.jar &> 255B1L1L2.txt
	#Run 1 thread of the Decoder for 255B to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 255B.jar &> 255B1AL1L2.txt

	echo "Done with 255B 1 Thread"
	echo "-----"


	#Run 1 threads of the Decoder for 788B, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar &> 788B1L1L2.txt

	#Run 1 thread of the Decoder to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 788B.jar &> 788B1AL1L2.txt

	echo "Done with 788B 1 Thread"
	echo "-----"


	#Run 1 threads of the Decoder for 2.8T, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 2.8T.jar &> 2.8T1L1L2.txt

	#Run 1 thread of the Decoder to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{instructions, L1-dcache-load-misses, L1-icache-load-misses, l2_rqsts.all_demand_miss}' parallel java -jar ::: 2.8T.jar &> 2.8T1AL1L2.txt

	echo "Done with 2.8T 1 Thread"
	echo "-----"
