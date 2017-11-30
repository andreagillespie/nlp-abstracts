x=$(grep -P -o '\d{8}</PMID>' $1)
count=0
for i in $x
  do
    p=$(grep -P -o '\d{8}' <<< $i)
    touch filenameforabstracts\/$p
    efetch -db pubmed -id $p -format abstract >> filenameforabstracts\/$p
    (( count++ ))
    printf "$count \n" 
    sleep 1
  done
