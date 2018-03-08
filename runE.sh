#!/bin/bash

echo "Starting 1 thread runs for all 5 input sets, collecting information about IPC and Branch misses"
	echo "-----"

	#Run 1 threads of the Decoder for 16B instr, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar &> 16B1IPCB.txt
	#Run 1 thread of the Decoder for 16B instr to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 16B.jar &> 16B1AIPCB.txt
	echo "Done with 16B 1 Thread, IPC and Branch Misses"
	echo "-----"


	#Run 1 threads of the Decoder for 64B instr sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar &> 64B1IPCB.txt
	#Run 1 thread of the Decoder for 64B instr to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 64B.jar &> 64B1AIPCB.txt
	echo "Done with 64B 1 Thread, IPC and Branch Misses"
	echo "-----"


	#Run 1 threads of the Decoder for 225B, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 255B.jar &> 255B1IPCB.txt
	#Run 1 thread of the Decoder for 255B to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 255B.jar &> 255B1AIPCB.txt

	echo "Done with 255B 1 Thread, IPC and Branch Misses"
	echo "-----"


	#Run 1 threads of the Decoder for 788B, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar &> 788B1IPCB.txt

	#Run 1 thread of the Decoder to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 788B.jar &> 788B1IPCBA.txt

	echo "Done with 788B 1 Thread, IPC and Branch Misses"
	echo "-----"


	#Run 1 threads of the Decoder for 2.8T, sampling every 100 ms
	docker run --privileged -it karthik127/convert perf stat -I 100 -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar &> 2.8T1IPCB.txt

	#Run 1 thread of the Decoder to gather average statistics
	docker run --privileged -it karthik127/convert perf stat -e '{cycles, instructions, branch-misses}' parallel java -jar ::: 2.8T.jar &> 2.8T1AIPCB.txt

	echo "Done with 2.8T 1 Thread, IPC and Branch Misses"
	echo "-----"
