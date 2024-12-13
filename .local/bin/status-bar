#!/usr/bin/env sh

bar() {
  local date_formatted=$(date +'%H:%M %d/%m/%Y')
  local battery_status=$(cat /sys/class/power_supply/BAT1/capacity)

  echo "🔋$battery_status% ⏳$date_formatted"
}

bar
