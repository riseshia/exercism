#!/usr/bin/env bash

main () {
  name=${1-you}
  echo "One for ${name}, one for me."
}

main "$@"
