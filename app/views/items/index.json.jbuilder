json.array!(@items) do |item|
  json.extract! item, :id, :service_id, :event_id, :status, :text, :image_link
  json.url item_url(item, format: :json)
end
