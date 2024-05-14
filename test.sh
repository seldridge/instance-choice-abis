#!/usr/bin/env bash

set -euo pipefail

tests=$(find . -type f -mindepth 2 -name "test.sh")

for t in $tests; do
  pushd $(dirname $t) 2>&1 > /dev/null
  ./test.sh
  popd
done

echo "All tests passed"
