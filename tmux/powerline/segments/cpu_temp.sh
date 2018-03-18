# Print out Memory, cpu and load using https://github.com/thewtex/tmux-mem-cpu-load

run_segment() {
	sensors >/dev/null 2>&1
	if [ "$?" -ne 0 ]; then
		return
	fi

	temp=$(sensors | awk '/k10temp/{f=1} f{if ($1 ~ "^temp1*") {print $2}}')
	if [ -n "$temp" ]; then
		echo "$temp";
	fi
	return 0
}
