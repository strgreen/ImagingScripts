#!/usr/bin/python

import os, sys, shutil, fnmatch, random

#-Declarations-#############################################
############################################################

#Enter in the corect values for these variables-------------
#------------------------------------------------------------

subject = 'AI224'
scanNum = 'S797'
session = 1

beh_tgt = '/home/LIBRAD/sgreen/storage/labs/raupperle/PilotAnx/Data/Original_Data/organized_folders'
dst = '/home/LIBRAD/sgreen/storage/labs/raupperle/Green.01/Experiments/AACReTest.01/Data/data-organized'

#------------------------------------------------------------

#Igore all lines past this point
#------------------------------------------------------------

letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

#-Declarations-#############################################
############################################################

#Add Subect and session to beh_tgt path
beh_tgt = beh_tgt + '/' + subject + '_T' + str(session)

#Add Subject to Destination Path
dst = dst + '/' + subject

#Add Session to Destination Path
dst = dst + '/T' + str(session)

#Declare target imaging path
img_tgt = '/media/mr2/rt/' + scanNum

fname_dict = {'MID_run5':'_MID-R1', 'MID_run6':'_MID-R2','Ax Mprage-Asset':'RAGE-RF', 'Rest_eye_open_run1':'REST-R1',			\
 'Hariri':'HARI-R1', 'AA_EPI_run2':'_AAC-R1', 'AA_EPI_run3':'_AAC-R2', 'AA_EPI_run4':'_AAC-R3', 'ASSET calibration':'ASST-RF', 		\
'3Plane Loc SSFSE':'_LOC-RF', 'VW':'__VW', 'DP':'DOTP', 'BM_EPI_run7':'__BM-R1', 'BM_EPI_run8':'__BM-R2' }

#fname_dict

#-Declarations-#############################################
############################################################

def mng_beh_files(beh_tgt,dst):
  print "Copying Behavioral Files"
  shutil.copytree(beh_tgt,dst + '/behavioral_session')

  #Get list of behavorial files
  files = os.listdir(dst + '/behavioral_session')
  
  for file in files:
    if fnmatch.fnmatch(file,'*.csv'):
          
      #Convert underscore to dash
      new_name = file.replace("_","-");       
      os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

  #Get New list of files with new names
  files = os.listdir(dst + '/behavioral_session')

  for file in files:
    if fnmatch.fnmatch(file,'*.csv'):

      if fnmatch.fnmatch(file, '*MID-*'):
	new_name = file[0:9] + '_MID' + file[12:]
        os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*AAC-*'):
	new_name = file[0:9] + '_AAC' + file[12:]
        os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*-PR-*'):
        new_name = file[0:9] + '__PR' + file[11:]
        os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*PRT-*'):
	new_name = file[0:9] + '_PRT' + file[12:]
	os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*VW-*'):
	new_name = file[0:9] + '__VW' + file[11:]
	os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*DP-*'):
	new_name = file[0:9] + '__DP' + file[11:]
	os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*BL-*'):
	new_name = file[0:9] + '__BL' + file[11:]
	os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)

      if fnmatch.fnmatch(file, '*_BMT_*'):
	new_name = file[0:9] + '__BM' + file[11:]
	os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)


  #Get New list of files with new names
  files = os.listdir(dst + '/behavioral_session')

  #Flip position of the session and task
  for file in files:
    if fnmatch.fnmatch(file,'*.csv'):
	
      new_name = file[0:9] + file[14:17] + file[9:13] + file[16:] 
      os.rename(dst + '/behavioral_session/' + file, dst + '/behavioral_session/' + new_name)



def mng_img_files(img_tgt,dst):
  print "Copying Scan Files"
  shutil.copytree(img_tgt,dst + '/functional_session')

  #Find the scan files
  files = os.listdir(dst + '/functional_session')

  for file in files:
    filename = " "

    if fnmatch.fnmatch(file,'mprage*HEAD'):
      cmd = '3dcopy ' + dst + '/functional_session/' + file + ' ' + dst + '/functional_session/' + subject + '-T' + str(session) + '-RAGE-RF'   
      os.system(cmd)
      cmd = 'rm ' + dst + '/functional_session/mprage*'
      os.system(cmd)   

    if fnmatch.fnmatch(file,'epi*orig.HEAD') and not fnmatch.fnmatch(file,'*reg3D*'): 
      
      filename = file
      scan_num = filename[filename.find('n_')+2:filename.find('__')]
      
      #Determine proper filename
      scan = open(dst + '/functional_session/' + 'scan_' + scan_num)
      for line in scan:
  	if line.find('Series De') > -1:          
          scan_name = line.split(':')[1].strip()
          scan_name = fname_dict[scan_name]
          scan_name = subject + '-T' + str(session) + '-' + scan_name

	  #Check to see if file exists; if it does append a random letter to it	
	  if os.path.isfile(dst + '/functional_session/' + scan_name + '+orig.HEAD' ):
 	    scan_name = scan_name + random.choice(letters)
	    print('###################################################################')
	    print('################## Found an Extra Copy of a file ##################')	
	    print('###################################################################')

	  #copy imaging files
          cmd = '3dcopy ' + dst + '/functional_session/' + filename + " " + dst + '/functional_session/' + scan_name   
          os.system(cmd)
	  cmd = 'mv ' + dst +'/functional_session/Resp_epiRT_scan_' + scan_num + '.1D ' + dst + '/functional_session/' + scan_name + '-Resp.1D'
          os.system(cmd)
	  cmd = 'mv ' + dst +'/functional_session/ECG_epiRT_scan_' + scan_num + '.1D ' + dst + '/functional_session/' + scan_name + '-ECG.1D'          
	  os.system(cmd)

  #remove files labled with epi     
  cmd = 'rm ' + dst + '/functional_session/epiRT*'  
  os.system(cmd)

  #remove files labled with efgre3d
  cmd = 'rm ' + dst + '/functional_session/efgre3d*'
  os.system(cmd)

  #remove scan files
  cmd = 'rm ' + dst + '/functional_session/scan*'
  os.system(cmd)



try:
   os.stat(dst)
   print "That directory already exsits"
except:
    os.makedirs(dst)
    mng_beh_files(beh_tgt,dst)
    mng_img_files(img_tgt,dst)


