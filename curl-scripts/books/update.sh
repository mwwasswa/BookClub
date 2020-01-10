#!/bin/bash

curl "http://localhost:4741/books/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "book": {
      "genre": "'"${GENRE}"'",
      "title": "'"${TITLE}"'",
      "author": "'"${AUTHOR}"'"
    }
  }'

echo

# use this curl script to test that the update feature is working after a user is authenticated
