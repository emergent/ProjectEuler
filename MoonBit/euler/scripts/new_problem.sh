#!/bin/sh

set -eu

if [ "$#" -ne 1 ]; then
  echo "usage: $0 <problem-number>" >&2
  exit 1
fi

problem_no=$(printf "%04d" "$1")
dir="cmd/p${problem_no}"

if [ -e "$dir" ]; then
  echo "already exists: $dir" >&2
  exit 1
fi

mkdir -p "$dir"

cat > "$dir/moon.pkg" <<EOF
import {
  "username/euler" @euler,
}

options(
  "is-main": true,
)
EOF

cat > "$dir/main.mbt" <<EOF
///|
fn main {
  println(@euler.render_answer(${1}, @euler.problem_${problem_no}().to_string()))
}
EOF

echo "created $dir"
