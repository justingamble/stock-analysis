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
        config_file: :string
      ],
      aliases: [
        h: :help,
        c: :config_file
      ]
    )
  end

  defp process_options(options) do
    case options do
      {[config_file: config_file], _, _} ->
        validate_args(config_file)
        StockAnalysis.main(config_file)
      _ -> do_help()
    end
  end

  defp validate_args(config_file) do
    if not File.exists?(config_file) do
      IO.puts("ERROR: config_file '#{config_file}' does not exist")
      System.halt(1)
    end
  end

  defp do_help() do
    IO.puts """
    Usage:
      stock_analysis --config_file [path]

    Options:
      config_file: text file, where each line contains a stock ticker.

    Example:
      ./stock_analysis --config_file ./my_config_file.txt
    """
  end

end
