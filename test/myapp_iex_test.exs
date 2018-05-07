defmodule MyappIexTest do
  use ExUnit.Case
  doctest MyappIex

  test "greets the world" do
    assert MyappIex.hello() == :world
  end
end
