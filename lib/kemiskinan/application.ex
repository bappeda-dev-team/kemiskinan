defmodule Kemiskinan.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KemiskinanWeb.Telemetry,
      Kemiskinan.Repo,
      {DNSCluster, query: Application.get_env(:kemiskinan, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Kemiskinan.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Kemiskinan.Finch},
      # Start a worker by calling: Kemiskinan.Worker.start_link(arg)
      # {Kemiskinan.Worker, arg},
      # Start to serve requests, typically the last entry
      KemiskinanWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kemiskinan.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KemiskinanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
