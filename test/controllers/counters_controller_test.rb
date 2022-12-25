require "test_helper"

class CountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counter = counters(:one)
  end

  test "should get index" do
    get counters_url
    assert_response :success
  end

  test "should get new" do
    get new_counter_url
    assert_response :success
  end

  test "should create counter" do
    assert_difference("Counter.count") do
      post counters_url, params: { counter: { end_date: @counter.end_date, text: @counter.text } }
    end

    assert_redirected_to counter_url(Counter.last)
  end

  test "should show counter" do
    get counter_url(@counter)
    assert_response :success
  end

  test "should get edit" do
    get edit_counter_url(@counter)
    assert_response :success
  end

  test "should update counter" do
    patch counter_url(@counter), params: { counter: { end_date: @counter.end_date, text: @counter.text } }
    assert_redirected_to counter_url(@counter)
  end

  test "should destroy counter" do
    assert_difference("Counter.count", -1) do
      delete counter_url(@counter)
    end

    assert_redirected_to counters_url
  end
end
