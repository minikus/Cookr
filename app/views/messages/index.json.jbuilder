json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :target, :message, :seen, :archive
  json.url message_url(message, format: :json)
end
