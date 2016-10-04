clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Analysis pipeline in case analysis must be redone%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1. Must run a unix matlab script called roiAnalysis.m (Must be run in unix
%----%enviroment)
%----(L:\raupperle\Green.01\Experiments\ConfPtsd.01\Scripts\Imaging\Models\BasicModel\roiAnalysis)
%--This script will peform an roi analysis. The rois are selected from
%------the variable called 'roiPath'. All rois in the directory this variable
%------is storing will be extracted and placed into a csv file in the
%------location set by outpath. 

%2. Next Script is called lmm3way.m
%----(L:\raupperle\Green.01\Experiments\ConfPtsd.01\Scripts\Imaging\Models\BasicModel\roiAnalysis\lnMixModels\meta.roi)
%----This script will format the csv output from roiAnalysis into a
%------dataTable format. On line 27 you should set the CSV file that it
%------that it is looking for. Also adjust the amount of rows it should
%------load in.
%----Once the script is finished you must save the variable called
%------'dataTable'. Make sure to save it in the same directory as the next
%------script called manuScript.m. This is the same directory that contains
%------lmm3way.m (the script we are running in this step). 

%3. Finally run the script called Manuscript.m (This script)
%----(L:\raupperle\Green.01\Experiments\ConfPtsd.01\Scripts\Imaging\Models\BasicModel\roiAnalysis\lnMixModels\meta.roi)
%----This script will run the linear mixed model seprating by roi and
%----condition. 



%Roi output from the rois drawn from the Pattel paper
load('aug.pattel.dataTable.mat')
roiLabels = {'amygdala.pat', 'rACC.pat', 'caudate.pat', 'insula.pat', 'lPFC.pat'};

hemiLabels ={'Left', 'Right', 'Medial'};
condLabels = {'Low Reward', 'Medium Reward', 'High Reward'};

%Get only conflict condition observations (4 - 6)
dataTable = dataTable(dataTable.Condition < 4,:);
%Recode them as 1-3 from 4-6
% dataTable.Condition = dataTable.Condition - 3; 
%Create a category for condition column
dataTable.catcnd = categorical(dataTable.Condition); 

%Binarize symptoms
dataTable.catsym = dataTable.lft_syp >= median(dataTable.lft_syp)+1;
dataTable.catsym = dataTable.catsym + 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% ROI Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%We want to see what effect of brain response, symptom severity, and
%condition have on predicting end point (approach behavior) so we are
%using a linear mixed model with thsoe terms and also a random effects term
%to account for differnce of each subject. 

roi = 5;
hemi = 1;

%Get observations with the correct ROI and hemisphere

observations = find(dataTable.ROI == roi & dataTable.Hemisphere == hemi );

%Run a full model including all three terms and their interactions. 
region_full = fitlme(dataTable(observations,:), 'EndPoint ~ 1 + lft_syp * Condition * brain_response + (1 | Subject)');

region_full = fitlme(dataTable(observations,:), 'EndPoint ~ 1 + lft_syp * brain_response + (1 | Subject)');


%Three way interaction is signficant.

 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%% Symptom  Analysis  %%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %Break down the effect of symptom in the three way interaction. We are
    %using a two term linear model removing symptom severity. Symptom
    %severity will be median split and then high and low severity will be
    %analyzed separately to see the effect of high and low with condition
    %and brain response for predicing approach behavior. 
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%% Low Symptom Analysis %%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        %Get observations of low symptom severity
        observations = find(dataTable.ROI == roi & dataTable.Hemisphere == hemi & dataTable.catsym == 1 );
   
        %Test condition and brain respons on approach behavior for low symptom    
        lowsym = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  Condition * brain_response + (1 | Subject)');
    
        %Two way interaction was signficant for low symptom severity. Lets
        %break up by condition to see which conditions are different from each
        %other
    
        %Set reference condition 
        dataTable.catcnd = reordercats(dataTable.catcnd, {'1','2','3'});
        lowsym_lowRew = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  catcnd * brain_response + (1 | Subject)');
    
        %low versus moderate
        outTable(1,1) = lowsym_lowRew.Coefficients.Estimate(5);
        outTable(1,2) = lowsym_lowRew.Coefficients.DF(5);
        outTable(1,3) = lowsym_lowRew.Coefficients.tStat(5);
        outTable(1,4) = lowsym_lowRew.Coefficients.pValue(5);
        
        %low versus high
        outTable(2,1) = lowsym_lowRew.Coefficients.Estimate(6);
        outTable(2,2) = lowsym_lowRew.Coefficients.DF(6);
        outTable(2,3) = lowsym_lowRew.Coefficients.tStat(6);
        outTable(2,4) = lowsym_lowRew.Coefficients.pValue(6);
        
        dataTable.catcnd = reordercats(dataTable.catcnd, {'3','2','1'}); 
        lowsym_highRew = fitlme(dataTable(observations,:), 'EndPoint ~ 1 + catcnd * brain_response + (1 | Subject)');
    
        %moderate versus high
        outTable(3,1) = lowsym_highRew.Coefficients.Estimate(5);
        outTable(3,2) = lowsym_highRew.Coefficients.DF(5);
        outTable(3,3) = lowsym_highRew.Coefficients.tStat(5);
        outTable(3,4) = lowsym_highRew.Coefficients.pValue(5);
        
        
        %Low is signifcantly different from moderate and high reward 
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%% High Symptom Analysis %%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    
        %Get observations of high symptom severity
        observations = find(dataTable.ROI == roi & dataTable.Hemisphere == hemi & dataTable.catsym == 2 );
    
        %Test condition and brain respons on approach behavior for low symptom    
        higsym = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  Condition * brain_response + (1 | Subject)');
    
        %Set reference condition 
        dataTable.catcnd = reordercats(dataTable.catcnd, {'1','2','3'});
        higsym_lowRew = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  catcnd * brain_response + (1 | Subject)');
    
                %low versus moderate
        outTable(4,1) = higsym_lowRew.Coefficients.Estimate(5);
        outTable(4,2) = higsym_lowRew.Coefficients.DF(5);
        outTable(4,3) = higsym_lowRew.Coefficients.tStat(5);
        outTable(4,4) = higsym_lowRew.Coefficients.pValue(5);
        
        %low versus high
        outTable(5,1) = higsym_lowRew.Coefficients.Estimate(6);
        outTable(5,2) = higsym_lowRew.Coefficients.DF(6);
        outTable(5,3) = higsym_lowRew.Coefficients.tStat(6);
        outTable(5,4) = higsym_lowRew.Coefficients.pValue(6);
        
        dataTable.catcnd = reordercats(dataTable.catcnd, {'3','2','1'}); 
        higsym_highRew = fitlme(dataTable(observations,:), 'EndPoint ~ 1 + catcnd * brain_response + (1 | Subject)');
        
        outTable(6,1) = higsym_highRew.Coefficients.Estimate(5);
        outTable(6,2) = higsym_highRew.Coefficients.DF(5);
        outTable(6,3) = higsym_highRew.Coefficients.tStat(5);
        outTable(6,4) = higsym_highRew.Coefficients.pValue(5);
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Amygdala Analysis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
        

        %Get observations of high symptom severity
        observations = find(dataTable.ROI == roi & dataTable.Hemisphere == hemi & dataTable.Condition == 1 );
        
        %Test condition and brain respons on approach behavior for low symptom    
        lowRew_cmpsym = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  catsym * brain_response + (1 | Subject)');
        
        %low versus high
        cmpsyp_outTable(1,1) = lowRew_cmpsym.Coefficients.Estimate(4);
        cmpsyp_outTable(1,2) = lowRew_cmpsym.Coefficients.DF(4);
        cmpsyp_outTable(1,3) = lowRew_cmpsym.Coefficients.tStat(4);
        cmpsyp_outTable(1,4) = lowRew_cmpsym.Coefficients.pValue(4);
        
        %Get observations of high symptom severity
        observations = find(dataTable.ROI == roi & dataTable.Hemisphere == hemi & dataTable.Condition == 2 );
        
        %Test condition and brain respons on approach behavior for low symptom    
        modRew_cmpsym = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  catsym * brain_response + (1 | Subject)');
        
        %low versus high
        cmpsyp_outTable(2,1) = modRew_cmpsym.Coefficients.Estimate(4);
        cmpsyp_outTable(2,2) = modRew_cmpsym.Coefficients.DF(4);
        cmpsyp_outTable(2,3) = modRew_cmpsym.Coefficients.tStat(4);
        cmpsyp_outTable(2,4) = modRew_cmpsym.Coefficients.pValue(4);
        
        %Get observations of high symptom severity
        observations = find(dataTable.ROI == roi & dataTable.Hemisphere == hemi & dataTable.Condition == 3 );
        
        %Test condition and brain respons on approach behavior for low symptom    
        higRew_cmpsym = fitlme(dataTable(observations,:), 'EndPoint ~ 1 +  catsym * brain_response + (1 | Subject)');
        
        %low versus high
        cmpsyp_outTable(3,1) = higRew_cmpsym.Coefficients.Estimate(4);
        cmpsyp_outTable(3,2) = higRew_cmpsym.Coefficients.DF(4);
        cmpsyp_outTable(3,3) = higRew_cmpsym.Coefficients.tStat(4);
        cmpsyp_outTable(3,4) = higRew_cmpsym.Coefficients.pValue(4);
        
        
        
        