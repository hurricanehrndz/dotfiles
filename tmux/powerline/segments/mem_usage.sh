# Print out Memory, cpu and load using https://github.com/thewtex/tmux-mem-cpu-load

run_segment() {
  awk -v type=$TYPE '
  /^MemTotal:/ {
    mem_total=$2
  }
  /^MemFree:/ {
    mem_free=$2
  }
  /^Buffers:/ {
    mem_free+=$2
  }
  /^Cached:/ {
    mem_free+=$2
  }
  /^SReclaimable:/ {
    mem_free+=$2
  }
  /^SwapTotal:/ {
    swap_total=$2
  }
  /^SwapFree:/ {
    swap_free=$2
  }
  END {
    free=mem_free/1024/1024
    used=(mem_total-mem_free)/1024/1024
    total=mem_total/1024/1024

    # full text
    printf("%.1fG/%.1fG\n", used, total)
  }
  ' /proc/meminfo
}
