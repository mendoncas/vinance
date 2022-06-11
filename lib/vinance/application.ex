defmodule Vinance.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Vinance.Repo,
      # Start the Telemetry supervisor
      VinanceWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Vinance.PubSub},
      # Start the Endpoint (http/https)
      VinanceWeb.Endpoint
      # Start a worker by calling: Vinance.Worker.start_link(arg)
      # {Vinance.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vinance.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VinanceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
