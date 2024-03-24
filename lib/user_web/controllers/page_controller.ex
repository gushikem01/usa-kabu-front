defmodule UserWeb.PageController do
  use UserWeb, :controller

  alias User.Stock
  alias User.Repo

  def index(conn, _params) do
    stocks = Repo.all(Stock)
    render(conn, "index.html", stocks: stocks)
  end
end
