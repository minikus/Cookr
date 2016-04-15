json.array!(@events) do |event|
  json.extract! event, :id, :time, :suburb, :address, :user_id, :chef_id, :menu_id, :description, :guests, :confirm, :price
  json.url event_url(event, format: :json)
end
