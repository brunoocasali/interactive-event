json.array!(@events) do |event|
  json.extract! event, :id, :hash_tag, :title, :image, :start_at, :end_at,
                :kind, :user_id
  json.url event_url(event, format: :json)
end
