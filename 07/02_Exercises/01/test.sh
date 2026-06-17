#!/bin/bash
#
printf "Post task Kauf Milch Hochpast 2L in der Migros\n\n"
curl -X POST http://127.0.0.1:5000/task \
     -H "Content-Type: application/json" \
     -d '{"title": "Kauf Milch", "description": "Hochpast 2L in der Migros"}'
sleep 2
printf "Show all tasks\n"
curl http://127.0.0.1:5000/tasks
sleep 2
id=68489c95594b9eb334024d89
printf "Get task with id=%s" ${id}
curl http://127.0.0.1:5000/task/${id}
sleep 2
printf "Now deleting task with id=%s" ${id}
curl -X DELETE http://127.0.0.1:5000/task/${id}
