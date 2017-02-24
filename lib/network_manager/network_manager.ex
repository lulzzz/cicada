defmodule Cicada.NetworkManager do
  require Logger

  defmodule State do
    defstruct interfaces: [], interface: nil
  end

  defmodule Interface do
    defstruct ifname: nil, status: %{}, settings: %{}
  end

  def register do
    GenServer.call(Cicada.NetworkManager.Client, :register)
  end

end