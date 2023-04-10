defmodule ToyRobot.CallerTest do
  use ExUnit.Case

  test "check example.txt output" do
    result = ToyRobot.Caller.execute("test/fixtures/example.txt")

    assert result == """
           3 1 NORTH
           3 1 WEST
           3 0 WEST
           3 0 NORTH
           """
  end

  # concatenated_fn = fn param ->
  #   param
  #   |> function1
  #   |> function2
  # end

  # concatenated_fn = & &1 |> function1 |> function2
end
