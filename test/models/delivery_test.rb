require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  setup do
    @delivery = deliveries(:one)

    Library.create(id: 1,
                   number: 1,
                   name: 'Библиотека',
                   address: "Зеленоград ул Юности дом 15")

    Book.create(id: @delivery.book_id,
                library_id: 1,
                name: 'Книга',
                author:'Иванов',
                cipher: 'Шифр',
                publishing_house: 'Издательство++',
                publishing_year: 1975,
                price: 10.5,
                receipt_date: '1980-02-18')

    Subscriber.create(id: @delivery.subscriber_id,
                      library_id: 1,
                      ticket_number: 7856974,
                      last_name: 'Васильев',
                      first_name: 'Василий',
                      patronymic: 'Васильевич',
                      address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
  end

  test "create delivery" do
    Delivery.create(book_id: 1, subscriber_id: 1, delivery_date: '2017-02-10',return_date:'2017-02-18')
    assert true if Delivery.where(:delivery_date => '2017-02-10').exists?
  end

  test "create delivery without book_id" do
    Delivery.create(book_id: nil, subscriber_id: 1, delivery_date: '2017-02-10',return_date:'2017-02-18')
    assert true if Delivery.where(:delivery_date => '2017-02-10').exists?
  end

  test "create delivery without subscriber_id" do
    Delivery.create(book_id: 1, subscriber_id: nil, delivery_date: '2017-02-10',return_date:'2017-02-18')
    assert false if Delivery.where(:delivery_date => '2017-02-10').exists?
  end

  test "create delivery book_id not exist" do
    Delivery.create(book_id: 2, subscriber_id: 1, delivery_date: '2017-02-10',return_date:'2017-02-18')
    assert false if Delivery.where(:delivery_date => '2017-02-10').exists?
  end

  test "create delivery subscriber_id not exist" do
    Delivery.create(book_id: 1, subscriber_id: 2, delivery_date: '2017-02-10',return_date:'2017-02-18')
    assert false if Delivery.where(:delivery_date => '2017-02-10').exists?
  end

  test "create delivery without delivery_date" do
    Delivery.create(book_id: 1, subscriber_id: 1, delivery_date: nil,return_date:'2017-02-18')
    assert false if Delivery.where(:return_date => '2017-02-18').exists?
  end

  test "create delivery without return_date" do
    Delivery.create(book_id: 1, subscriber_id: 1, delivery_date: '2017-02-10',return_date: nil)
    assert true if Delivery.where(:delivery_date => '2017-02-10').exists?
  end

end
