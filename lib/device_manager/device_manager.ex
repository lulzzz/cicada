defmodule Cicada.DeviceManager do

  defmodule Device do
    @derive [Poison.Encoder]
    defstruct module: nil,
      type: nil,
      device_pid: nil,
      interface_pid: nil,
      histogram: nil,
      name: "",
      state: %{}
  end

  def register do
    GenServer.call(Cicada.DeviceManager.Client, :register)
  end

  def devices do
    Cicada.DeviceManager.Client.devices
  end

end
