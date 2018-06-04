defmodule StockAnalysis.Worker do
  @moduledoc """
  For the specified stock ticker, it looks up informmation.
  """

  def get_ticker_info(ticker) do
    IO.puts("StockAnalysis.Worker get_ticker_info() entered!  Received ticker: '#{ticker}'\n")
##    %{ primary_exchange: primary_exchange,
#      company_name: company_name,
#      delayed_price: delayed_price,
#      latest_price: latest_price,
#      week52_high: week52_high,
#      week52_low: week52_low} = Stoxir.quote(ticker)

#### UNCOMENT ME    Stoxir.quote(ticker)

#    IO.puts("Stoxir returns: #{inspect Stoxir.quote(ticker)}")

#    IO.puts("Thread for #{ticker} found company_name #{company_name}")
##    IO.puts("   Map is #{IO.inspect map}")
#    map
  end
end
