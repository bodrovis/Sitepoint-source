json.array! @users do |user|
  json.id user.id
  json.full_name user.pg_search_highlight.html_safe
  json.name user.name
  json.surname user.surname
end