defmodule ToyRobot.Caller do
  def execute(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(fn line ->
      request = parse_line(line)
      response = GenServer.call(ToyRobot.Server, request)
      print_response(response)
    end)
  end

  defp parse_line("PLACE " <> state_str) do
    [x_str, y_str, dir_str] = String.split(state_str, ",")

    dir =
      case dir_str do
        "NORTH" -> :north
        "SOUTH" -> :south
        "EAST" -> :east
        "WEST" -> :west
      end

    {:place,
     %{
       x: String.to_integer(x_str),
       y: String.to_integer(y_str),
       direction: dir
     }}
  end

  defp parse_line("REPORT"), do: :report
  defp parse_line("LEFT"), do: :left
  defp parse_line("RIGHT"), do: :right
  defp parse_line("MOVE"), do: :move

  defp print_response(nil), do: nil

  defp print_response(state) do
    ToyRobot.State.to_string(state)
    |> IO.puts()
  end
end
