#!/bin/bash

#Script for peforming t-tests

expPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01

aysPath=$expPath/Analysis/Imaging/Models/BasicModel/subjectLevel
outPath=$expPath/Analysis/Imaging/Models/BasicModel/groupLevel/


#======================================================================
#make output directory to drop files into


if [ ! -d $outPath ]; then
    echo "Creating an output directory"
    mkdir -p $outPath		
fi

#===============================================================#
# Create a group mask


3dmerge \
-prefix $outPath/grpMask  \
$aysPath/501002/subAverage/mask_group+tlrc \
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
$aysPath/501023/subAverage/mask_group+tlrc \
$aysPath/501024/subAverage/mask_group+tlrc \
$aysPath/501025/subAverage/mask_group+tlrc \
$aysPath/501026/subAverage/mask_group+tlrc \
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
$aysPath/502021/subAverage/mask_group+tlrc \
$aysPath/502022/subAverage/mask_group+tlrc \
$aysPath/502023/subAverage/mask_group+tlrc \
$aysPath/502024/subAverage/mask_group+tlrc \
$aysPath/502025/subAverage/mask_group+tlrc \
$aysPath/502026/subAverage/mask_group+tlrc \
$aysPath/502029/subAverage/mask_group+tlrc \
$aysPath/502030/subAverage/mask_group+tlrc
