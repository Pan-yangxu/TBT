#! bin/bash

###########################################################################
##                                                                       ##
##                Centre for Development of Advanced Computing           ##
##                               Mumbai                                  ##
##                         Copyright (c) 2017                            ##
##                        All Rights Reserved.                           ##
##                                                                       ##
##  Permission is hereby granted, free of charge, to use and distribute  ##
##  this software and its documentation without restriction, including   ##
##  without limitation the rights to use, copy, modify, merge, publish,  ##
##  distribute, sublicense, and/or sell copies of this work, and to      ##
##  permit persons to whom this work is furnished to do so, subject to   ##
##  the following conditions:                                            ##
##   1. The code must retain the above copyright notice, this list of    ##
##      conditions and the following disclaimer.                         ##
##   2. Any modifications must be clearly marked as such.                ##
##   3. Original authors' names are not deleted.                         ##
##   4. The authors' names are not used to endorse or promote products   ##
##      derived from this software without specific prior written        ##
##      permission.                                                      ##
##                                                                       ##
##                                                                       ##
###########################################################################
##                                                                       ##
##                     TTS Building Toolkit                              ##
##                                                                       ##
##            Designed and Developed by Atish and Rachana                ##
##          		Date:  April 2017                                ##
##                                                                       ## 
###########################################################################

LNG=$1
cd ..
tar -xjf resources/common/htsvoice/HTS-demo_CMU-ARCTIC-SLT.tar.bz2 

if [ $(find temp/htsvoice/utts | wc -l) -gt 0 ]
then
   echo "Found something"
else
   make utt_generation &
fi

if [ $(find temp/htsvoice/raw_files | wc -l) -gt 0 ]
then
   echo "Found something"
else
   make wav2raw
fi

cp resources/common/htsvoice/build_htsvoice.sh HTS-demo_CMU-ARCTIC-SLT/
cd HTS-demo_CMU-ARCTIC-SLT/
sh build_htsvoice.sh $LNG

echo -e "\n\n$(tput setaf 2)==Completed HTSVOICE Building==$(tput sgr0) \n\n"
