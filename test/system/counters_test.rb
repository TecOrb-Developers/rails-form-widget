require "application_system_test_case"

class CountersTest < ApplicationSystemTestCase
  setup do
    @counter = counters(:one)
  end

  test "visiting the index" do
    visit counters_url
    assert_selector "h1", text: "Counters"
  end

  test "should create counter" do
    visit counters_url
    click_on "New counter"

    fill_in "End date", with: @counter.end_date
    fill_in "Text", with: @counter.text
    click_on "Create Counter"

    assert_text "Counter was successfully created"
    click_on "Back"
  end

  test "should update Counter" do
    visit counter_url(@counter)
    click_on "Edit this counter", match: :first

    fill_in "End date", with: @counter.end_date
    fill_in "Text", with: @counter.text
    click_on "Update Counter"

    assert_text "Counter was successfully updated"
    click_on "Back"
  end

  test "should destroy Counter" do
    visit counter_url(@counter)
    click_on "Destroy this counter", match: :first

    assert_text "Counter was successfully destroyed"
  end
end
