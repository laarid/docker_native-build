#!/bin/sh

# set -x
SUITE=$1

for f in $(find . -type f -name Dockerfile); do
  [ -n "$(head -n 1 $f | grep '^#.*GENERATED FROM')" ] || continue;

  arch=$(echo "$f" | cut -d/ -f2 | cut -d- -f1)
  cat Dockerfile.template | \
    sed -e "s,@IMAGE_SUITE@,${SUITE},g" \
      -e "s,@IMAGE_ARCH@,${arch},g" > "$f"
done
