#!/bin/bash -e

# Goto the directory of this script; ajv needs to be run from there to resolve $ref
# dependencies correctly.
cd "$(dirname "${BASH_SOURCE[0]}")"

FILES=$(find -- * -name "*.json")
ERRORS=0

for file in $FILES
do
  # Extract $ref dependencies, they need to be specified as requirements for ajv
  REQUIRES=$(sed -n 's,^[[:space:]]*"\$ref\":[[:space:]]*"\([^"]*\)".*$,\1,p' "$file")
  COMMAND="ajv compile -s $file"
  for req in $REQUIRES
  do
    COMMAND="$COMMAND -r $req"
  done
  COMMAND="$COMMAND --spec=draft2020 --validate-formats=false > /dev/null"
  printf "%-70s  " "${file}"
  err=$(eval "$COMMAND" 2>&1) \
    && { printf "%8s\n" "[ OK ]"; } \
    || { printf "%8s\n\t%s\n" "[FAIL]" "${err}"; ERRORS=$((ERRORS + 1)); }
done

if [ $ERRORS -gt 0 ]; then
  echo "Validation failed with $ERRORS error(s)."
  exit 1
else
  echo "All files validated successfully."
fi
