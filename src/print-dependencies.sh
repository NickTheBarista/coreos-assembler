#!/bin/bash
# Output a newline and space separated list of RPMs on which we depend.
# Used by both the container image build process and at runtime.
set -euo pipefail
srcdir="$(cd "$(dirname "$0")" && pwd)"
arch="$(arch)"
for x in deps vmdeps; do 
    grep -v '^#' "${srcdir}/${x}.txt"
    grep -v '^#' "${srcdir}/${x}-${arch}.txt"
done
