#!/bin/bash

# Mengganti setiap garis miring ("/") dengan tanda miring terbalik ("\") pada jalur kerja saat ini
escapedPath="$(pwd | sed 's/\//\\/g')"

echo "Escaped Path: $escapedPath"

if grep flutter pubspec.yaml > /dev/null; then
  echo "Flutter pubspec.yaml found."
  if [ -d "coverage" ]; then
    echo "Coverage directory exists."
    # Menggabungkan informasi cakupan baris dari tes paket ke file umum
    if [ ! -d "$MELOS_ROOT_PATH/coverage_report" ]; then
      mkdir "$MELOS_ROOT_PATH/coverage_report"
      echo "Created coverage_report directory."
    fi
    sed "s/^SF:lib/SF:$escapedPath\\lib/g" coverage/lcov.info >> "$MELOS_ROOT_PATH/coverage_report/lcov.info"
    rm -rf "coverage"
    echo "Combined line coverage info and removed coverage directory."
  else
    echo "Coverage directory does not exist."
  fi
else
  echo "Flutter pubspec.yaml not found."
fi
