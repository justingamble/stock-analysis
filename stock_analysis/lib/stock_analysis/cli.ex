defmodule StockAnalysis.CLI do
  @moduledoc """
  Parse and validate command line options.
  """

  def run(args) do
    args
    |> parse_args
    |> process_options
  end

  defp parse_args(args) do
    OptionParser.parse(
      args,
      switches: [
        help: :boolean,
        config: :string
      ],
      aliases: [
        h: :help,
        c: :config
      ]
    )
  end

  defp process_options(options) do
    case options do
      {[config: config], _, _} ->
        validate_args(config)
        StockAnalysis.main(config)

      _ ->
        IO.puts("Received options: #{inspect options}")
        do_help()
    end
  end

  defp validate_args(config) do
    if not File.exists?(config) do
      IO.puts("ERROR: config '#{config}' does not exist")
      System.halt(1)
    end
  end

  defp do_help() do
    IO.puts("""
    Usage:
      stock_analysis --config [path]

    Options:
      config: text file, where each line contains a stock ticker.

    Example:
      ./stock_analysis --config ./my_config.txt
    """)
  end
end
