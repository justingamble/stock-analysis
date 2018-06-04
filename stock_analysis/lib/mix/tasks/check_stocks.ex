defmodule Mix.Tasks.CheckStocks do
  use Mix.Task

  # using _ to avoid the compiler complaining about an arg
  # we are not using.  Here, our main application is called 'Budget'.
  # The @shortdoc allows 'mix help' to show our application.
  @shortdoc "Check the stats on the stocks listed in 'stock_tickers.txt'"
  def run(_) do
    StockAnalysis.CLI.run(["--config", "./stocks_tickers.txt"])
  end
end
