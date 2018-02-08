defmodule MangoWeb.Acceptance.CategoryPageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  setup do
    ## GIVEN ##
    # There are two products Apple and Tomato priced 100 and 50
    # categorized under `fruits` and `Vegetables` respectivly
    :ok
  end

  test "show fruits" do
    ## When ##
    # I navigate to the fruits page
    navigate_to("/categories/fruits")

    ## THEN ##
    # Iexpect the page title to be "Fruits"
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Fruits"

    # And I expect Apple in the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    assert product_price == "100"

    # And I expect that Tomato is not present on screen.
    refute page_source() =~ "Tomato"
  end

  test "show vegetables" do
    ## WHEN ##
    # I navigate to vegetables page_title
    navigate_to("/categories/vegetables")

    ## THEN ##
    # I expect the page title to be "Seasonal Products"
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Vegetables"

    # And I expect Apple in the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Tomato"
    assert product_price == "50"

    # And I expect that Tomato is not present on screen.
    refute page_source() =~ "Apple"

  end

    
end
