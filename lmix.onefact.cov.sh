aysPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01/Analysis/Imaging/Models/BasicModel/subjectLevel
outPath=/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/ConfPtsd.01/Analysis/Imaging/Models/BasicModel/groupLevel/whole.brain/lnmix/lftm.by.cnf
anatPath=/home/LIBRAD/sgreen/storage/labs/jfeinstein/Green/Experiments/Float.01/Scripts/BrainTemplates 


#-num_glt 1									\
#-gltLabel 1 'std' -gltCode 1 'cond : 1*app -1*avd'				\

3dLME -prefix $outPath -jobs 20							\
-mask grpMask+tlrc								\
-model 'cond*lftm'								\
-qVars 'lftm'									\
-ranEff '~1'									\
-SS_type 3									\
-num_glt 3									\
-gltLabel 1 'hig-low' -gltCode 1 'cond : 1*high -1*low'				\
-gltLabel 2 'hig-mid' -gltCode 2 'cond : 1*high -1*mod'				\
-gltLabel 3 'mid-low' -gltCode 3 'cond : 1*mod -1*low'				\
-dataTable									\
Subj	cond	lftm	InputFile						\
501002	low	9	$aysPath/501002/subAverage/stats.501002+tlrc'[7]'	\
501003	low	15	$aysPath/501003/subAverage/stats.501003+tlrc'[7]'	\
501004	low	11	$aysPath/501004/subAverage/stats.501004+tlrc'[7]'	\
501005	low	11	$aysPath/501005/subAverage/stats.501005+tlrc'[7]'	\
501006	low	9	$aysPath/501006/subAverage/stats.501006+tlrc'[7]'	\
501007	low	10	$aysPath/501007/subAverage/stats.501007+tlrc'[7]'	\
501008	low	8	$aysPath/501008/subAverage/stats.501008+tlrc'[7]'	\
501009	low	7	$aysPath/501009/subAverage/stats.501009+tlrc'[7]'	\
501010	low	14	$aysPath/501010/subAverage/stats.501010+tlrc'[7]'	\
501011	low	9	$aysPath/501011/subAverage/stats.501011+tlrc'[7]'	\
501015	low	9	$aysPath/501015/subAverage/stats.501015+tlrc'[7]'	\
501017	low	13	$aysPath/501017/subAverage/stats.501017+tlrc'[7]'	\
501018	low	7	$aysPath/501018/subAverage/stats.501018+tlrc'[7]'	\
501019	low	14	$aysPath/501019/subAverage/stats.501019+tlrc'[7]'	\
501020	low	7	$aysPath/501020/subAverage/stats.501020+tlrc'[7]'	\
501021	low	12	$aysPath/501021/subAverage/stats.501021+tlrc'[7]'	\
501023	low	14	$aysPath/501023/subAverage/stats.501023+tlrc'[7]'	\
501024	low	14	$aysPath/501024/subAverage/stats.501024+tlrc'[7]'	\
501025	low	6	$aysPath/501025/subAverage/stats.501025+tlrc'[7]'	\
501026	low	14	$aysPath/501026/subAverage/stats.501026+tlrc'[7]'	\
501027	low	8	$aysPath/501027/subAverage/stats.501027+tlrc'[7]'	\
501028	low	10	$aysPath/501028/subAverage/stats.501028+tlrc'[7]'	\
502001	low	0	$aysPath/502001/subAverage/stats.502001+tlrc'[7]'	\
502004	low	1	$aysPath/502004/subAverage/stats.502004+tlrc'[7]'	\
502005	low	0	$aysPath/502005/subAverage/stats.502005+tlrc'[7]'	\
502006	low	0	$aysPath/502006/subAverage/stats.502006+tlrc'[7]'	\
502008	low	3	$aysPath/502008/subAverage/stats.502008+tlrc'[7]'	\
502010	low	3	$aysPath/502010/subAverage/stats.502010+tlrc'[7]'	\
502012	low	4	$aysPath/502012/subAverage/stats.502012+tlrc'[7]'	\
502014	low	4	$aysPath/502014/subAverage/stats.502014+tlrc'[7]'	\
502015	low	4	$aysPath/502015/subAverage/stats.502015+tlrc'[7]'	\
502016	low	5	$aysPath/502016/subAverage/stats.502016+tlrc'[7]'	\
502018	low	0	$aysPath/502018/subAverage/stats.502018+tlrc'[7]'	\
502019	low	0	$aysPath/502019/subAverage/stats.502019+tlrc'[7]'	\
502020	low	2	$aysPath/502020/subAverage/stats.502020+tlrc'[7]'	\
502021	low	2	$aysPath/502021/subAverage/stats.502021+tlrc'[7]'	\
502022	low	1	$aysPath/502022/subAverage/stats.502022+tlrc'[7]'	\
502023	low	5	$aysPath/502023/subAverage/stats.502023+tlrc'[7]'	\
502024	low	1	$aysPath/502024/subAverage/stats.502024+tlrc'[7]'	\
502025	low	5	$aysPath/502025/subAverage/stats.502025+tlrc'[7]'	\
502026	low	1	$aysPath/502026/subAverage/stats.502026+tlrc'[7]'	\
502029	low	2	$aysPath/502029/subAverage/stats.502029+tlrc'[7]'	\
502030	low	1	$aysPath/502030/subAverage/stats.502030+tlrc'[7]'	\
501002	mod	9	$aysPath/501002/subAverage/stats.501002+tlrc'[10]'	\
501003	mod	15	$aysPath/501003/subAverage/stats.501003+tlrc'[10]'	\
501004	mod	11	$aysPath/501004/subAverage/stats.501004+tlrc'[10]'	\
501005	mod	11	$aysPath/501005/subAverage/stats.501005+tlrc'[10]'	\
501006	mod	9	$aysPath/501006/subAverage/stats.501006+tlrc'[10]'	\
501007	mod	10	$aysPath/501007/subAverage/stats.501007+tlrc'[10]'	\
501008	mod	8	$aysPath/501008/subAverage/stats.501008+tlrc'[10]'	\
501009	mod	7	$aysPath/501009/subAverage/stats.501009+tlrc'[10]'	\
501010	mod	14	$aysPath/501010/subAverage/stats.501010+tlrc'[10]'	\
501011	mod	9	$aysPath/501011/subAverage/stats.501011+tlrc'[10]'	\
501015	mod	9	$aysPath/501015/subAverage/stats.501015+tlrc'[10]'	\
501017	mod	13	$aysPath/501017/subAverage/stats.501017+tlrc'[10]'	\
501018	mod	7	$aysPath/501018/subAverage/stats.501018+tlrc'[10]'	\
501019	mod	14	$aysPath/501019/subAverage/stats.501019+tlrc'[10]'	\
501020	mod	7	$aysPath/501020/subAverage/stats.501020+tlrc'[10]'	\
501021	mod	12	$aysPath/501021/subAverage/stats.501021+tlrc'[10]'	\
501023	mod	14	$aysPath/501023/subAverage/stats.501023+tlrc'[10]'	\
501024	mod	14	$aysPath/501024/subAverage/stats.501024+tlrc'[10]'	\
501025	mod	6	$aysPath/501025/subAverage/stats.501025+tlrc'[10]'	\
501026	mod	14	$aysPath/501026/subAverage/stats.501026+tlrc'[10]'	\
501027	mod	8	$aysPath/501027/subAverage/stats.501027+tlrc'[10]'	\
501028	mod	10	$aysPath/501028/subAverage/stats.501028+tlrc'[10]'	\
502001	mod	0	$aysPath/502001/subAverage/stats.502001+tlrc'[10]'	\
502004	mod	1	$aysPath/502004/subAverage/stats.502004+tlrc'[10]'	\
502005	mod	0	$aysPath/502005/subAverage/stats.502005+tlrc'[10]'	\
502006	mod	0	$aysPath/502006/subAverage/stats.502006+tlrc'[10]'	\
502008	mod	3	$aysPath/502008/subAverage/stats.502008+tlrc'[10]'	\
502010	mod	3	$aysPath/502010/subAverage/stats.502010+tlrc'[10]'	\
502012	mod	4	$aysPath/502012/subAverage/stats.502012+tlrc'[10]'	\
502014	mod	4	$aysPath/502014/subAverage/stats.502014+tlrc'[10]'	\
502015	mod	4	$aysPath/502015/subAverage/stats.502015+tlrc'[10]'	\
502016	mod	5	$aysPath/502016/subAverage/stats.502016+tlrc'[10]'	\
502018	mod	0	$aysPath/502018/subAverage/stats.502018+tlrc'[10]'	\
502019	mod	0	$aysPath/502019/subAverage/stats.502019+tlrc'[10]'	\
502020	mod	2	$aysPath/502020/subAverage/stats.502020+tlrc'[10]'	\
502021	mod	2	$aysPath/502021/subAverage/stats.502021+tlrc'[10]'	\
502022	mod	1	$aysPath/502022/subAverage/stats.502022+tlrc'[10]'	\
502023	mod	5	$aysPath/502023/subAverage/stats.502023+tlrc'[10]'	\
502024	mod	1	$aysPath/502024/subAverage/stats.502024+tlrc'[10]'	\
502025	mod	5	$aysPath/502025/subAverage/stats.502025+tlrc'[10]'	\
502026	mod	1	$aysPath/502026/subAverage/stats.502026+tlrc'[10]'	\
502029	mod	2	$aysPath/502029/subAverage/stats.502029+tlrc'[10]'	\
502030	mod	1	$aysPath/502030/subAverage/stats.502030+tlrc'[10]'	\
501002	high	9	$aysPath/501002/subAverage/stats.501002+tlrc'[13]'	\
501003	high	15	$aysPath/501003/subAverage/stats.501003+tlrc'[13]'	\
501004	high	11	$aysPath/501004/subAverage/stats.501004+tlrc'[13]'	\
501005	high	11	$aysPath/501005/subAverage/stats.501005+tlrc'[13]'	\
501006	high	9	$aysPath/501006/subAverage/stats.501006+tlrc'[13]'	\
501007	high	10	$aysPath/501007/subAverage/stats.501007+tlrc'[13]'	\
501008	high	8	$aysPath/501008/subAverage/stats.501008+tlrc'[13]'	\
501009	high	7	$aysPath/501009/subAverage/stats.501009+tlrc'[13]'	\
501010	high	14	$aysPath/501010/subAverage/stats.501010+tlrc'[13]'	\
501011	high	9	$aysPath/501011/subAverage/stats.501011+tlrc'[13]'	\
501015	high	9	$aysPath/501015/subAverage/stats.501015+tlrc'[13]'	\
501017	high	13	$aysPath/501017/subAverage/stats.501017+tlrc'[13]'	\
501018	high	7	$aysPath/501018/subAverage/stats.501018+tlrc'[13]'	\
501019	high	14	$aysPath/501019/subAverage/stats.501019+tlrc'[13]'	\
501020	high	7	$aysPath/501020/subAverage/stats.501020+tlrc'[13]'	\
501021	high	12	$aysPath/501021/subAverage/stats.501021+tlrc'[13]'	\
501023	high	14	$aysPath/501023/subAverage/stats.501023+tlrc'[13]'	\
501024	high	14	$aysPath/501024/subAverage/stats.501024+tlrc'[13]'	\
501025	high	6	$aysPath/501025/subAverage/stats.501025+tlrc'[13]'	\
501026	high	14	$aysPath/501026/subAverage/stats.501026+tlrc'[13]'	\
501027	high	8	$aysPath/501027/subAverage/stats.501027+tlrc'[13]'	\
501028	high	10	$aysPath/501028/subAverage/stats.501028+tlrc'[13]'	\
502001	high	0	$aysPath/502001/subAverage/stats.502001+tlrc'[13]'	\
502004	high	1	$aysPath/502004/subAverage/stats.502004+tlrc'[13]'	\
502005	high	0	$aysPath/502005/subAverage/stats.502005+tlrc'[13]'	\
502006	high	0	$aysPath/502006/subAverage/stats.502006+tlrc'[13]'	\
502008	high	3	$aysPath/502008/subAverage/stats.502008+tlrc'[13]'	\
502010	high	3	$aysPath/502010/subAverage/stats.502010+tlrc'[13]'	\
502012	high	4	$aysPath/502012/subAverage/stats.502012+tlrc'[13]'	\
502014	high	4	$aysPath/502014/subAverage/stats.502014+tlrc'[13]'	\
502015	high	4	$aysPath/502015/subAverage/stats.502015+tlrc'[13]'	\
502016	high	5	$aysPath/502016/subAverage/stats.502016+tlrc'[13]'	\
502018	high	0	$aysPath/502018/subAverage/stats.502018+tlrc'[13]'	\
502019	high	0	$aysPath/502019/subAverage/stats.502019+tlrc'[13]'	\
502020	high	2	$aysPath/502020/subAverage/stats.502020+tlrc'[13]'	\
502021	high	2	$aysPath/502021/subAverage/stats.502021+tlrc'[13]'	\
502022	high	1	$aysPath/502022/subAverage/stats.502022+tlrc'[13]'	\
502023	high	5	$aysPath/502023/subAverage/stats.502023+tlrc'[13]'	\
502024	high	1	$aysPath/502024/subAverage/stats.502024+tlrc'[13]'	\
502025	high	5	$aysPath/502025/subAverage/stats.502025+tlrc'[13]'	\
502026	high	1	$aysPath/502026/subAverage/stats.502026+tlrc'[13]'	\
502029	high	2	$aysPath/502029/subAverage/stats.502029+tlrc'[13]'	\
502030	high	1	$aysPath/502030/subAverage/stats.502030+tlrc'[13]'
