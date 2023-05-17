json.extract! todo, :id, :session_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
