#!/bin/bash

IMPORT_NAME="$@"
IFS=$'\n'
FIND_CMD=`all "$IMPORT_NAME" | grep  "class\ $IMPORT_NAME\ \|class\ $IMPORT_NAME<\|interface\ $IMPORT_NAME\ \|interface\ $IMPORT_NAME<"`
for line in $FIND_CMD; do
  java_file=$(echo $line | cut -d: -f1 | sed 's/^java\///' | sed 's/^javatests\///' | sed 's/\.java$//' | sed 's/\//\./g')
  echo "$java_file" | grep "${IMPORT_NAME}$"
  if [[ $? -ne 0 ]]; then
    java_file="$java_file.$IMPORT_NAME"
  fi
  echo "import $java_file;"
done
