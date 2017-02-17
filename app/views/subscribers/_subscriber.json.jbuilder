json.extract! subscriber, :id, :library_id, :ticket_number, :last_name, :first_name, :patronymic, :address, :phone, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)