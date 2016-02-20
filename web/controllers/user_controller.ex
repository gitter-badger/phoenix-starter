defmodule PhoenixGuardian.UserController do
  use PhoenixGuardian.Web, :controller

  alias PhoenixGuardian.{Repo, User, Authorization}

  def new(conn, params, current_user, _claims) do
    render conn, "new.html", current_user: current_user
  end
end
