defmodule StockAnalysis.MixProject do
  use Mix.Project

  def project do
    [
      app: :stock_analysis,
      version: "0.1.0",
      elixir: "~> 1.6.5",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(), default_task: "check_stocks"
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
#      mod: {StockAnalysis.CLI.run(["--config_file", "./stocks_tickers.txt"])}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:stoxir, "~> 0.1.1"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
