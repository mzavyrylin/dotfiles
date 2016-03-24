#!/bin/bash

dir="$(cd "`dirname "$0"`"/..; pwd)"
plugins=''

if [[ $# == 0 ]]; then
  plugins="$(grep git ${dir}/plugins.list)"
else
  plugins="$@"
fi

for p in $plugins
do
  git clone $p ${dir}/${p}
done
