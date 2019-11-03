#!/bin/sh
SUBMITS="FPATH.CMD LABELS.CMD"
N=2

scmdgen --input=bostn2.txt --baseout=bostn2 --use_values \
        LOSSFUNC=LAD,LS,HUBER,RF,GAMMA,TWEEDIE
let i=0
for file in bostn2*.cmd; do
  if [ $i -ge $N ]; then
    let i=0
  fi
  let i=$i+1
  cp -p $file ../cmd$i/
done
for dir in ../cmd[1-$N]; do
  cp -p $SUBMITS $dir
done
