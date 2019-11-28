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
  clear && printf '\e[3J'
  echo "$TREE1"
  sleep $INTERVAL

  clear && printf '\e[3J'
  echo "$TREE2"
  sleep $INTERVAL
done
