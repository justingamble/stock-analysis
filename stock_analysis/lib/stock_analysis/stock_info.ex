defmodule StockAnalysis.StockInfo do
  @moduledoc """
  Holds the information about stocks that we care about.
  """
  defstruct ticker: nil,
            company_name: nil,
            shares_outstanding: 0,
            dividend_yield: nil
end
