#!/bin/sh

# set -x

for f in $(find . -type f -name Dockerfile); do
  [ -n "$(head -n 1 $f | grep '^#.*GENERATED FROM')" ] || continue;

  suite=$(echo "$f" | cut -d/ -f2)
  arch=$(echo "$f" | cut -d/ -f3 | cut -d- -f1)
  cat Dockerfile.template | \
    sed -e "s,@IMAGE_SUITE@,${suite},g" \
      -e "s,@IMAGE_ARCH@,${arch},g" > "$f"
done
