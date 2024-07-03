defmodule KemiskinanWeb.Router do
  use KemiskinanWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KemiskinanWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KemiskinanWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/penduduks", PendudukLive.Index, :index
    live "/penduduks/new", PendudukLive.Index, :new
    live "/penduduks/:id/edit", PendudukLive.Index, :edit

    live "/penduduks/:id", PendudukLive.Show, :show
    live "/penduduks/:id/show/edit", PendudukLive.Show, :edit

    resources "/kuesioners", KuesionerController

    get "/pertanyaans/new/:kuesioner_id", PertanyaanController, :new
    resources "/pertanyaans", PertanyaanController

    resources "/respons", ResponsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", KemiskinanWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kemiskinan, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: KemiskinanWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
