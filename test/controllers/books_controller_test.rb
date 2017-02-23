require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    Library.create(id: @book.library_id,
                   number: 1,
                   name: 'Библиотека',
                   address: "Зеленоград ул Юности дом 15")
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author,
                                        cipher: @book.cipher+rand(36**3).to_s(36),
                                        library_id: @book.library_id,
                                        name: @book.name,
                                        price: @book.price,
                                        publishing_house: @book.publishing_house,
                                        publishing_year: @book.publishing_year,
                                        receipt_date: @book.receipt_date } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author,
                                             cipher: @book.cipher,
                                             library_id: @book.library_id,
                                             name: @book.name,
                                             price: @book.price,
                                             publishing_house: @book.publishing_house,
                                             publishing_year: @book.publishing_year,
                                             receipt_date: @book.receipt_date } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
