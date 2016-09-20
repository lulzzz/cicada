defmodule Interface.Mixfile do
  use Mix.Project

  def project do
    [app: :interface,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :cowboy],
      mod: {Interface, []}
    ]
  end

  defp deps do
    [{:cowboy, "~> 1.0"}]
  end
end
