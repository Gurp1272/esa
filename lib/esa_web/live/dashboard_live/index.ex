defmodule EsaWeb.DashboardLive.Index do
  use EsaWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
