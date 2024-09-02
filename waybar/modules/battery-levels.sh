#!/bin/bash
count=0
out="<tt>"
for i in $(upower -e); do
	dist=12
	temp=$(upower -i $i | grep model)
	if [ "${#temp}" -eq 0 ]; then
		continue
	else
		mdl=$(upower -i $i | grep model)
		pct=$(upower -i $i | grep percentage)
	
		mdl=${mdl/"model:"/}
		mdl=$(echo $mdl | head -c 10) #eliminates extra spaces
		
		pct=${pct/"percentage:"/}
		pct=$(echo $pct)
		
		if [ ${#pct} -eq 4 ]
		then
			dist=$(($dist-1))
		fi	
		
		while [ ${#mdl} -le $dist ]
		do
			((j++))	
			mdl+=$' '
		done
	
		bat=$mdl$pct
		out+=${bat}
		out+=$'\\n'
		count=$(($count+1))
	fi
done
out+="</tt>"
echo "{\"text\": \"${out}\", \"tooltip\": \"dfsg\", \"class\": \"AAAA\", \"percentage\": \"5\"}"
#echo $bob
