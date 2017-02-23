require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase

  setup do
    Library.create(id: 1, number: 1, name: 'qwert',  address: "Зеленоград ул Юности дом 15")
  end

  test "create subscriber" do
    Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    assert true if Subscriber.where(:last_name => 'Васильев').exists?
  end

  test "create subscriber with repeat ticket_number" do

    Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    begin
      Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                        patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                        phone: "8800555")
      assert false
    rescue
      assert true
    end
  end

  test "create subscriber without library_id" do
    Subscriber.create(library_id: nil, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    assert false if Subscriber.where(:last_name => 'Васильев').exists?
  end

  test "create subscriber library_id not exist" do
    Subscriber.create(library_id: 2, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    assert false if Subscriber.where(:last_name => 'Васильев').exists?
  end

  test "create subscriber without ticket_number" do
    Subscriber.create(library_id: 1, ticket_number: nil, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    assert false if Subscriber.where(:last_name => 'Васильев').exists?
  end

  test "create book without last_name" do
    Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: nil, first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    assert false if Subscriber.where(:ticket_number => 7856974).exists?
  end

  test "create book without first_name" do
    Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: 'Васильев', first_name: nil,
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: "8800555")
    assert false if Subscriber.where(:ticket_number => 7856974).exists?
  end

  test "create book without address" do
    Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: nil,
                      phone: "8800555")
    assert false if Subscriber.where(:ticket_number => 7856974).exists?
  end

  test "create book without phone" do
    Subscriber.create(library_id: 1, ticket_number: 7856974, last_name: 'Васильев', first_name: 'Василий',
                      patronymic: 'Васильевич', address: "Зеленоград Панфиловский проспект дом 15",
                      phone: nil)
    assert false if Subscriber.where(:ticket_number => 7856974).exists?
  end

end
