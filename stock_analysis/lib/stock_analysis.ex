defmodule StockAnalysis do
  @moduledoc """
  Reads the supplied configuration file containing stock tickers,
  looks up stats on each stock, and
  writes out a spreadsheet that highlights key stats.
  """

  alias StockAnalysis.StockInfo

  def main(config_file) do
    #    {milliseconds, _value} = :timer.tc(

    IO.puts("StockAnalysis main entered!  Config file: #{config_file}\n")

    File.stream!(config_file)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.upcase/1)
    |> Stream.map(fn ticker -> Task.async(StockAnalysis.Worker,
              :get_ticker_info, [ticker]) end)
    |> Enum.map(&Task.await(&1))
    |> IO.inspect()
  end

end
