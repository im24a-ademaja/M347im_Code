#!/bin/bash

BASE_URL="${BASE_URL:-http://127.0.0.1:5000}"

usage() {
  echo "Usage: $0 <add|list|get|delete> [title] [description]"
  echo "Examples:"
  echo "  $0 add \"Milch kaufen\" \"Hochpast 2L\""
  echo "  $0 list"
  echo "  $0 get <task-id>"
  echo "  $0 delete <task-id>"
}

if [ "$#" -lt 1 ]; then
  usage
  exit 1
fi

case "$1" in
  add)
    if [ "$#" -lt 2 ]; then
      echo "Missing title."
      usage
      exit 1
    fi
    TITLE="$2"
    DESCRIPTION="${3:-}"
    curl -s -X POST "$BASE_URL/task" \
      -H "Content-Type: application/json" \
      -d "{\"title\":\"$TITLE\",\"description\":\"$DESCRIPTION\"}"
    ;;
  list)
    curl -s "$BASE_URL/tasks"
    ;;
  get)
    if [ "$#" -lt 2 ]; then
      echo "Missing task id."
      usage
      exit 1
    fi
    curl -s "$BASE_URL/task/$2"
    ;;
  delete)
    if [ "$#" -lt 2 ]; then
      echo "Missing task id."
      usage
      exit 1
    fi
    curl -s -X DELETE "$BASE_URL/task/$2"
    ;;
  *)
    usage
    exit 1
    ;;
esac
