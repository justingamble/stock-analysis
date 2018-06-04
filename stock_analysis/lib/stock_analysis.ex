defmodule StockAnalysis do
  @moduledoc """
  Reads the supplied configuration file containing stock tickers,
  looks up stats on each stock, and
  writes out a spreadsheet that highlights key stats.
  """

#  import Stoxir, only: [price: 1]

  def main(config_file) do
    #    {milliseconds, _value} = :timer.tc(

    IO.puts("StockAnalysis main entered!  Config file: #{config_file}\n")
    my_map = Stoxir.quote("GOOG")
    IO.puts("Got past that line")
    IO.puts("MyMap: #{inspect my_map}")

## JUSTIN: Dobule lines are things I would like to uncomment.


    File.stream!(config_file)
    |> Stream.map(&String.strip/1)
    |> Stream.with_index
    |> Stream.map(fn ({line, index}) -> IO.puts "main: #{index + 1} #{line}"
                                        {line, index} end)

#    |> Stream.map(fn ({line, _index}) -> Task.async(StockAnalysis.Worker,
#        :get_ticker_info,
#        [line]) end)
##    |> Enum.map(&Task.await(&1))


#    |> Enum.map(fn (map = %{k, v}) -> IO.puts("main: This is what I got back: #{inspect map}") end)
##    |> Stream.run

#    defmodule StockAnalysis.Worker do
#      @moduledoc """
#      For the specified stock ticker, it looks up informmation.
#      """
#
#      def get_ticker_info(ticker) do
#
  end
end
