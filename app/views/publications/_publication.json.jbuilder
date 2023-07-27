json.extract! publication, :id, :user_id, :title, :description, :created_at, :updated_at
json.url publication_url(publication, format: :json)
