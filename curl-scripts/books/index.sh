#!/bin/bash

curl "http://localhost:4741/books" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo

# use this curl script to "show one" book that a user owns after being authenticated
