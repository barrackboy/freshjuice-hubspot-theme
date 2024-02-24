#!/bin/sh

if ! [ -x "$(command -v jq)" ]; then
  echo "Error: jq is not installed." >&2
  exit 1
fi

for file in ./theme/modules/*.module/meta.json; do
  jq 'del(.module_id)' $file > $file.tmp
  mv $file.tmp $file
  # git add $file
done
