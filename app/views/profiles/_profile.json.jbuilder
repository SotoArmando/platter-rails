json.extract! profile, :id, :name, :session_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
