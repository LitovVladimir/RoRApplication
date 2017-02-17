json.extract! employee, :id, :library_id, :last_name, :first_name, :patronymic, :DOB, :employment_date, :post, :education, :created_at, :updated_at
json.url employee_url(employee, format: :json)