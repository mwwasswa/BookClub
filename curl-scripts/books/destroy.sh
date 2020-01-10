curl "http://localhost:4741/books/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \

echo
# use this curl to test the delete feature after authenticating a user
