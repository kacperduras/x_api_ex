defmodule XApiEx.ApiCase do
  @moduledoc """
  Common test case for API module tests.
  Sets up a Tesla connection with a mock bearer token.
  """

  @doc """
  Sets up `ExUnit.Case` with async mode enabled, aliases `XApiEx.Connection`,
  and creates a test Tesla client with a mock bearer token in each test's setup.
  """
  defmacro __using__(_opts) do
    quote do
      use ExUnit.Case, async: true

      alias XApiEx.Connection

      setup do
        conn = Connection.new(bearer_token: "test-bearer-token")
        {:ok, conn: conn}
      end
    end
  end
end
