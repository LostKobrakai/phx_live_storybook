defmodule PhxLiveStorybook.MixProject do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :phx_live_storybook,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      config_path: "./config/config.exs",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      description: "A pluggable storybook for your LiveView components.",
      package: package(),
      name: "phx_live_storybook",
      source_url: "https://github.com/phenixdigital/phx_live_storybook",
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.lcov": :test,
        coverage: :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, "~> 0.17.11"},
      {:makeup_eex, "~> 0.1.0"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:floki, "~> 0.33.0", only: :test}
    ]
  end

  defp docs do
    [
      main: "PhxLiveStorybook",
      source_ref: "v#{@version}",
      source_url: "https://github.com/phenixdigital/phx_live_storybook",
      extras: ["README.md"],
      nest_modules_by_prefix: [PhxLiveStorybook]
    ]
  end

  defp package do
    [
      maintainers: ["Christian Blavier"],
      files: ~w(mix.exs dist lib README.md LICENSE.md CHANGELOG.md),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/phenixdigital/phx_live_storybook"}
    ]
  end

  defp aliases do
    [
      "assets.watch": "cmd npm run watch --prefix assets",
      coverage: "coveralls.lcov"
    ]
  end
end
