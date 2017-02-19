defmodule Fw.Application do
  alias DeviceManager.{Discovery}

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    register_devices()
    children = []
    opts = [strategy: :one_for_one, name: Fw.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def register_devices do
    DeviceManager.Client.register_device(Discovery.Light.Lifx)
    DeviceManager.Client.register_device(Discovery.HVAC.RadioThermostat)
    DeviceManager.Client.register_device(Discovery.MediaPlayer.Chromecast)
    DeviceManager.Client.register_device(Discovery.WeatherStation.MeteoStick)
    DeviceManager.Client.register_device(Discovery.SmartMeter.RavenSMCD)
    DeviceManager.Client.register_device(Discovery.IEQ.Sensor)
  end
end
