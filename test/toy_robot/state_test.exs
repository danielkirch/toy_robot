defmodule ToyRobot.StateTest do
  use ExUnit.Case

  describe "rotation tests" do
    test "turn left" do
      state = %ToyRobot.State{x: 1, y: 1, direction: :north}
      new_state = ToyRobot.State.turn_left(state)

      assert new_state == %ToyRobot.State{x: 1, y: 1, direction: :west}
    end
  end
end
