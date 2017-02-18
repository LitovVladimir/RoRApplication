# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

num_array = (1..99).to_a

num_array.each do |i|
  Library.create(number: i, name: "Библиотека №#{i}", address: "Зеленоград ул Юности дом #{i}")

  Employee.create(library_id: i, last_name: 'Иванов', first_name: 'Иван', patronymic: 'Иванович',
                  DOB: '1990-02-18', employment_date: '2017-02-18',post: 'разработчик', education: 'высшее')

  Subscriber.create(library_id: i, ticket_number: 7856974+i, last_name: 'Васильев', first_name: 'Василий',
                    patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом #{i}",
                    phone: "8800555#{i}")
  Book.create(library_id: i, name: "Книга #{i}", author:'Иванов', cipher: "Шифр #{i}",
              publishing_house: 'Издательство++', publishing_year: 1975, price: i*100/3, receipt_date: '1980-02-18')

  Delivery.create(book_id: i, subscriber_id: i, delivery_date: '2017-02-10',return_date:'2017-02-18')
end