#!/bin/bash

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[33m"
ENDCOLOUR="\033[0;0m"

find validation_data/ -type f -name "*.xml" | while read -r file; do
    relative_path="${file#validation_data/}"
    IFS='/' read -r SCHEMA_NAME PHASE _ <<< "$relative_path"

    SCHEMA_FILE="validation_schemas/${SCHEMA_NAME}.sch"
    OUTPUT_FILE="validation_output/${relative_path%.xml}.svrl.xml"

    echo -e "${YELLOW}Validating $file with schema: $SCHEMA_FILE and phase: $PHASE${ENDCOLOUR}"
    java -jar schxslt-cli.jar -d "$file" -s "$SCHEMA_FILE" -p "$PHASE" -o "$OUTPUT_FILE" -v \
    | sed -E "s/\[valid\]/$(printf "${GREEN}[valid]${ENDCOLOUR}")/g; s/\[invalid\]/$(printf "${RED}[invalid]${ENDCOLOUR}")/g"
    echo -e ""
done