#!/bin/bash 

expPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01

#Batch 1
#for subject in  501003 501004 501005 501006 501007 501008 501009 501010 501011 501015; do 

#Batch 2
#for subject in  501017 501018 501019 501020 501021 501024 501025 501027 501028; do  

#Batch 3
#for subject in  502001 502004 502005 502006 502008 502010 502012 502014 502015; do

#Batch 4
#for subject in 502016 502018 502019 502020 502022 502023 502024 502025 502026 502030; do


#All Subjects
#for subject in 501003 501004 501005 501006 501007 501008 501009 501010 501011 501015 501017 501018 501019 501020 501021 501023 501024 501025 501026 501027 501028 502001 502004 502005 502006 502008 502010 502012 502014 502015 502016 502018 502019 502020 502021 502022 502023 502024 502025 502026 502029 502030 ; do

#One subject
for subject in 501019 ; do 


#======================================================================
# Setup arguments neccesary for the glm analysis

    datPath=$expPath/Data/Imaging/${subject}
    aysPath=$expPath/Analysis/Imaging/Models/BasicModel/subjectLevel/${subject}
    onsPath=$expPath/Analysis/Imaging/Models/BasicModel/Onsets


    prefix=subAverage 
    refFile=$datPath/do.aac.r3+orig.HEAD
    anatFile=$datPath/anat+orig.HEAD

    TR=2.0
    TR_cut=0

#======================================================================
#make output directory to drop files into


if [ ! -d $aysPath ]; then
    echo "Creating an output directory"
    mkdir -p $aysPath
else		
    rm -rf $aysPath
    mkdir -p $aysPath
fi

#======================================================================
# Execute afni proc to generate the analysis script. 

    afni_proc.py 		\
        -blocks tcat tshift align tlrc volreg blur mask scale regress 								\
        -subj_id $subject													\
        -script afniProc.sh -scr_overwrite	 										\
        -out_dir $aysPath/$prefix/												\
        -dsets $datPath/do.aac.r*+orig.BRIK 											\
        -copy_anat $anatFile 													\
        -tcat_remove_first_trs $TR_cut 												\
        -align_epi_ext_dset $refFile'[0]' 											\
        -volreg_base_dset $refFile'[0]' 											\
        -volreg_tlrc_warp 													\
        -blur_size 6 														\
        -regress_stim_times                                                     						\
           $onsPath/${subject}/Decision/Approach.txt                                                 				\
           $onsPath/${subject}/Decision/Avoid.txt                                                 				\
           $onsPath/${subject}/Decision/HiConf.txt                                                 				\
           $onsPath/${subject}/Decision/ModConf.txt                                              				\
	   $onsPath/${subject}/Decision/LowConf.txt                        							\
	   $onsPath/${subject}/Image/Negative.txt                                              					\
	   $onsPath/${subject}/Image/Positive.txt                        							\
	   $onsPath/${subject}/Reward/Onset.txt                        								\
    	-regress_stim_labels                                                    						\
            Approach Avoid HiConf ModConf LowConf NegImgs PosImgs RewOut        						\
        -regress_basis_multi                                                    						\
            'BLOCK(4,1)' 'BLOCK(4,1)' 'BLOCK(4,1)' 'BLOCK(4,1)' 'BLOCK(4,1)' 'BLOCK(6,1)' 'BLOCK(6,1)' 'BLOCK(2,1)'		\
        -regress_compute_fitts                                                  						\
        -regress_censor_motion 0.3                                        							\
        -regress_censor_outliers 0.05                                     							\
        -regress_opts_3dD                                                       						\
            -jobs 12                                                            						\
            -num_glt 7  													\
	    -gltsym "SYM: +NegImgs -PosImgs"							-glt_label 1 NegImg_vs_PosImg	\
	    -gltsym "SYM: +0.33*HiConf +0.33*ModConf +0.33*LowConf"				-glt_label 2 Conflict		\
	    -gltsym "SYM: +0.33*HiConf +0.33*ModConf +0.33*LowConf -Approach"	 		-glt_label 3 Cf_vs_Ap 		\
	    -gltsym "SYM: +0.33*HiConf +0.33*ModConf +0.33*LowConf -Avoid"	 		-glt_label 4 Cf_vs_Av 		\
	    -gltsym "SYM: +0.33*HiConf +0.33*ModConf +0.33*LowConf -0.5*Avoid -0.5*Approach"	-glt_label 5 Cf_vs_nCF 		\
	    -gltsym "SYM: +Approach -Avoid"	 						-glt_label 6 Ap_vs_Av		\
	    -gltsym "SYM: +Avoid -Approach"	 				 		-glt_label 7 Av_vs_Ap		\
        -regress_make_ideal_sum sum_ideal.1D                              							\
        -regress_est_blur_epits                                           							\
        -regress_est_blur_errts													\
	-regress_run_clustsim no												\
	-remove_preproc_files													

#======================================================================
#======================================================================
# Copy and Move the execution anlaysis file

	cp  afniProc.sh $aysPath/afniProc.sh
	rm  afniProc.sh

echo "===================="
echo " "
echo "Starting " ${subjects}
echo " "
echo "===================="

#run afni proc file 
	tcsh -x $aysPath/afniProc.sh </dev/null&> $aysPath/analysisLog.txt &

done



