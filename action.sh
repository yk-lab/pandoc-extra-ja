#!/bin/bash

set -euo pipefail

COMMAND="pandoc"
if [ -n "${PANDOC_OUTPUT_FILE}" ]; then
    # Use -o to specify the output file
    COMMAND="${COMMAND} -o ${PANDOC_OUTPUT_FILE}"
fi
if [ -n "${PANDOC_TEMPLATE}" ]; then
    # Use --template to specify the template
    COMMAND="${COMMAND} --template ${PANDOC_TEMPLATE}"
fi
if [ -n "${PANDOC_LISTINGS}" ] && [ "${PANDOC_LISTINGS}" = "true" ]; then
    # Use --listings to include listings
    COMMAND="${COMMAND} --listings"
fi
if [ -n "${PANDOC_PDF_ENGINE}" ]; then
    # Use --pdf-engine to specify the PDF engine
    COMMAND="${COMMAND} --pdf-engine ${PANDOC_PDF_ENGINE}"
fi
if [ -n "${PANDOC_CJK_MAINFONT}" ]; then
    # Use -V CJKmainfont to specify the CJK main font
    COMMAND="${COMMAND} -V CJKmainfont=\"${PANDOC_CJK_MAINFONT}\""
fi
if [ -n "${PANDOC_MAINFONT}" ]; then
    # Use -V mainfont to specify the main font
    COMMAND="${COMMAND} -V mainfont=\"${PANDOC_MAINFONT}\""
fi
if [ -n "${PANDOC_SANSFONT}" ]; then
    # Use -V sansfont to specify the sans font
    COMMAND="${COMMAND} -V sansfont=\"${PANDOC_SANSFONT}\""
fi
if [ -n "${PANDOC_MONOFONT}" ]; then
    # Use -V monofont to specify the mono font
    COMMAND="${COMMAND} -V monofont=\"${PANDOC_MONOFONT}\""
fi
if [ -n "${PANDOC_MATHFONT}" ]; then
    # Use -V mathfont to specify the math font
    COMMAND="${COMMAND} -V mathfont=\"${PANDOC_MATHFONT}\""
fi

flags=$*
echo "Running: $COMMAND $flags"
RESULTS=$(eval "$COMMAND" "$flags")

if [ -n "$PANDOC_OUTPUT" ]; then
    if [ -f "$PANDOC_OUTPUT" ]; then
        PANDOC_OUTPUT="$TMP_FOLDER/$PANDOC_OUTPUT"
    fi
    echo "$RESULTS" >"$PANDOC_OUTPUT"
fi

RESULTS="${RESULTS//$'\\n'/''}"

{
    echo "results<<EOF"
    echo "$RESULTS"
    echo "EOF"
} >>"$GITHUB_OUTPUT"

{
    echo "PANDOC_RESULTS<<EOF"
    echo "$RESULTS"
    echo "EOF"
} >>"$GITHUB_ENV"

[ -z "$PANDOC_OUTPUT" ] || echo "Pandoc output saved to: $PANDOC_OUTPUT"
