json.extract! recipe, :id, :session_id, :title, :introduction, :unbounded, :file_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
