curl "http://localhost:4741/books/${ID}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo

# use this curl script to "show all" the books that a user owns after being authenticated
