defmodule DeviceManager.Device.MediaPlayer do

  defmodule State.Image do
    defstruct url: "",
      width: 0,
      height: 0
  end

  defmodule State do
    defstruct ip: "0.0.0.0",
      current_time: 0,
      content_id: "",
      content_type: "",
      duration: 0,
      autoplay: false,
      image: %State.Image{},
      title: "",
      subtitle: "",
      volume: 0,
      status: "",
      idle: False,
      app_name: "",
      id: ""
  end
end

defmodule DeviceManager.Discovery.MediaPlayer do
  use DeviceManager.Discovery

  alias DeviceManager.Device.MediaPlayer

  def init_handlers do
    Logger.info "Starting Chromecast"
    Mdns.Client.add_handler(Discovery.MediaPlayer.Chromecast)
    Mdns.Client.start
    Process.send_after(self, :query_cast, 0)
  end

  def handle_info({:googlecast, device}, state) do
    {:noreply, handle_device(device, state, MediaPlayer.Chromecast)}
  end

  def handle_info(:query_cast, state) do
    Mdns.Client.query("_googlecast._tcp.local")
    Process.send_after(self, :query_cast, 5000)
    {:noreply, state}
  end

end
