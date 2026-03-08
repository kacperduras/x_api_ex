defmodule XApiEx.RequestBuilderTest do
  @moduledoc """
  Tests for `XApiEx.RequestBuilder` — building and evaluating Tesla request maps.
  """
  use ExUnit.Case, async: true

  import XApiEx.RequestBuilder

  describe "method/2" do
    test "sets method on empty request" do
      assert %{method: :get} = method(%{}, :get)
    end

    test "does not override existing method (put_new semantics)" do
      request = %{method: :post}
      assert %{method: :post} = method(request, :get)
    end

    test "supports all HTTP methods" do
      for m <- [:get, :post, :put, :patch, :delete] do
        assert %{method: ^m} = method(%{}, m)
      end
    end
  end

  describe "url/2" do
    test "sets url on empty request" do
      assert %{url: "/2/tweets"} = url(%{}, "/2/tweets")
    end

    test "does not override existing url (put_new semantics)" do
      request = %{url: "/original"}
      assert %{url: "/original"} = url(request, "/new")
    end
  end

  describe "add_param/4" do
    test "adds query param as list" do
      request = add_param(%{}, :query, :ids, "123,456")
      assert request.query == [{:ids, "123,456"}]
    end

    test "appends multiple query params" do
      request =
        %{}
        |> add_param(:query, :ids, "123")
        |> add_param(:query, :"tweet.fields", "id,text")

      assert {:ids, "123"} in request.query
      assert {:"tweet.fields", "id,text"} in request.query
    end

    test "sets body directly when key is :body" do
      body = %{text: "Hello"}
      request = add_param(%{}, :body, :body, body)
      assert request.body == body
    end

    test "adds header" do
      request = add_param(%{}, :headers, "x-custom", "value")
      assert request.headers == [{"x-custom", "value"}]
    end

    test "adds form param" do
      request = add_param(%{}, :form, :field, "value")
      assert request.body == %{field: "value"}
    end

    test "merges multiple form params" do
      request =
        %{}
        |> add_param(:form, :a, "1")
        |> add_param(:form, :b, "2")

      assert request.body == %{a: "1", b: "2"}
    end
  end

  describe "add_optional_params/3" do
    test "returns request unchanged when opts is empty" do
      request = %{method: :get}
      result = add_optional_params(request, %{ids: :query}, [])
      assert result == request
    end

    test "adds known optional param" do
      definitions = %{ids: :query}
      result = add_optional_params(%{}, definitions, ids: "123")
      assert result.query == [{:ids, "123"}]
    end

    test "ignores unknown params" do
      definitions = %{ids: :query}
      result = add_optional_params(%{}, definitions, unknown: "value", ids: "123")
      assert result.query == [{:ids, "123"}]
      refute Map.has_key?(result, :unknown)
    end

    test "adds multiple known params" do
      definitions = %{ids: :query, expansions: :query}
      result = add_optional_params(%{}, definitions, ids: "123", expansions: "author_id")
      assert length(result.query) == 2
    end
  end

  describe "ensure_body/1" do
    test "adds empty body when body is missing" do
      result = ensure_body(%{method: :post})
      assert result.body == ""
    end

    test "replaces nil body with empty string" do
      result = ensure_body(%{body: nil})
      assert result.body == ""
    end

    test "does not override existing body" do
      body = %{text: "Hello"}
      result = ensure_body(%{body: body})
      assert result.body == body
    end
  end

  describe "evaluate_response/2" do
    test "decodes 200 response to specified module" do
      env = %Tesla.Env{status: 200, body: ~s({"data":{"id":"123","text":"Hello"}})}
      result = evaluate_response({:ok, env}, [{200, XApiEx.Model.CreateAPost200Response}])
      assert {:ok, %XApiEx.Model.CreateAPost200Response{}} = result
    end

    test "returns {:ok, env} when mapping is false" do
      env = %Tesla.Env{status: 429, body: "rate limited"}
      result = evaluate_response({:ok, env}, [{429, false}])
      assert {:ok, ^env} = result
    end

    test "returns {:error, env} when no mapping matches" do
      env = %Tesla.Env{status: 500, body: "server error"}
      result = evaluate_response({:ok, env}, [{200, XApiEx.Model.CreateAPost200Response}])
      assert {:error, ^env} = result
    end

    test "uses :default mapping as fallback" do
      env = %Tesla.Env{status: 503, body: ~s({"data":{"id":"123","text":"Hello"}})}

      result =
        evaluate_response({:ok, env}, [
          {200, XApiEx.Model.CreateAPost200Response},
          {:default, XApiEx.Model.CreateAPost200Response}
        ])

      assert {:ok, %XApiEx.Model.CreateAPost200Response{}} = result
    end

    test "passes through error tuples unchanged" do
      error = {:error, :econnrefused}
      result = evaluate_response(error, [{200, XApiEx.Model.CreateAPost200Response}])
      assert {:error, :econnrefused} = result
    end

    test "matches first applicable status code" do
      env = %Tesla.Env{status: 200, body: ~s({"data":{"id":"123","text":"Hello"}})}

      result =
        evaluate_response({:ok, env}, [
          {200, XApiEx.Model.CreateAPost200Response},
          {200, XApiEx.Model.DeleteAPost200Response}
        ])

      assert {:ok, %XApiEx.Model.CreateAPost200Response{}} = result
    end
  end
end
