#!/bin/bash

lines=$(tput lines)
cols=$(tput cols)

# may be someone got it running with UTF8 chars
# ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜﾝ

awkscript='
  {
    letters="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lines=$1
    random_col=$3
    c=$4
    letter=substr(letters,c,1)
    cols[random_col]=0;
    for (col in cols) {
      line=cols[col];
      cols[col]=cols[col]+1;
      printf "\033[%s;%sH\033[2;32m%s", line, col, letter;
      printf "\033[%s;%sH\033[1;37m%s\033[0;0H", cols[col], col, letter;
      if (cols[col] >= lines) {
        cols[col]=0;
      }
    }
  }
'

echo -e "\e[1;40m"
clear

while :; do
  echo $lines $cols $(( $RANDOM % $cols)) $(( $RANDOM % 72 ))
  sleep 0.03
done | awk "$awkscript"
