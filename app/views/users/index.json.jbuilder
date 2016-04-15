json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :password_digest, :email, :admin, :chef, :phone, :image, :bio, :rate
  json.url user_url(user, format: :json)
end
