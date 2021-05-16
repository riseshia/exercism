#!/usr/bin/env bash

if ! [[ $# -eq 1 ]]; then
  echo "Usage: $0 <person>"
  exit 1
fi

echo "Hello, $1"
