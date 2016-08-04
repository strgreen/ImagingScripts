#!/bin/bash

#Script for peforming t-tests


aysPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01/Analysis/Imaging/Models/BasicModel/subjectLevel
outPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01/Analysis/Imaging/Models/BasicModel/groupLevel/anova
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
# Create a group mask 

3dmerge \
-prefix $outPath/grpMask  \
$aysPath/501003/subAverage/mask_group+tlrc   \
$aysPath/501004/subAverage/mask_group+tlrc   \
$aysPath/501005/subAverage/mask_group+tlrc   \
$aysPath/501006/subAverage/mask_group+tlrc   \
$aysPath/501007/subAverage/mask_group+tlrc   \
$aysPath/501008/subAverage/mask_group+tlrc   \
$aysPath/501009/subAverage/mask_group+tlrc   \
$aysPath/501010/subAverage/mask_group+tlrc   \
$aysPath/501011/subAverage/mask_group+tlrc   \
$aysPath/501015/subAverage/mask_group+tlrc   \
$aysPath/501017/subAverage/mask_group+tlrc   \
$aysPath/501018/subAverage/mask_group+tlrc   \
$aysPath/501019/subAverage/mask_group+tlrc   \
$aysPath/501020/subAverage/mask_group+tlrc   \
$aysPath/501021/subAverage/mask_group+tlrc   \
$aysPath/501024/subAverage/mask_group+tlrc   \
$aysPath/501025/subAverage/mask_group+tlrc   \
$aysPath/501027/subAverage/mask_group+tlrc   \
$aysPath/501028/subAverage/mask_group+tlrc   \
$aysPath/502001/subAverage/mask_group+tlrc   \
$aysPath/502004/subAverage/mask_group+tlrc   \
$aysPath/502005/subAverage/mask_group+tlrc   \
$aysPath/502006/subAverage/mask_group+tlrc   \
$aysPath/502008/subAverage/mask_group+tlrc   \
$aysPath/502010/subAverage/mask_group+tlrc   \
$aysPath/502012/subAverage/mask_group+tlrc   \
$aysPath/502014/subAverage/mask_group+tlrc   \
$aysPath/502015/subAverage/mask_group+tlrc   \
$aysPath/502016/subAverage/mask_group+tlrc   \
$aysPath/502018/subAverage/mask_group+tlrc   \
$aysPath/502019/subAverage/mask_group+tlrc   \
$aysPath/502020/subAverage/mask_group+tlrc   \
$aysPath/502022/subAverage/mask_group+tlrc   \
$aysPath/502023/subAverage/mask_group+tlrc   \
$aysPath/502024/subAverage/mask_group+tlrc   \
$aysPath/502025/subAverage/mask_group+tlrc   \
$aysPath/502026/subAverage/mask_group+tlrc   \
$aysPath/502030/subAverage/mask_group+tlrc   \


#===============================================================#
# Perform 2 x 2 Anova

# set to 1 if you want to run this section of code
if [ 1 -eq 1 ]; then 

echo "Performing a 2 x 3 repeated measures ANOVA "

# Perform ANOVA

#We use type 5 because factor C is nested into factor A
#Must have a balanced design.

#Factor A Group (1 = PTSD; 2 = Control)
#Factor B Conflict (1 = Approach; 2 = Avoid; 3 = Conflict)
#Factor C Subject

3dANOVA3 \
-mask $outPath/grpMask+tlrc							\
-type 5										\
-alevels 2									\
-blevels 3									\
-clevels 19									\
-dset	1	1	1	$aysPath/501003/subAverage/stats.501003+tlrc'[1]'  \
-dset	1	1	2	$aysPath/501004/subAverage/stats.501004+tlrc'[1]'  \
-dset	1	1	3	$aysPath/501005/subAverage/stats.501005+tlrc'[1]'  \
-dset	1	1	4	$aysPath/501006/subAverage/stats.501006+tlrc'[1]'  \
-dset	1	1	5	$aysPath/501007/subAverage/stats.501007+tlrc'[1]'  \
-dset	1	1	6	$aysPath/501008/subAverage/stats.501008+tlrc'[1]'  \
-dset	1	1	7	$aysPath/501009/subAverage/stats.501009+tlrc'[1]'  \
-dset	1	1	8	$aysPath/501010/subAverage/stats.501010+tlrc'[1]'  \
-dset	1	1	9	$aysPath/501011/subAverage/stats.501011+tlrc'[1]'  \
-dset	1	1	10	$aysPath/501015/subAverage/stats.501015+tlrc'[1]'  \
-dset	1	1	11	$aysPath/501017/subAverage/stats.501017+tlrc'[1]'  \
-dset	1	1	12	$aysPath/501018/subAverage/stats.501018+tlrc'[1]'  \
-dset	1	1	13	$aysPath/501019/subAverage/stats.501019+tlrc'[1]'  \
-dset	1	1	14	$aysPath/501020/subAverage/stats.501020+tlrc'[1]'  \
-dset	1	1	15	$aysPath/501021/subAverage/stats.501021+tlrc'[1]'  \
-dset	1	1	16	$aysPath/501024/subAverage/stats.501024+tlrc'[1]'  \
-dset	1	1	17	$aysPath/501025/subAverage/stats.501025+tlrc'[1]'  \
-dset	1	1	18	$aysPath/501027/subAverage/stats.501027+tlrc'[1]'  \
-dset	1	1	19	$aysPath/501028/subAverage/stats.501028+tlrc'[1]'  \
-dset	2	1	1	$aysPath/502001/subAverage/stats.502001+tlrc'[1]'  \
-dset	2	1	2	$aysPath/502004/subAverage/stats.502004+tlrc'[1]'  \
-dset	2	1	3	$aysPath/502005/subAverage/stats.502005+tlrc'[1]'  \
-dset	2	1	4	$aysPath/502006/subAverage/stats.502006+tlrc'[1]'  \
-dset	2	1	5	$aysPath/502008/subAverage/stats.502008+tlrc'[1]'  \
-dset	2	1	6	$aysPath/502010/subAverage/stats.502010+tlrc'[1]'  \
-dset	2	1	7	$aysPath/502012/subAverage/stats.502012+tlrc'[1]'  \
-dset	2	1	8	$aysPath/502014/subAverage/stats.502014+tlrc'[1]'  \
-dset	2	1	9	$aysPath/502015/subAverage/stats.502015+tlrc'[1]'  \
-dset	2	1	10	$aysPath/502016/subAverage/stats.502016+tlrc'[1]'  \
-dset	2	1	11	$aysPath/502018/subAverage/stats.502018+tlrc'[1]'  \
-dset	2	1	12	$aysPath/502019/subAverage/stats.502019+tlrc'[1]'  \
-dset	2	1	13	$aysPath/502020/subAverage/stats.502020+tlrc'[1]'  \
-dset	2	1	14	$aysPath/502022/subAverage/stats.502022+tlrc'[1]'  \
-dset	2	1	15	$aysPath/502023/subAverage/stats.502023+tlrc'[1]'  \
-dset	2	1	16	$aysPath/502024/subAverage/stats.502024+tlrc'[1]'  \
-dset	2	1	17	$aysPath/502025/subAverage/stats.502025+tlrc'[1]'  \
-dset	2	1	18	$aysPath/502026/subAverage/stats.502026+tlrc'[1]'  \
-dset	2	1	19	$aysPath/502030/subAverage/stats.502030+tlrc'[1]'  \
-dset	1	2	1	$aysPath/501003/subAverage/stats.501003+tlrc'[4]'  \
-dset	1	2	2	$aysPath/501004/subAverage/stats.501004+tlrc'[4]'  \
-dset	1	2	3	$aysPath/501005/subAverage/stats.501005+tlrc'[4]'  \
-dset	1	2	4	$aysPath/501006/subAverage/stats.501006+tlrc'[4]'  \
-dset	1	2	5	$aysPath/501007/subAverage/stats.501007+tlrc'[4]'  \
-dset	1	2	6	$aysPath/501008/subAverage/stats.501008+tlrc'[4]'  \
-dset	1	2	7	$aysPath/501009/subAverage/stats.501009+tlrc'[4]'  \
-dset	1	2	8	$aysPath/501010/subAverage/stats.501010+tlrc'[4]'  \
-dset	1	2	9	$aysPath/501011/subAverage/stats.501011+tlrc'[4]'  \
-dset	1	2	10	$aysPath/501015/subAverage/stats.501015+tlrc'[4]'  \
-dset	1	2	11	$aysPath/501017/subAverage/stats.501017+tlrc'[4]'  \
-dset	1	2	12	$aysPath/501018/subAverage/stats.501018+tlrc'[4]'  \
-dset	1	2	13	$aysPath/501019/subAverage/stats.501019+tlrc'[4]'  \
-dset	1	2	14	$aysPath/501020/subAverage/stats.501020+tlrc'[4]'  \
-dset	1	2	15	$aysPath/501021/subAverage/stats.501021+tlrc'[4]'  \
-dset	1	2	16	$aysPath/501024/subAverage/stats.501024+tlrc'[4]'  \
-dset	1	2	17	$aysPath/501025/subAverage/stats.501025+tlrc'[4]'  \
-dset	1	2	18	$aysPath/501027/subAverage/stats.501027+tlrc'[4]'  \
-dset	1	2	19	$aysPath/501028/subAverage/stats.501028+tlrc'[4]'  \
-dset	2	2	1	$aysPath/502001/subAverage/stats.502001+tlrc'[4]'  \
-dset	2	2	2	$aysPath/502004/subAverage/stats.502004+tlrc'[4]'  \
-dset	2	2	3	$aysPath/502005/subAverage/stats.502005+tlrc'[4]'  \
-dset	2	2	4	$aysPath/502006/subAverage/stats.502006+tlrc'[4]'  \
-dset	2	2	5	$aysPath/502008/subAverage/stats.502008+tlrc'[4]'  \
-dset	2	2	6	$aysPath/502010/subAverage/stats.502010+tlrc'[4]'  \
-dset	2	2	7	$aysPath/502012/subAverage/stats.502012+tlrc'[4]'  \
-dset	2	2	8	$aysPath/502014/subAverage/stats.502014+tlrc'[4]'  \
-dset	2	2	9	$aysPath/502015/subAverage/stats.502015+tlrc'[4]'  \
-dset	2	2	10	$aysPath/502016/subAverage/stats.502016+tlrc'[4]'  \
-dset	2	2	11	$aysPath/502018/subAverage/stats.502018+tlrc'[4]'  \
-dset	2	2	12	$aysPath/502019/subAverage/stats.502019+tlrc'[4]'  \
-dset	2	2	13	$aysPath/502020/subAverage/stats.502020+tlrc'[4]'  \
-dset	2	2	14	$aysPath/502022/subAverage/stats.502022+tlrc'[4]'  \
-dset	2	2	15	$aysPath/502023/subAverage/stats.502023+tlrc'[4]'  \
-dset	2	2	16	$aysPath/502024/subAverage/stats.502024+tlrc'[4]'  \
-dset	2	2	17	$aysPath/502025/subAverage/stats.502025+tlrc'[4]'  \
-dset	2	2	18	$aysPath/502026/subAverage/stats.502026+tlrc'[4]'  \
-dset	2	2	19	$aysPath/502030/subAverage/stats.502030+tlrc'[4]'  \
-dset	1	3	1	$aysPath/501003/subAverage/stats.501003+tlrc'[28]'  \
-dset	1	3	2	$aysPath/501004/subAverage/stats.501004+tlrc'[28]'  \
-dset	1	3	3	$aysPath/501005/subAverage/stats.501005+tlrc'[28]'  \
-dset	1	3	4	$aysPath/501006/subAverage/stats.501006+tlrc'[28]'  \
-dset	1	3	5	$aysPath/501007/subAverage/stats.501007+tlrc'[28]'  \
-dset	1	3	6	$aysPath/501008/subAverage/stats.501008+tlrc'[28]'  \
-dset	1	3	7	$aysPath/501009/subAverage/stats.501009+tlrc'[28]'  \
-dset	1	3	8	$aysPath/501010/subAverage/stats.501010+tlrc'[28]'  \
-dset	1	3	9	$aysPath/501011/subAverage/stats.501011+tlrc'[28]'  \
-dset	1	3	10	$aysPath/501015/subAverage/stats.501015+tlrc'[28]'  \
-dset	1	3	11	$aysPath/501017/subAverage/stats.501017+tlrc'[28]'  \
-dset	1	3	12	$aysPath/501018/subAverage/stats.501018+tlrc'[28]'  \
-dset	1	3	13	$aysPath/501019/subAverage/stats.501019+tlrc'[28]'  \
-dset	1	3	14	$aysPath/501020/subAverage/stats.501020+tlrc'[28]'  \
-dset	1	3	15	$aysPath/501021/subAverage/stats.501021+tlrc'[28]'  \
-dset	1	3	16	$aysPath/501024/subAverage/stats.501024+tlrc'[28]'  \
-dset	1	3	17	$aysPath/501025/subAverage/stats.501025+tlrc'[28]'  \
-dset	1	3	18	$aysPath/501027/subAverage/stats.501027+tlrc'[28]'  \
-dset	1	3	19	$aysPath/501028/subAverage/stats.501028+tlrc'[28]'  \
-dset	2	3	1	$aysPath/502001/subAverage/stats.502001+tlrc'[28]'  \
-dset	2	3	2	$aysPath/502004/subAverage/stats.502004+tlrc'[28]'  \
-dset	2	3	3	$aysPath/502005/subAverage/stats.502005+tlrc'[28]'  \
-dset	2	3	4	$aysPath/502006/subAverage/stats.502006+tlrc'[28]'  \
-dset	2	3	5	$aysPath/502008/subAverage/stats.502008+tlrc'[28]'  \
-dset	2	3	6	$aysPath/502010/subAverage/stats.502010+tlrc'[28]'  \
-dset	2	3	7	$aysPath/502012/subAverage/stats.502012+tlrc'[28]'  \
-dset	2	3	8	$aysPath/502014/subAverage/stats.502014+tlrc'[28]'  \
-dset	2	3	9	$aysPath/502015/subAverage/stats.502015+tlrc'[28]'  \
-dset	2	3	10	$aysPath/502016/subAverage/stats.502016+tlrc'[28]'  \
-dset	2	3	11	$aysPath/502018/subAverage/stats.502018+tlrc'[28]'  \
-dset	2	3	12	$aysPath/502019/subAverage/stats.502019+tlrc'[28]'  \
-dset	2	3	13	$aysPath/502020/subAverage/stats.502020+tlrc'[28]'  \
-dset	2	3	14	$aysPath/502022/subAverage/stats.502022+tlrc'[28]'  \
-dset	2	3	15	$aysPath/502023/subAverage/stats.502023+tlrc'[28]'  \
-dset	2	3	16	$aysPath/502024/subAverage/stats.502024+tlrc'[28]'  \
-dset	2	3	17	$aysPath/502025/subAverage/stats.502025+tlrc'[28]'  \
-dset	2	3	18	$aysPath/502026/subAverage/stats.502026+tlrc'[28]'  \
-dset	2	3	19	$aysPath/502030/subAverage/stats.502030+tlrc'[28]'  \
-fa Group				\
-fb Condition				\
-fab Group_x_Condition			\
-bucket anova.stats							


#Move ANOVA analysis file
mv anova.stats* $outPath

fi

#===============================================================#
# Create a bucket containing means of each condition to assist in understanding interactions
if [ 0 -eq 1 ]; then 

3dbucket \
    -aglueto $outPath/cell.means $outPath/anova.stats+tlrc[2,4,6,8] 				


fi #end wanting this sectino of code to be ran

#===============================================================#
# set to 1 if you want to run this section of code
if [ 1 -eq 1 ]; then 

# Copy average template brain if neccesary

if [ -f $outPath/MNI152_1mm_uni+tlrc.HEAD ]; then
    echo "Copying over anatomical template"
    3dcopy $anatPath/MNI152_1mm_uni+tlrc $outPath/MNI152_1mm_uni+tlrc
else 
    echo "Anatomical File Already Present"		
fi

fi #end of if/then controlling the execution of this section of code
