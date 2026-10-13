#!/usr/bin/env bash

# Simple interest calculator: SI = (principal * rate * time) / 100

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual rate of interest (%): " rate
read -r -p "Enter time period (years): " time

for value in "$principal" "$rate" "$time"; do
  if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter non-negative numbers only." >&2
    exit 1
  fi
done

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
echo "Simple interest: $interest"
