defmodule EsaWeb.Router do
  use EsaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {EsaWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EsaWeb do
    pipe_through :browser

    get "/", PageController, :home

    # Items
    live "/items", ItemLive.Index, :index
    live "/items/new", ItemLive.Index, :new
    live "/items/:id/edit", ItemLive.Index, :edit

    live "/items/:id", ItemLive.Show, :show
    live "/items/:id/show/edit", ItemLive.Show, :edit

    # Lots
    live "/lots", LotLive.Index, :index
    live "/lots/new", LotLive.Index, :new
    live "/lots/:id/edit", LotLive.Index, :edit

    live "/lots/:id", LotLive.Show, :show
    live "/lots/:id/show/edit", LotLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", EsaWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:esa, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EsaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
