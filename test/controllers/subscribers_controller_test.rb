require 'test_helper'

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
    Library.create(id: @subscriber.library_id,
                   number: 1,
                   name: 'Библиотека',
                   address: "Зеленоград ул Юности дом 15")
  end

  test "should get index" do
    get subscribers_url
    assert_response :success
  end

  test "should get new" do
    get new_subscriber_url
    assert_response :success
  end

  test "should create subscriber" do
    assert_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { address: @subscriber.address,
                                                    first_name: @subscriber.first_name,
                                                    last_name: @subscriber.last_name,
                                                    library_id: @subscriber.library_id,
                                                    patronymic: @subscriber.patronymic,
                                                    phone: @subscriber.phone,
                                                    ticket_number: @subscriber.ticket_number + rand(25) } }
    end

    assert_redirected_to subscriber_url(Subscriber.last)
  end

  test "should show subscriber" do
    get subscriber_url(@subscriber)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscriber_url(@subscriber)
    assert_response :success
  end

  test "should update subscriber" do
    patch subscriber_url(@subscriber), params: { subscriber: { address: @subscriber.address,
                                                               first_name: @subscriber.first_name,
                                                               last_name: @subscriber.last_name,
                                                               library_id: @subscriber.library_id,
                                                               patronymic: @subscriber.patronymic,
                                                               phone: @subscriber.phone,
                                                               ticket_number: @subscriber.ticket_number } }
    assert_redirected_to subscriber_url(@subscriber)
  end

  test "should destroy subscriber" do
    assert_difference('Subscriber.count', -1) do
      delete subscriber_url(@subscriber)
    end

    assert_redirected_to subscribers_url
  end
end
