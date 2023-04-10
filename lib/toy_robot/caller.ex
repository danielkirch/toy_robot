defmodule ToyRobot.Caller do
  def execute(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.filter(fn line -> line != "" end)
    # |> Enum.filter(&(&1 != ""))
    |> Enum.map(fn line ->
      request = parse_line(line)
      response = GenServer.call(ToyRobot.Server, request)
      format_response(response)
    end)
    |> Enum.filter(fn line -> line != nil end)
    |> Enum.map(fn line -> line <> "\n" end)
    |> Enum.join()
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

  defp format_response(nil), do: nil

  defp format_response(state) do
    ToyRobot.State.to_string(state)
  end
end
