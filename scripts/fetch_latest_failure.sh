#!/usr/bin/env bash

set -euo pipefail

OUTPUT_DIR="${1:-logs}"

mkdir -p "$OUTPUT_DIR"

RUN_ID="$(
  gh run list \
    --status failure \
    --limit 1 \
    --json databaseId \
    --jq '.[0].databaseId'
)"

if [[ -z "${RUN_ID:-}" ]] || [[ "$RUN_ID" == "null" ]]; then
  echo "Aucun workflow en échec trouvé."
  exit 1
fi

echo "Dernier run en échec : $RUN_ID"

gh run view "$RUN_ID" \
  --json databaseId,displayTitle,workflowName,headBranch,headSha,conclusion,createdAt,url \
  > "$OUTPUT_DIR/run-$RUN_ID.json"

gh run view "$RUN_ID" \
  --log-failed \
  > "$OUTPUT_DIR/run-$RUN_ID.log"

echo "Métadonnées : $OUTPUT_DIR/run-$RUN_ID.json"
echo "Logs         : $OUTPUT_DIR/run-$RUN_ID.log"
