json.array! nerds do |nerd|
  json.id nerd['id']
  json.gravatar nerd['gravatar_url']
  json.name nerd['full_name']
  json.nickName nerd['nick_name']
  json.startDate nerd['hire_date']
end
