#!/bin/sh
#Parse output of VCFComparator (USeq) to table format
#http://useq.sourceforge.net/cmdLnMenus.html#VCFComparator
#sh  ~/bin/VCFComparator2table.sh */*.xls

echo -e "Key VCF\tTest VCF\tInterrogated bps in key\tInterrogated bps in test\tInterrogated bps in common\tKey variants\tKey variants in shared regions\tTest variants\tTest variants in shared regions\tNumMatchTest\tNumNonMatchTest\tFDR=nonMatchTest/(matchTest+nonMatchTest)\tdecreasingFDR\tTPR=matchTest/totalKey\tFPR=nonMatchTest/totalKey\tPPV=matchTest/(matchTest+nonMatchTest)"
for i in $@
        do
                KEY=`grep -P "Key vcf file$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                TEST=`grep -P "Test vcf file$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V1=`grep -P "Interrogated bps in key$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V2=`grep -P "Interrogated bps in test$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V3=`grep -P "Interrogated bps in common$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V4=`grep -P "Key variants$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V5=`grep -P "Key variants in shared regions$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V6=`grep -P "Test variants$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V7=`grep -P "Test variants in shared regions$" $i |sed -e 's/.vcf/\t/' |cut -f 1 `
                V8=`grep -P "none" $i |cut -f 2-20 `
                echo -e "$KEY\t$TEST\t$V1\t$V2\t$V3\t$V4\t$V5\t$V6\t$V7\t$V8"
        done
