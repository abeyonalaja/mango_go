defmodule MangoWeb.HomepageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()
  @moduledoc false

  test "pressence of featured products" do
    navigate_to("/")
    assert page_source() =~ "Seasonal Products"
  end
end
