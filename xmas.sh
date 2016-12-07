#!/bin/sh

RESTORE=$'\e[0m'
GREEN=$'\e[00;32m'
YELLOW=$'\e[00;33m'
RED=$'\e[00;31m'

TREE_START=10
FOOTER_START=46

TREE1=$(sed \
  -e "1s/^/$RESTORE/" \
  -e "${TREE_START}s/^/$YELLOW/" \
  -e "${TREE_START},$((TREE_START+3))s/*/${RESTORE}*${YELLOW}/g" \
  -e "${TREE_START},$((TREE_START+21))s/*/${RESTORE}*${GREEN}/g" \
  -e "${TREE_START},$((TREE_START+21))s/o/${YELLOW}o${GREEN}/g" \
  -e "s/()/${RED}()${GREEN}/g" \
  -e "$((TREE_START+21))s/^/$RESTORE/" \
  -e "${FOOTER_START}s/^/$GREEN/" \
  -e "${FOOTER_START}s/(o)/${YELLOW}(o)${GREEN}/g" \
  -e "$((FOOTER_START+1))s/^/$RESTORE/" \
  -e "$((FOOTER_START+5))s/^/$GREEN/" \
  -e "$((FOOTER_START+5))s/(o)/${YELLOW}(o)${GREEN}/g" \
  -e "$((FOOTER_START+5))s/(_)/${RED}(_)${GREEN}/g" \
  ascii.1)

TREE2=$(sed \
  -e "1s/^/$RESTORE/" \
  -e "${TREE_START}s/^/$YELLOW/" \
  -e "${TREE_START},$((TREE_START+3))s/*/${RESTORE}*${YELLOW}/g" \
  -e "${TREE_START},$((TREE_START+21))s/*/${RESTORE}*${GREEN}/g" \
  -e "${TREE_START},$((TREE_START+21))s/o/${YELLOW}o${GREEN}/g" \
  -e "s/()/${RED}()${GREEN}/g" \
  -e "$((TREE_START+21))s/^/$RESTORE/" \
  -e "${FOOTER_START}s/^/$GREEN/" \
  -e "${FOOTER_START}s/(o)/${YELLOW}(o)${GREEN}/g" \
  -e "$((FOOTER_START+1))s/^/$RESTORE/" \
  -e "$((FOOTER_START+5))s/^/$GREEN/" \
  -e "$((FOOTER_START+5))s/(o)/${YELLOW}(o)${GREEN}/g" \
  -e "$((FOOTER_START+5))s/(_)/${RED}(_)${GREEN}/g" \
  ascii.2)

INTERVAL=1

while :
do
  clear
  echo "$TREE1"
  sleep $INTERVAL

  clear
  echo "$TREE2"
  sleep $INTERVAL
done


###############################################

# https://gist.github.com/sontek/1505483

# TREE1="$(<ascii.1)"

# COLUMNS=40
# LINES=10

# SNOW_END=30

# for ((i=$TREE_START; i<=$SNOW_END; i++))
# do
#   # echo $i
#   # echo $(($RANDOM%3))
#   echo "$TREE1" | sed -n $i
# done

# LINES=$(echo "$TREE1" | sed -n "$TREE_START,${SNOW_END}p")
# # echo "$LINES"
# for line in "$LINES"
# do
#   # POS=$(($RANDOM%80))
#   # echo $POS

#   # for ((n=0; n<$(($RANDOM%3)); n++))
#   # do
#     POS=$(($RANDOM%80))
#     # echo "$POS"

#   #   line=$(echo "$line" | sed s/./*/$POS)
#   #   # printf "%s %s \n" "$line" "${line:${#PROC_NAME}}"
#   # done

#   echo "$line"
# done

# clear
# while :
# do
#   clear
#   # echo "$TREE1"
#   echo $LINES $COLUMNS $(($RANDOM%$COLUMNS))
#   sleep 0.1
# done|awk '{
#   a[$3]=0;
#   for(x in a) {
#     o=a[x];
#     a[x]=a[x]+1;
#     printf "\033[%s;%sH ",o,x;
#     printf "\033[%s;%sH*\033[0;0H",a[x],x;
#   }
# }'
