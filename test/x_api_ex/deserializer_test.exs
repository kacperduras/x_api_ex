defmodule XApiEx.DeserializerTest do
  @moduledoc """
  Tests for `XApiEx.Deserializer` — JSON decoding and struct deserialization.
  """
  use ExUnit.Case, async: true

  alias XApiEx.Deserializer

  describe "json_decode/1" do
    test "decodes valid JSON object" do
      assert {:ok, %{"key" => "value"}} = Deserializer.json_decode(~s({"key":"value"}))
    end

    test "decodes valid JSON array" do
      assert {:ok, [1, 2, 3]} = Deserializer.json_decode("[1,2,3]")
    end

    test "returns error for invalid JSON" do
      assert {:error, _} = Deserializer.json_decode("not json")
    end

    test "decodes nested JSON" do
      json = ~s({"data":{"id":"123","text":"Hello"}})

      assert {:ok, %{"data" => %{"id" => "123", "text" => "Hello"}}} =
               Deserializer.json_decode(json)
    end
  end

  describe "json_decode/2" do
    test "decodes JSON and converts to struct" do
      json = ~s({"data":{"id":"123","text":"Hello world"}})

      assert {:ok, %XApiEx.Model.CreateAPost200Response{data: data}} =
               Deserializer.json_decode(json, XApiEx.Model.CreateAPost200Response)

      assert data.id == "123"
      assert data.text == "Hello world"
    end

    test "returns error for invalid JSON" do
      assert {:error, _} =
               Deserializer.json_decode("not json", XApiEx.Model.CreateAPost200Response)
    end

    test "handles null fields" do
      json = ~s({"data":null})

      assert {:ok, %XApiEx.Model.CreateAPost200Response{data: nil}} =
               Deserializer.json_decode(json, XApiEx.Model.CreateAPost200Response)
    end
  end

  describe "deserialize/4 with :struct" do
    test "deserializes nested struct field" do
      model = %XApiEx.Model.CreateAPost200Response{
        data: %{"id" => "123", "text" => "Hello"}
      }

      result =
        Deserializer.deserialize(model, :data, :struct, XApiEx.Model.CreateAPost200ResponseData)

      assert %XApiEx.Model.CreateAPost200ResponseData{id: "123", text: "Hello"} = result.data
    end

    test "handles nil field value" do
      model = %XApiEx.Model.CreateAPost200Response{data: nil}

      result =
        Deserializer.deserialize(model, :data, :struct, XApiEx.Model.CreateAPost200ResponseData)

      assert result.data == nil
    end
  end

  describe "deserialize/4 with :list" do
    test "deserializes list of maps to list of structs" do
      base = %XApiEx.Model.UsersResponse{
        data: [%{"id" => "111", "name" => "User", "username" => "user"}]
      }

      result = Deserializer.deserialize(base, :data, :list, XApiEx.Model.UserSummary)
      assert [%XApiEx.Model.UserSummary{id: "111"}] = result.data
    end

    test "handles nil list field" do
      base = %XApiEx.Model.UsersResponse{data: nil}
      result = Deserializer.deserialize(base, :data, :list, XApiEx.Model.UserSummary)
      assert result.data == nil
    end
  end

  describe "deserialize/4 with :date" do
    test "parses ISO8601 date string" do
      model = %{created_at: "2024-01-15"}
      result = Deserializer.deserialize(model, :created_at, :date, nil)
      assert result.created_at == ~D[2024-01-15]
    end

    test "leaves model unchanged for nil date" do
      model = %{created_at: nil}
      result = Deserializer.deserialize(model, :created_at, :date, nil)
      assert result.created_at == nil
    end

    test "leaves model unchanged for invalid date string" do
      model = %{created_at: "not-a-date"}
      result = Deserializer.deserialize(model, :created_at, :date, nil)
      assert result.created_at == "not-a-date"
    end
  end

  describe "deserialize/4 with :datetime" do
    test "parses ISO8601 datetime string" do
      model = %{created_at: "2024-01-15T10:30:00Z"}
      result = Deserializer.deserialize(model, :created_at, :datetime, nil)
      assert %DateTime{year: 2024, month: 1, day: 15} = result.created_at
    end

    test "leaves model unchanged for nil datetime" do
      model = %{created_at: nil}
      result = Deserializer.deserialize(model, :created_at, :datetime, nil)
      assert result.created_at == nil
    end

    test "leaves model unchanged for invalid datetime string" do
      model = %{created_at: "not-a-datetime"}
      result = Deserializer.deserialize(model, :created_at, :datetime, nil)
      assert result.created_at == "not-a-datetime"
    end
  end
end
