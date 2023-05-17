json.extract! blog, :id, :session_id, :title, :introduction, :unbounded, :file_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)
