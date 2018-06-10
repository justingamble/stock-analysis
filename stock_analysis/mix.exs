defmodule StockAnalysis.MixProject do
  use Mix.Project

  def project do
    [
      app: :stock_analysis,
      version: "0.1.0",
      elixir: "~> 1.6.5",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
      #      deps: deps(), default_task: "check_stocks"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      #      [applications: [:stoxir]]
      #      extra_applications: [:logger, :stoxir, :hackney]
      applications: [:stoxir],
      extra_applications: [:logger]
      #  , :yahoo_finanza]
      #      mod: {StockAnalysis.CLI.run(["--config_file", "./stocks_tickers.txt"])}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:stoxir, "~> 0.1.3"}
      #      {:yahoo_finanza, "~> 0.3.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
