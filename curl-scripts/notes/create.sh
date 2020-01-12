#!/bin/bash

curl "http://localhost:4741/notes" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "note": {
      "note": "'"${NOTE}"'",
      "page_number": "'"${PAGE}"'",
      "paragraph_number": "'"${PARAGRAPH}"'",
      "user_id": "'"${ID}"'",
      "book_id": "'"${BOOK_ID}"'"

    }
  }'

echo
