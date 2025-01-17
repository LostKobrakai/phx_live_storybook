ExUnit.start()

defmodule PhxLiveStorybook.TestStorybook do
  use PhxLiveStorybook, otp_app: :phx_live_storybook
end

defmodule PhxLiveStorybook.TestRouter do
  use Phoenix.Router
  import PhxLiveStorybook.Router

  pipeline :browser do
    plug(:fetch_session)
  end

  scope "/", ThisWontBeUsed, as: :this_wont_be_used do
    pipe_through(:browser)

    live_storybook("/storybook",
      otp_app: :phx_live_storybook,
      backend_module: PhxLiveStorybook.TestStorybook
    )
  end
end

defmodule PhxLiveStorybook.TestEndpoint do
  use Phoenix.Endpoint, otp_app: :phx_live_storybook

  plug(Plug.Session,
    store: :cookie,
    key: "_live_view_key",
    signing_salt: "/VEDsdfsffMnp5"
  )

  plug(PhxLiveStorybook.TestRouter)
end

Application.put_env(:phx_live_storybook, PhxLiveStorybook.TestEndpoint,
  url: [host: "localhost", port: 4000],
  secret_key_base: "Hu4qQN3iKzTV4fJxhorPQlA/osH9fAMtbtjVS58PFgfw3ja5Z18Q/WSNR9wP4OfW",
  live_view: [signing_salt: "hMegieSe"],
  check_origin: false,
  render_errors: [view: PhxLiveStorybook.ErrorView]
)
