require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
    Library.create(id: @employee.library_id,
                   number: 1,
                   name: 'Библиотека',
                   address: "Зеленоград ул Юности дом 15")
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
       post employees_url, params: { employee: { DOB: @employee.DOB,
                                                 education: @employee.education,
                                                 employment_date: @employee.employment_date,
                                                 first_name: @employee.first_name,
                                                 last_name: @employee.last_name,
                                                 library_id: @employee.library_id,
                                                 patronymic: @employee.patronymic,
                                                 post: @employee.post } }
    end
    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { DOB: @employee.DOB,
                                                         education: @employee.education,
                                                         employment_date: @employee.employment_date,
                                                         first_name: @employee.first_name,
                                                         last_name: @employee.last_name,
                                                         library_id: @employee.library_id,
                                                         patronymic: @employee.patronymic,
                                                         post: @employee.post } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
