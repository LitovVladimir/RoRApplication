require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  setup do
    Library.create(id: 1, number: 1, name: 'qwert',  address: "Зеленоград ул Юности дом 15")
  end

  test "create employee" do
    Employee.create(library_id: 1, last_name: 'Иванов', first_name: 'Иван', patronymic: 'Иванович',
                    DOB: '1990-02-18', employment_date: '2017-02-18',post: 'разработчик', education: 'высшее')
    assert true if Employee.where(:last_name => 'Иванов').exists?
  end

  test "create employee without library_id" do
    Employee.create(library_id: nil, last_name: 'Иванов', first_name: 'Иван', patronymic: 'Иванович',
                    DOB: '1990-02-18', employment_date: '2017-02-18',post: 'разработчик', education: 'высшее')
    assert false if Employee.where(:last_name => 'Иванов').exists?
  end

  test "create employee library_id not exist" do
    Employee.create(library_id: 2, last_name: 'Иванов', first_name: 'Иван', patronymic: 'Иванович',
                    DOB: '1990-02-18', employment_date: '2017-02-18',post: 'разработчик', education: 'высшее')
    assert false if Employee.where(:last_name => 'Иванов').exists?
  end

  test "create employee without last name" do
    Employee.create(library_id: 1, last_name: nil, first_name: 'Иван', patronymic: 'Иванович',
                    DOB: '1990-02-18', employment_date: '2017-02-18',post: 'разработчик', education: 'высшее')
    assert false if Employee.where(:last_name => 'Иванов').exists?
  end

  test "create employee without first name" do
    Employee.create(library_id: 1, last_name: 'Иванов', first_name: nil, patronymic: 'Иванович',
                    DOB: '1990-02-18', employment_date: '2017-02-18',post: 'разработчик', education: 'высшее')
    assert false if Employee.where(:last_name => 'Иванов').exists?
  end

  test "create employee without post" do
    Employee.create(library_id: 1, last_name: 'Иванов', first_name: 'Иван', patronymic: 'Иванович',
                    DOB: '1990-02-18', employment_date: '2017-02-18',post: nil, education: 'высшее')
    assert false if Employee.where(:last_name => 'Иванов').exists?
  end

end
