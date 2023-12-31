defmodule InfoSys.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      InfoSys.Cache,
      {Task.Supervisor, name: InfoSys.TaskSupervisor}
      # Starts a worker by calling: InfoSys.Worker.start_link(arg)
      # Supervisor.child_spec({InfoSys.Counter, 5}, restart: :temporary)
      # Supervisor.child_spec({InfoSys.Counter, 110}, id: :long),
      # Supervisor.child_spec({InfoSys.Counter, 5}, id: :short),
      # Supervisor.child_spec({InfoSys.Counter, 1010}, id: :medium)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InfoSys.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
