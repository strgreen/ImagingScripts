#!/bin/bash

tgtPath=/home/LIBRAD/sgreen/storage/labs/raupperle/UMKCfmri/origbriks
dstPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01/Data/Imaging

#for Subject in 501003BRIKS 501004BRIKS 501005BRIKS 501006BRIKS 501007BRIKS 501008BRIKS 501009BRIKS 501010BRIKS 501011BRIKS 501015BRIKS 501017BRIKS 501018BRIKS 501019BRIKS 501020BRIKS 501021BRIKS 501023BRIKS 501024BRIKS 501025BRIKS 501026BRIKS 501027BRIKS 501028BRIKS 502001BRIKS 502004BRIKS 502005BRIKS 502006BRIKS 502008BRIKS 502010BRIKS 502012BRIKS 502014BRIKS 502015BRIKS 502016BRIKS 502018BRIKS 502019BRIKS 502020BRIKS 502021BRIKS 502022BRIKS 502023BRIKS 502024BRIKS 502025BRIKS 502026BRIKS 502029BRIKS 502030BRIKS ; do

for Subject in 501004BRIKS ; do 

	echo "Copying Files for Subject" $Subject
	
	mkdir ${dstPath}/${Subject:0:6}

	#Copy Anat Files

	tgtFile=${tgtPath}/$Subject/${Subject:0:6}_MPRAGEdeob+orig
	dstFile=${dstPath}/${Subject:0:6}/anat

	3dcopy $tgtFile $dstFile

	for run in 1 2 3 ; do 
	
		#Copy Func Files

		tgtFile=${tgtPath}/$Subject/${Subject:0:6}_AAC${run}+orig
		dstFile=${dstPath}/${Subject:0:6}/aac.r${run}

		3dcopy $tgtFile $dstFile

		#Deoblique the functional files
		echo ${dstPath}do.aac.r${run}
		3dWarp -deoblique -prefix ${dstPath}/${Subject:0:6}/do.aac.r${run} $dstFile+orig		


	done #Run
done #Subject



