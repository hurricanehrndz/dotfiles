# Print the average load.

run_segment() {
  usage=$(mpstat | awk '{ if ($3 == "all") { idle=$13; print (100 - idle)"%"; } }')
  load=$(uptime | cut -d "," -f 3- | cut -d ":" -f2 | sed -e "s/^[ \t]*//")
  echo "$usage $load";
  return 0
}
