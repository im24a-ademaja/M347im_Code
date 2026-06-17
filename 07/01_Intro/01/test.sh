#!/bin/bash
#
printf "Create two tasks ...\n\n"
curl -X POST http://127.0.0.1:5000/task \
     -H "Content-Type: application/json" \
     -d '{"title": "Milch kaufen", "description": "Hochpast 2L in der Migros"}'

curl -X POST http://127.0.0.1:5000/task \
     -H "Content-Type: application/json" \
     -d '{"title": "Glutenfreies Brot backen", "description": "Brot backen bis 18Uhr"}'

sleep 2
printf "Show all tasks\n"
curl http://127.0.0.1:5000/tasks
sleep 2
id=1
printf "Get task with id=%s" ${id}
curl http://127.0.0.1:5000/task/${id}
sleep 2
printf "Now deleting task with id=%s" ${id}
curl -X DELETE http://127.0.0.1:5000/task/${id}
