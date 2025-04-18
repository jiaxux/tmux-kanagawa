#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

get_platform()
{
  case $(uname -s) in
    Linux)
      gpu=$(lspci -v | grep VGA | tail -n 1 | awk '{print $5}')
      echo $gpu
      ;;

    Darwin)
      # TODO - Darwin/Mac compatability
      ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      # TODO - windows compatability
      ;;
  esac
}

get_gpu()
{
  gpu=$(get_platform)
  if [[ "$gpu" == NVIDIA ]]; then
    usage=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits | awk '{ used += $0; total +=$2 } END { printf("%dGB/%dGB\n", used / 1024, total / 1024) }')
  else
    usage='unknown'
  fi
  normalize_percent_len $usage
}

main()
{
  # storing the refresh rate in the variable RATE, default is 5
  RATE=$(get_tmux_option "@kanagawa-refresh-rate" 5)
  gpu_label=$(get_tmux_option "@kanagawa-gpu-usage-label" "VRAM")
  gpu_usage=$(get_gpu)
  echo "$gpu_label $gpu_usage"
  sleep $RATE
}

# run the main driver
main
