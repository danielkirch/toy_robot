defmodule ToyRobot.State do
  defstruct x: nil, y: nil, direction: nil

  def turn_left(%ToyRobot.State{x: x, y: y, direction: dir}) do
    new_dir =
      case dir do
        :north -> :west
        :west -> :south
        :south -> :east
        :east -> :north
      end

    %ToyRobot.State{x: x, y: y, direction: new_dir}
  end

  def turn_right(%ToyRobot.State{x: x, y: y, direction: dir}) do
    new_dir =
      case dir do
        :north -> :east
        :east -> :south
        :south -> :west
        :west -> :north
      end

    %ToyRobot.State{x: x, y: y, direction: new_dir}
  end

  def move(%ToyRobot.State{x: x, y: y, direction: dir}) do
    {new_x, new_y} =
      case dir do
        :north -> {min(x + 1, 4), y}
        :south -> {max(x - 1, 0), y}
        :east -> {x, min(y + 1, 4)}
        :west -> {x, max(y - 1, 0)}
      end

    %ToyRobot.State{x: new_x, y: new_y, direction: dir}
  end

  def to_string(%ToyRobot.State{x: x, y: y, direction: dir}) do
    dir_str =
      case dir do
        :north -> "NORTH"
        :south -> "SOUTH"
        :east -> "EAST"
        :west -> "WEST"
      end

    "#{x} #{y} #{dir_str}"
  end
end
