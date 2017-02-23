require 'test_helper'

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
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

  test "should get index" do
    get deliveries_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_url
    assert_response :success
  end

  test "should create delivery" do
    assert_difference('Delivery.count') do
      post deliveries_url, params: { delivery: { book_id: @delivery.book_id, delivery_date: @delivery.delivery_date,
                                                 return_date: @delivery.return_date, subscriber_id: @delivery.subscriber_id } }
    end

    assert_redirected_to delivery_url(Delivery.last)
  end

  test "should show delivery" do
    get delivery_url(@delivery)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_url(@delivery)
    assert_response :success
  end

  test "should update delivery" do
    patch delivery_url(@delivery), params: { delivery: { book_id: @delivery.book_id, delivery_date: @delivery.delivery_date, return_date: @delivery.return_date, subscriber_id: @delivery.subscriber_id } }
    assert_redirected_to delivery_url(@delivery)
  end

  test "should destroy delivery" do
    assert_difference('Delivery.count', -1) do
      delete delivery_url(@delivery)
    end

    assert_redirected_to deliveries_url
  end
end
