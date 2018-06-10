defmodule StockAnalysis.Worker do
  @moduledoc """
  For the specified stock ticker, it looks up informmation.
  """
  alias StockAnalysis.StockInfo

  def get_ticker_info(ticker) do
    IO.puts("StockAnalysis.Worker get_ticker_info() entered!  Received ticker: '#{ticker}'\n")

    %StockInfo{ticker: ticker}
    |> process_key_stats
    # Add all the process calls you want, each calling Stoxir and grabbing what is useful
    |> IO.inspect()
  end

  def process_key_stats(stats = %{ticker: ticker} = %StockInfo{}) do
    key_stats = Stoxir.key_stats(ticker)
    IO.puts("Key stats of #{ticker}: #{inspect(key_stats)}")
    require IEx
    IEx.pry()

    IO.puts("-------------------------------")

    %{
      company_name: company_name,
      dividend_yield: dividend_yield,
      shares_outstanding: shares_outstanding
    } = key_stats

    ##    %{ primary_exchange: primary_exchange,
    #      company_name: company_name,
    #      delayed_price: delayed_price,
    #      latest_price: latest_price,
    #      week52_high: week52_high,
    #      week52_low: week52_low} = Stoxir.quote(ticker)

    %{
      stats
      | company_name: company_name,
        dividend_yield: dividend_yield,
        shares_outstanding: shares_outstanding
    }
  end
end
