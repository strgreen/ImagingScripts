#!/usr/bin/python

import sys
import os
import fnmatch
import csv

subject = 'AI224'
session = '1'


inpath = '/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/AACReTest.01/Data/data-organized/' + subject + '/T' + session + '/behavioral_session/'
outPath = '/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/AACReTest.01/Scripts/processing-firstlevel/stim_times/_AAC/' + subject + '/T' + session + '/'

files = os.listdir(inpath)

count = 0
onsetTable = [] 		


for file in files:
	if fnmatch.fnmatch(file, '*_AAC-RXA*') or fnmatch.fnmatch(file, '*_AAC-RXB*') or fnmatch.fnmatch(file, '*_AAC-RXC*') : 
		run = file[-5:-4]


		with open(inpath + file, 'r') as csvfile:
			#Read the csv file into rawTable
			rawTable = csv.reader(csvfile)
			#Skip the first three lines
			for line in range(0,2): next(rawTable)
						
			for row in rawTable:
				#Get start time of run			
				if int(row[2]) == 2:
					runStartTime = float(row[3])					

				#Catch rows that don't have NA in second column
				if row[1] != "NA" and int(row[2]) == 4:
					if int(row[1][0:2]) == 00:
						type = "Approach"
						points = 0
					elif int(row[1][3:5]) > 0:
						type = "Conflict"
						points = int(row[1][3:5])
						
						#Reduce large point values by a factor of 10.
						if points > 10:
							points = points/10

					else:
						type = "Avoid"
						points = 0
					
					#compute onset time by subtracting run start time
					onsetTime = float(row[3]) - runStartTime
					onsetTime = round(onsetTime,2)

					onsetTable.append([run,type,points,onsetTime])	

				#Get onsets for when the image is shown
				if row[1] != "NA" and int(row[2]) == 8 or int(row[2]) == 9:
					if int(row[2]) == 8: 
						type = "Negative"
					else:
						type = "Positive"
					
					#compute onset time by subtracting run start time
					onsetTime = float(row[3]) - runStartTime
					onsetTime = round(onsetTime,2)
					
					onsetTable.append([run,type,"0",onsetTime])

				#Get onsets for when the point screen is shown
				if row[1] != "NA" and int(row[2]) == 10:
					type = "PointScreen"
					
					#compute onset time by subtracting run start time
					onsetTime = float(row[3]) - runStartTime
					onsetTime = round(onsetTime,2)
					
					onsetTable.append([run,type,"0",onsetTime])

									
#Create a directory to save the onest files in 
if not os.path.exists(outPath):
	os.makedirs(outPath)

#Create an onset file for approach
onsetFile = open(outPath + 'Approach.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Approach' and int(onsetTable[index][0]) == run:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")
	
#Create an onset file for avoid
onsetFile = open(outPath + 'Avoid.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Avoid' and int(onsetTable[index][0]) == run:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")

onsetFile = open(outPath + 'LowConf.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Conflict' and int(onsetTable[index][0]) == run and int(onsetTable[index][2]) == 2:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")

onsetFile = open(outPath + 'ModConf.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Conflict' and int(onsetTable[index][0]) == run and int(onsetTable[index][2]) == 4:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")

onsetFile = open(outPath + 'HiConf.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Conflict' and int(onsetTable[index][0]) == run and int(onsetTable[index][2]) == 6:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")

onsetFile = open(outPath + 'Negative.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Negative' and int(onsetTable[index][0]) == run:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")

onsetFile = open(outPath + 'Positive.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'Positive' and int(onsetTable[index][0]) == run:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")


onsetFile = open(outPath + 'PointScreen.txt','w')
for run in range(1,4):
	for index in range(1,len(onsetTable)):

		if onsetTable[index][1] == 'PointScreen' and int(onsetTable[index][0]) == run:
			onsetFile.write(str(onsetTable[index][3]))
			onsetFile.write('\t'); 

	onsetFile.write("\n")


