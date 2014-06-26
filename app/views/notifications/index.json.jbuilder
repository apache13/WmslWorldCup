json.array!(@notifications) do |notification|
  json.extract! notification, :id, :topic, :message, :player_id, :closed
  json.url notification_url(notification, format: :json)
end
