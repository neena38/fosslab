#!/bin/bash

pdftotext -layout -nopgbrk s1.pdf
pdftotext -layout -nopgbrk s2.pdf

grep -A 1 "MDL16CS" s1.txt>cs-s1.txt
grep -A 1 "MDL16CS" s2.txt>cs-s2.txt

sed -i 's/MA101//g' cs-s1.txt
sed -i 's/PH100//g' cs-s1.txt
sed -i 's/BE110//g' cs-s1.txt
sed -i 's/BE10105//g' cs-s1.txt
sed -i 's/BE103//g' cs-s1.txt
sed -i 's/EE100//g' cs-s1.txt
sed -i 's/PH110//g' cs-s1.txt
sed -i 's/EE110//g' cs-s1.txt
sed -i 's/\<CS110\>//g' cs-s1.txt
sed -i 's/,//g' cs-s1.txt
sed -i 's/--//g' cs-s1.txt
sed -i 's/     / /g' cs-s1.txt
tr -d "\n" <cs-s1.txt>cs-S1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' cs-S1.txt
mv cs-S1.txt cs-s1.txt

sed -i 's/(O)/10/g' cs-s1.txt
sed -i 's/(A+)/9/g' cs-s1.txt
sed -i 's/(A)/8.5/g' cs-s1.txt
sed -i 's/(B+)/8/g' cs-s1.txt
sed -i 's/(B)/7/g' cs-s1.txt
sed -i 's/(C)/6/g' cs-s1.txt
sed -i 's/(P)/5/g' cs-s1.txt
sed -i 's/(F)/0/g' cs-s1.txt

awk '{print $1 " " ($2*4 + $3*4 + $4*3  + $5*3  + $6*3  + $7*3  + $8*1  + $9*1 + $(10)*1 )/23}' cs-s1.txt >cs-S1.txt
mv cs-S1.txt cs-s1.txt


sed -i 's/CY100//g' cs-s2.txt
sed -i 's/BE100//g' cs-s2.txt
sed -i 's/EC100//g' cs-s2.txt
sed -i 's/CY110//g' cs-s2.txt
sed -i 's/EC110//g' cs-s2.txt
sed -i 's/MA102//g' cs-s2.txt
sed -i 's/BE102//g' cs-s2.txt
sed -i 's/\<CS100\>//g' cs-s2.txt
sed -i 's/\<CS120\>//g' cs-s2.txt
sed -i 's/,//g' cs-s2.txt
sed -i 's/--//g' cs-s2.txt
sed -i 's/            //g' cs-s2.txt
sed -i 's/     / /g' cs-s2.txt
tr -d "\n" <cs-s2.txt>cs-S2.txt
sed -i 's/MDL16CS/\nMDL16CS/g' cs-S2.txt
mv cs-S2.txt cs-s2.txt

sed -i 's/(O)/10/g' cs-s2.txt
sed -i 's/(A+)/9/g' cs-s2.txt
sed -i 's/(A)/8.5/g' cs-s2.txt
sed -i 's/(B+)/8/g' cs-s2.txt
sed -i 's/(B)/7/g' cs-s2.txt
sed -i 's/(C)/6/g' cs-s2.txt
sed -i 's/(P)/5/g' cs-s2.txt
sed -i 's/(F)/0/g' cs-s2.txt

awk '{print $1 " " ($2*4 + $3*4 + $4*3  + $5*1  + $6*1  + $7*4  + $8*3  + $9*3 + $(10)*1 )/24}' cs-s2.txt >cs-S2.txt
mv cs-S2.txt cs-s2.txt

awk '{print $1 " " $2 $3 $4 " " $5 " " $6 " " $7 " " $8}' c4b.txt >csb.txt

join -1 4 -2 1 csb.txt cs-s1.txt>csb1.txt
join -1 1 -2 1 csb1.txt cs-s2.txt>csb2.txt

awk '{print $1 "|"  $3 "|" $4 "|" $5 " " $6 "|" $7 "|" $8 "|" ($7*23 +$8*24)/47}' csb2.txt>csb1.txt
column -t -s "|" csb1.txt>csb2.txt
mv csb2.txt csb.txt

rm csb1.txt cs-s1.txt cs-s2.txt s1.txt s2.txt

nano csb.txt
