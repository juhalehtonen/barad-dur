defmodule BaradDur.Auth do
  @moduledoc """
  An OAuth2 strategy for GitHub.
  """
  use OAuth2.Strategy
  alias OAuth2.Strategy.AuthCode

  # Example request:
  # https://cloud.ouraring.com/oauth/authorize?response_type=code&client_id=E5XK6TN&redirect_uri=https%3A%2F%2Fexample.com%2Fcallback&scope=email+personal&state=3PgHyjNECEu5YgTQP33NC5tZJ0onm2

  defp config do
    secrets = get_secrets()

    [
      strategy: OAuth2.Strategy.AuthCode, #default
      state: "XXX",
      site: "https://api.ouraring.com",
      client_id: secrets.client_id,
      client_secret: secrets.client_secret,
      authorize_url: "https://cloud.ouraring.com/oauth/authorize",
      redirect_uri: "http://localhost:4000/auth/oura/callback",
      token_url: "https://api.ouraring.com/oauth/token"
    ]
  end

  # Public API

  def client do
    config()
    |> OAuth2.Client.new()
    |> OAuth2.Client.put_serializer("application/json", Jason)
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), params)
  end

  def get_token!(params \\ [], headers \\ []) do
    client = client()
    merged_params = Keyword.merge(params, client_secret: client().client_secret)
    OAuth2.Client.get_token!(client, merged_params)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end

  # Returns a configuration map of secret stuff :)
  defp get_secrets do
    %{
      client_id: Application.get_env(:baraddur, :oura_client_id) || System.get_env("OURA_CLIENT_ID"),
      client_secret: Application.get_env(:baraddur, :oura_client_secret) || System.get_env("OURA_CLIENT_SECRET")
    }
  end
end
