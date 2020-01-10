#!/bin/bash

curl "http://localhost:4741/books" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "genre": "'"${GENRE}"'",
      "title": "'"${TITLE}"'",
      "author": "'"${AUTHOR}"'",
      "user_id": "'"${ID}"'"
    }
  }'

echo

# use this curl script to test that the create feature is working after a user is authenticated
