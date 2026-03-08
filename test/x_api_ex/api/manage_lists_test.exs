defmodule XApiEx.Api.ManageListsTest do
  @moduledoc """
  Tests for `XApiEx.Api.ManageLists` — creating, updating, and deleting lists.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "create_a_list/2" do
    test "returns CreateAList201Response on 201", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/lists"} ->
          %Tesla.Env{status: 201, body: Fixtures.create_list_201()}
      end)

      assert {:ok, %XApiEx.Model.CreateAList201Response{data: data}} =
               XApiEx.Api.ManageLists.create_a_list(conn,
                 body: %XApiEx.Model.CreateAListRequest{name: "Test List"}
               )

      assert data.id == "list123"
      assert data.name == "Test List"
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.ManageLists.create_a_list(conn)
    end
  end

  describe "delete_a_list/3" do
    test "sends DELETE to /2/lists/:id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :delete
        assert env.url == "https://api.x.com/2/lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.delete_list_200()}
      end)

      assert {:ok, %XApiEx.Model.DeleteAPost200Response{}} =
               XApiEx.Api.ManageLists.delete_a_list(conn, "list123")
    end
  end

  describe "update_a_list/3" do
    test "sends PUT to /2/lists/:id", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.method == :put
        assert env.url == "https://api.x.com/2/lists/list123"
        %Tesla.Env{status: 200, body: Fixtures.update_list_200()}
      end)

      assert {:ok, _} = XApiEx.Api.ManageLists.update_a_list(conn, "list123")
    end
  end
end
