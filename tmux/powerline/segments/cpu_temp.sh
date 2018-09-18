# Print out Memory, cpu and load using https://github.com/thewtex/tmux-mem-cpu-load

run_segment() {
	sensors >/dev/null 2>&1
	if [ "$?" -ne 0 ]; then
		return
	fi

	temp=$(sensors | awk '{ if($0 ~ "k10temp"){ amd=1 } if(amd){ if($1 ~ "^temp1*"){print $2; exit;}} if($0 ~ "^coretemp"){ intel=1 } if(intel){ if($1 ~ "^Package"){print $4; exit} } }')
	if [ -n "$temp" ]; then
		echo "$temp";
	fi
	return 0
}
