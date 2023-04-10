defmodule ToyRobot.Server do
  use GenServer

  @doc """
  This starts the GenServer
  """
  def start_link(_) do
    GenServer.start_link(ToyRobot.Server, [], name: ToyRobot.Server)
  end

  @impl true
  def init(_args) do
    {:ok, nil}
  end

  @impl true
  def handle_call({:place, state}, _caller, _old_state) do
    {:reply, nil, struct(ToyRobot.State, state)}
  end

  def handle_call(_, _caller, nil) do
    {:reply, nil, nil}
  end

  def handle_call(:report, _caller, state) do
    {:reply, state, state}
  end

  def handle_call(:left, _caller, state) do
    {:reply, nil, ToyRobot.State.turn_left(state)}
  end

  def handle_call(:right, _caller, state) do
    {:reply, nil, ToyRobot.State.turn_right(state)}
  end

  def handle_call(:move, _caller, state) do
    {:reply, nil, ToyRobot.State.move(state)}
  end
end
