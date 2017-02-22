defmodule Cicada.VoiceControl.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Cicada.VoiceControl.Client, [])
    ]
    supervise(children, strategy: :one_for_one)
  end
end
