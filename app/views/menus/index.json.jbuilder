json.array!(@menus) do |menu|
  json.extract! menu, :id, :user_id, :cuisine, :description, :pricePP, :dietry, :gluten_free, :vego, :title, :image
  json.url menu_url(menu, format: :json)
end
