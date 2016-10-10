defmodule GenServerGrok do
  require Logger
  use GenServer

  # CLIENT
  # ======
  def start_link do
    GenServer.start_link(__MODULE__, :ok)
  end

  def ping(server) do
    GenServer.call(server, {:ping})
  end

  def get_count(server) do
    GenServer.call(server, {:count})
  end

  # SERVER
  # ======
  def init(:ok) do
    init_state = %{count: 0}
    {:ok, init_state}
  end

  def handle_call({:ping}, _from, state) do
    response = {:pong}
    new_state = %{state | count: state[:count] + 1 }
    {:reply, {:ok, response}, new_state}
  end

  def handle_call({:count}, _from, state) do
    {:reply, {:count, state[:count]}, state}
  end
end
