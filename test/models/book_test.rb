require 'test_helper'

class BookTest < ActiveSupport::TestCase

  setup do
    Library.create(id: 1, number: 1, name: 'qwert',  address: "Зеленоград ул Юности дом 15")
  end

  test "create book" do
    Book.create(library_id: 1, name: 'Книга', author:'Иванов', cipher: 'Шифр',
                publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date: '1980-02-18')
    assert true if Book.where(:author => 'Иванов').exists?
  end

  test "create book with repeat cipher" do

    Book.create(library_id: 1, name: 'Книга', author:'Иванов', cipher: 'Шифр',
                publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date: '1980-02-18')
    begin
      Book.create(library_id: 1, name: 'Книга', author:'Петров', cipher: 'Шифр',
                  publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date: '1980-02-18')
      assert false
    rescue
      assert true
    end
  end

  test "create book without library_id" do
    Book.create( library_id: nil, name: 'Книга', author:'Иванов', cipher: 'Шифр',
                publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date: '1980-02-18')
    assert false if Book.where(:name => 'Книга').exists?
  end

  test "create book library_id not exist" do
    Book.create(library_id: 2, name: 'Книга', author:'Иванов', cipher: 'Шифр',
                publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date: '1980-02-18')
    assert false if Book.where(:name => 'Книга').exists?
  end

  test "create book without name" do
    Book.create(library_id: 1, name: nil,  author:'Иванов', cipher: 'Шифр',
                publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date: '1980-02-18')
    assert false if Book.where(:author => 'Иванов').exists?
  end

  test "create book without cipher" do
    Book.create(library_id: 1, name: 'Книга', author:'Иванов',
                cipher: nil, publishing_house: 'Издательство++', publishing_year: 1975, price: 10.5, receipt_date:
                    '1980-02-18')
    assert false if Book.where(:author => 'Иванов').exists?
  end


end
