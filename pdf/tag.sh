

rm -rf all.html clean.txt abstracts.txt words.txt frequencies.txt go-file.txt commonwords.txt


Tmp=/tmp/$USER/cloud
mkdir -p $Tmp
rm -rf $Tmp/*

for f in $*
do
    echo $f 
    pdftotext $f $Tmp/$f.txt
done 

cat $Tmp/*  |
perl -lpe s/[^[:print:]]+//g |
sed 's/[^a-zA-Z]/ /g' | 
tr '[:upper:]' '[:lower:]' | 
tr ' ' '
' | 
sed '/^$/d' | 
sed '/^[a-z]$/d' | 
grep -v -w -f stopwords.txt | 
sort |
uniq -c  | 
sort -r -n > $Tmp/frequencies.txt


head -n50 < $Tmp/frequencies.txt | gawk '{print $2": " $1}' |
xclip -selection c

#cat words.txt | grep -w -f go-file.txt > commonwords.txt
