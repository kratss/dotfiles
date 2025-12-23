#!/bin/bash
count=0
for i in $(upower -e); do
	temp=$(upower -i $i | grep model)
	if [ "${#temp}" -eq 0 ]; then
		continue
	else
		bat+=("$(upower -i $i | grep model) $(upower -i $i | grep percentage)")
		bat[$count]=${bat[$count]/"model: "/}
		bat[$count]=${bat[$count]/"percentage:"/}
	
		bat[$count]=$(echo ${bat[$count]})
		bat[$count]=${bat[$count]}$'\n'
		#echo "Power" "${bat[$count]}"
		count=$(($count+1))
	fi
done
echo  -e "${bat[@]}asdfasd"
