json.extract! book, :id, :library_id, :name, :author, :cipher, :publishing_house, :publishing_year, :price, :receipt_date, :created_at, :updated_at
json.url book_url(book, format: :json)