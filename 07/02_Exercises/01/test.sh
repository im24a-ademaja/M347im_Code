#!/bin/bash
set -euo pipefail

BASE_URL="${BASE_URL:-http://127.0.0.1:5000}"

printf 'Create task\n'
curl -s -X POST "$BASE_URL/task" \
  -H "Content-Type: application/json" \
  -d '{"title": "Kauf Milch", "description": "Hochpast 2L in der Migros"}'

echo
printf '\nList tasks\n'
curl -s "$BASE_URL/tasks"

echo
printf '\nTry GET and DELETE operations with a sample id\n'
curl -s "$BASE_URL/task/000000000000000000000000"
curl -s -X DELETE "$BASE_URL/task/000000000000000000000000"

