defmodule Mix.Tasks.ParseFile do
  use Mix.Task

  def run(filename) do
    {:ok, _} = Application.ensure_all_started(:toy_robot)
    ToyRobot.Caller.execute(filename)
  end
end
