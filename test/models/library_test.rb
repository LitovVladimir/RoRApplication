require 'test_helper'

class LibraryTest < ActiveSupport::TestCase

  test "create library" do
    Library.create(number: 10, name: "Тестовая библиотека", address: "Зеленоград ул Юности дом 1")
    assert true if Library.where(:name => 'Тестовая библиотека').exists?
  end

   test "create library without number" do
     Library.create(number: nil, name: "Тестовая библиотека", address: "Зеленоград ул Юности дом 1")
     assert false if Library.where(:name => 'Тестовая библиотека').exists?
   end

  test "create library without name" do
    Library.create(number: 42, name: "", address: "Зеленоград ул Юности дом 1")
    assert false if Library.where(:number => 42).exists?
  end


  test "create library without address" do
    Library.create(number: 42, name: "Тестовая библиотека", address: "")
    assert false if Library.where(:name => 'Тестовая библиотека').exists?
  end
end
