#!/bin/sh

for f in $(find -name Kraftfile); do
    grep 'labels' "$f" > /dev/null || ./add-labels.sed -i "$f"
done
