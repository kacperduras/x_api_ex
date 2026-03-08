defmodule XApiEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :x_api_ex,
      version: "1.0.0",
      elixir: "~> 1.18",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      description: "Elixir HTTP client for the X API v2.",
      deps: deps(),
      dialyzer: [plt_file: {:no_warn, "priv/plts/dialyzer.plt"}]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:tesla, "~> 1.16"},
      {:ex_doc, "~> 0.40.1", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      name: "x_api_ex",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kacperduras/x_api_ex"},
      files: ~w(.formatter.exs config lib mix.exs README* LICENSE*)
    ]
  end
end
