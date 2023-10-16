defmodule Esa.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EsaWeb.Telemetry,
      Esa.Repo,
      {DNSCluster, query: Application.get_env(:esa, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Esa.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Esa.Finch},
      # Start a worker by calling: Esa.Worker.start_link(arg)
      # {Esa.Worker, arg},
      # Start to serve requests, typically the last entry
      EsaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Esa.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EsaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
