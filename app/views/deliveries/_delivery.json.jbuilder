json.extract! delivery, :id, :book_id, :subscriber_id, :delivery_date, :return_date, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)