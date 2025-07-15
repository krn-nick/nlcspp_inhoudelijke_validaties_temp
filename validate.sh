#!/bin/bash

find validation_data/ -type f -name "*.xml" | while read -r file; do
    relative_path="${file#validation_data/}"
    IFS='/' read -r SCHEMA_NAME PHASE _ <<< "$relative_path"

    SCHEMA_FILE="validation_schemas/${SCHEMA_NAME}.sch"
    OUTPUT_FILE="validation_output/${relative_path}"

    echo "Validating $file with schema: $SCHEMA_FILE and phase: $PHASE"
    java -jar schxslt-cli.jar -d "$file" -s "$SCHEMA_FILE" -p "$PHASE" -o "$OUTPUT_FILE" -v
    echo ""
done