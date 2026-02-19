#!/bin/bash -ex

ajv \
  compile \
  -s lofar-common-metadata.json \
  -r lofar-common-filetypes.json \
  -r lofar-antenna-sets.json \
  -r lofar-filter-selection.json \
  --spec=draft2020 \
  --validate-formats=false \
  > /dev/null
