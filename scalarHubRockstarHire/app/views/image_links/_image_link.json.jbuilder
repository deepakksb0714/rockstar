json.extract! image_link, :id, :url, :created_at, :updated_at
json.url image_link_url(image_link, format: :json)