defmodule StringMatcherTest do

  use ExUnit.Case, Async: true

  def match_returns_correct_value() do
    assert Utilities.StringMatcher.match("sainsbury's sprmrkts lt london") == "Sainsburys"
    assert Utilities.StringMatcher.match("kajdajs 4394 -- Amazon Prime") == "Amazon Prime"
    assert Utilities.StringMatcher.match("Prime 130293 Amazon") == "Amazon"
  end

end
