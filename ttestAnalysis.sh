#!/bin/bash

#Script for peforming t-tests

expPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01

aysPath=$expPath/Analysis/Imaging/Models/BasicModel/subjectLevel
outPath=$expPath/Analysis/Imaging/Models/BasicModel/groupLevel/ttest
anatPath=/home/LIBRAD/sgreen/storage/labs/jfeinstein/Green/Experiments/Float.01/Scripts/BrainTemplates 

#======================================================================
#make output directory to drop files into


if [ ! -d $outPath ]; then
    echo "Creating an output directory"
    mkdir -p $outPath		
fi

#===============================================================#
# Copy average template brain if neccesary

if [ -f $anatPath/MNI152_1mm_uni+tlrc.HEAD ]; then
    echo "Copying over anatomical template"
    3dcopy $anatPath/MNI152_1mm_uni+tlrc $outPath/MNI152_1mm_uni+tlrc
else 
    echo "Anatomical File Already Present"		
fi

#===============================================================#
# Create a mask for the ttest

# set to 1 if you want to run this section of code
if [ 1 -eq 1 ]; then 

3dmerge \
-prefix $outPath/grpMask  \
$aysPath/501003/subAverage/mask_group+tlrc \
$aysPath/501004/subAverage/mask_group+tlrc \
$aysPath/501005/subAverage/mask_group+tlrc \
$aysPath/501006/subAverage/mask_group+tlrc \
$aysPath/501007/subAverage/mask_group+tlrc \
$aysPath/501008/subAverage/mask_group+tlrc \
$aysPath/501009/subAverage/mask_group+tlrc \
$aysPath/501010/subAverage/mask_group+tlrc \
$aysPath/501011/subAverage/mask_group+tlrc \
$aysPath/501015/subAverage/mask_group+tlrc \
$aysPath/501017/subAverage/mask_group+tlrc \
$aysPath/501018/subAverage/mask_group+tlrc \
$aysPath/501019/subAverage/mask_group+tlrc \
$aysPath/501020/subAverage/mask_group+tlrc \
$aysPath/501021/subAverage/mask_group+tlrc \
$aysPath/501024/subAverage/mask_group+tlrc \
$aysPath/501025/subAverage/mask_group+tlrc \
$aysPath/501027/subAverage/mask_group+tlrc \
$aysPath/501028/subAverage/mask_group+tlrc \
$aysPath/502001/subAverage/mask_group+tlrc \
$aysPath/502004/subAverage/mask_group+tlrc \
$aysPath/502005/subAverage/mask_group+tlrc \
$aysPath/502006/subAverage/mask_group+tlrc \
$aysPath/502008/subAverage/mask_group+tlrc \
$aysPath/502010/subAverage/mask_group+tlrc \
$aysPath/502012/subAverage/mask_group+tlrc \
$aysPath/502014/subAverage/mask_group+tlrc \
$aysPath/502015/subAverage/mask_group+tlrc \
$aysPath/502016/subAverage/mask_group+tlrc \
$aysPath/502018/subAverage/mask_group+tlrc \
$aysPath/502019/subAverage/mask_group+tlrc \
$aysPath/502020/subAverage/mask_group+tlrc \
$aysPath/502022/subAverage/mask_group+tlrc \
$aysPath/502023/subAverage/mask_group+tlrc \
$aysPath/502024/subAverage/mask_group+tlrc \
$aysPath/502025/subAverage/mask_group+tlrc \
$aysPath/502026/subAverage/mask_group+tlrc \
$aysPath/502030/subAverage/mask_group+tlrc 

fi #end of if/then controlling the execution of this section of code

#======================================================================
# Perform T-test - Pre - Post

# set to 1 if you want to run this section of code
if [ 1 -eq 1 ]; then 

echo "Performing a T-test"

labels=("Approach" "Avoid" "HiConf" "MidConf" "LowConf" "NegImages" "PosImages" "Rew_Out" \
 "NegImg_vs_PosImg" "Conflict" "CF_vs_AP" "CF_vs_AV" "Cf_vs_nCF" "AP_vs_AV" "AV_vs_AP")
indices=(1 4 7 10 13 16 19 22 25 28 31 34 37 40 43 )


for Index in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 ; do 
#for Index in 12 ; do

subBrick=${indices[Index]}

# Perform T-test - Main Effect

3dttest++ \
-mask $outPath/grpMask+tlrc 		\
-prefix $outPath/${labels[Index]}   	\
-setA ${labels[Index]}			\
501003 $aysPath/501003/subAverage/stats.501003+tlrc'['${subBrick}']' \
501004 $aysPath/501004/subAverage/stats.501004+tlrc'['${subBrick}']' \
501005 $aysPath/501005/subAverage/stats.501005+tlrc'['${subBrick}']' \
501006 $aysPath/501006/subAverage/stats.501006+tlrc'['${subBrick}']' \
501007 $aysPath/501007/subAverage/stats.501007+tlrc'['${subBrick}']' \
501008 $aysPath/501008/subAverage/stats.501008+tlrc'['${subBrick}']' \
501009 $aysPath/501009/subAverage/stats.501009+tlrc'['${subBrick}']' \
501010 $aysPath/501010/subAverage/stats.501010+tlrc'['${subBrick}']' \
501011 $aysPath/501011/subAverage/stats.501011+tlrc'['${subBrick}']' \
501015 $aysPath/501015/subAverage/stats.501015+tlrc'['${subBrick}']' \
501017 $aysPath/501017/subAverage/stats.501017+tlrc'['${subBrick}']' \
501018 $aysPath/501018/subAverage/stats.501018+tlrc'['${subBrick}']' \
501019 $aysPath/501019/subAverage/stats.501019+tlrc'['${subBrick}']' \
501020 $aysPath/501020/subAverage/stats.501020+tlrc'['${subBrick}']' \
501021 $aysPath/501021/subAverage/stats.501021+tlrc'['${subBrick}']' \
501024 $aysPath/501024/subAverage/stats.501024+tlrc'['${subBrick}']' \
501025 $aysPath/501025/subAverage/stats.501025+tlrc'['${subBrick}']' \
501027 $aysPath/501027/subAverage/stats.501027+tlrc'['${subBrick}']' \
501028 $aysPath/501028/subAverage/stats.501028+tlrc'['${subBrick}']' \
502001 $aysPath/502001/subAverage/stats.502001+tlrc'['${subBrick}']' \
502004 $aysPath/502004/subAverage/stats.502004+tlrc'['${subBrick}']' \
502005 $aysPath/502005/subAverage/stats.502005+tlrc'['${subBrick}']' \
502006 $aysPath/502006/subAverage/stats.502006+tlrc'['${subBrick}']' \
502008 $aysPath/502008/subAverage/stats.502008+tlrc'['${subBrick}']' \
502010 $aysPath/502010/subAverage/stats.502010+tlrc'['${subBrick}']' \
502012 $aysPath/502012/subAverage/stats.502012+tlrc'['${subBrick}']' \
502014 $aysPath/502014/subAverage/stats.502014+tlrc'['${subBrick}']' \
502015 $aysPath/502015/subAverage/stats.502015+tlrc'['${subBrick}']' \
502016 $aysPath/502016/subAverage/stats.502016+tlrc'['${subBrick}']' \
502018 $aysPath/502018/subAverage/stats.502018+tlrc'['${subBrick}']' \
502019 $aysPath/502019/subAverage/stats.502019+tlrc'['${subBrick}']' \
502020 $aysPath/502020/subAverage/stats.502020+tlrc'['${subBrick}']' \
502022 $aysPath/502022/subAverage/stats.502022+tlrc'['${subBrick}']' \
502023 $aysPath/502023/subAverage/stats.502023+tlrc'['${subBrick}']' \
502024 $aysPath/502024/subAverage/stats.502024+tlrc'['${subBrick}']' \
502025 $aysPath/502025/subAverage/stats.502025+tlrc'['${subBrick}']' \
502026 $aysPath/502026/subAverage/stats.502026+tlrc'['${subBrick}']' \
502030 $aysPath/502030/subAverage/stats.502030+tlrc'['${subBrick}']' 

done
#combine into one file

3dbucket \
-prefix $outPath/stats 		\
$outPath/Approach+tlrc		\
$outPath/Avoid+tlrc		\
$outPath/HiConf+tlrc		\
$outPath/MidConf+tlrc		\
$outPath/LowConf+tlrc		\
$outPath/NegImages+tlrc		\
$outPath/PosImages+tlrc		\
$outPath/Rew_Out+tlrc		\
$outPath/NegImg_vs_PosImg+tlrc	\
$outPath/Conflict+tlrc		\
$outPath/CF_vs_AP+tlrc		\
$outPath/CF_vs_AV+tlrc		\
$outPath/Cf_vs_nCF+tlrc		\
$outPath/AP_vs_AV+tlrc		\
$outPath/AV_vs_AP+tlrc			

fi #end of if/then controlling the execution of this section of code


#======================================================================
# HouseKeeping 

# set to 1 if you want to run this section of code
if [ 0 -eq 1 ]; then 

#remove unneccesary files

rm $outPath/Approach+tlrc*		\
rm $outPath/Avoid+tlrc*			\
rm $outPath/HiConf+tlrc*		\
rm $outPath/MidConf+tlrc*		\
rm $outPath/LowConf+tlrc*		\
rm $outPath/NegImages+tlrc*		\
rm $outPath/PosImages+tlrc*		\
rm $outPath/Rew_Out+tlrc*		\
rm $outPath/NegImg_vs_PosImg*		\
rm $outPath/Conflict+tlrc*		\
rm $outPath/CF_vs_AP+tlrc*		\
rm $outPath/CF_vs_AV+tlrc*		\
rm $outPath/Cf_vs_nCF+tlrc*		\
rm $outPath/AP_vs_AV+tlrc*		\
rm $outPath/AV_vs_AP+tlrc*		

fi #end of if/then controlling the execution of this section of code
