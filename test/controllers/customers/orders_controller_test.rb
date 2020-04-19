require 'test_helper'

class Customers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get customers_orders_input_url
    assert_response :success
  end

  test "should get confirm" do
    get customers_orders_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get customers_orders_complete_url
    assert_response :success
  end

  test "should get index" do
    get customers_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_orders_show_url
    assert_response :success
  end

end
