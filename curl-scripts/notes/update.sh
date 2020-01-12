#!/bin/bash

curl "http://localhost:4741/notes/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "note": {
      "note": "'"${NOTE}"'",
      "page_number": "'"${PAGE}"'",
      "paragraph_number": "'"${PARAGRAPH}"'",
      "book_id": "'"${BOOK_ID}"'"

    }
  }'

echo
