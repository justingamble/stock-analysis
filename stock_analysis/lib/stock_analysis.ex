defmodule StockAnalysis do
  @moduledoc """
  Reads the supplied configuration file containing stock tickers,
  looks up stats on each stock, and
  writes out a spreadsheet that highlights key stats.
  """

  @doc """
  Hello world.

  ## Examples

      iex> StockAnalysis.hello
      :world

  """
  def main(config_file) do
    #    {milliseconds, _value} = :timer.tc(
    IO.puts("StockAnalysis main entered!  Config file: #{config_file}\n")
    File.stream!(config_file)
    |> Stream.map(&String.strip/1)
    |> Stream.with_index
    |> Stream.map(fn ({line, index}) -> IO.puts "#{index + 1} #{line}" end)
    |> Stream.run
  end
end
