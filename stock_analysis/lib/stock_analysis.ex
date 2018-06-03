defmodule StockAnalysis do
  @moduledoc """
  Read the supplied file containing stock tickers, lookup stats on each
  stock, and write out a spreadsheet that highlights key stats.
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
  end
end
