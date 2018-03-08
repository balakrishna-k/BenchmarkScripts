#!/bin/bash

# Name: Karthik Balakrishna 
# Cruz ID: kabalakr
# CMPE 202: Computer Architecture

#####################################################################################
#                                PREREQUISITES                                      #  
#                                                                                   #
#	1. Please Execute setup.sh before executing run.sh                          #
#	2. Docker must be allowed to run in privileged mode to gather statistics    #
#       3. Script will fail to execute if appropriate permissions for perf are not  # 		
#	   provided                                                                 # 
#                                                                                   #
#####################################################################################

# Description:  This script executes the different runs each part sequentially and generates the data for plots in corresponding files.

#----------------------------------------------------------------------------------------------------------------------------------------------

#1. Gather statistics for IPC for single threaded runs first, and also branch-misses. 

echo "Do you want to do the easy runs? Y/n"
read choice
#echo $choice
#echo $choice
#echo $choice

if [[ "$choice" == "Y" || "$choice" == "y" ]];
then	

	./runE.sh
fi
	#----------------------------------------------------------------------------------------------------------------------------------------------


echo "Do you want to do the Moderate runs? Y/n"
read choice

if [[ "$choice" == "Y" || "$choice" == "y" ]];
then


################################
# Number of Instructions = 16B #
################################
echo "Running 16B instructions with 8, 4 and 2 threads"
./run16.sh
echo "-----"

################################
# Number of Instructions = 64B #
################################
echo "Running 64B instructions with 8, 4 and 2 threads"
./run64.sh
echo "-----"

#################################
# Number of Instructions = 255B #
#################################
echo "Running 255B instructions with 2 threads"
./run255.sh
echo "-----"

#################################
# Number of Instructions = 788B #
#################################
echo "Running 788B instructions with 2 threads"
./run788.sh
echo "-----"

#################################
# Number of Instructions = 2.8T #
#################################
echo "Running 2.8T instructions with 2 threads"
./run2.8.sh
echo "-----"
fi
#################################
# Intensive Runs, enter choice  #
#################################

echo "Do you want to perform the intensive runs? May cause device to hang: Y/n"
read choice

if [[ "$choice" == "Y" || "$choice" == "y" ]];
then	
	./runI.sh
	echo "-----"
fi

echo "End of throughput tests."
echo "---"

#------------------------------------------------------------------------------
# END OF THROUGHPUT TESTS

echo "Do you want to perform Latency measurement? Y/n"
read choice

if [[ "$choice" == "Y" || "$choice" == "y" ]];
then	        
       	
	for i in {0..29..1}
	do
	
		echo "$i"
		docker run --privileged karthik127/convert perf stat java -jar Encoder.jar &>>Latency.txt 
	done

	echo "-----"		
fi



