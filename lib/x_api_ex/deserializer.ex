defmodule XApiEx.Deserializer do
  @moduledoc """
  Helper functions for deserializing responses into models
  """

  @doc """
  Decode a JSON string into a plain map or list.

  ### Parameters

  - `json` (String.t): A JSON-encoded string.

  ### Returns

  - `{:ok, term}` on success
  - `{:error, term}` on failure
  """
  @spec json_decode(String.t()) :: {:ok, term()} | {:error, term()}
  def json_decode(json) do
    JSON.decode(json)
  end

  @doc """
  Decode a JSON string and convert the result into the given module's struct.

  ### Parameters

  - `json` (String.t): A JSON-encoded string.
  - `module` (module): The module to decode the parsed value into.

  ### Returns

  - `{:ok, struct}` on success
  - `{:error, term}` on failure
  """
  @spec json_decode(String.t(), module()) :: {:ok, struct()} | {:error, term()}
  def json_decode(json, module) do
    json
    |> json_decode()
    |> case do
      {:ok, decoded} -> {:ok, to_struct(decoded, module)}
      {:error, _} = error -> error
    end
  end

  @doc """
  Update the provided model with a deserialization of a nested value
  """
  @spec deserialize(struct(), atom(), :date | :datetime | :list | :map | :struct, module()) ::
          struct()
  def deserialize(model, field, :list, module) do
    model
    |> Map.update!(field, fn
      nil ->
        nil

      list ->
        Enum.map(list, &to_struct(&1, module))
    end)
  end

  def deserialize(model, field, :struct, module) do
    model
    |> Map.update!(field, fn
      nil ->
        nil

      value ->
        to_struct(value, module)
    end)
  end

  def deserialize(model, field, :map, module) do
    maybe_transform_map = fn
      nil ->
        nil

      existing_value ->
        Map.new(existing_value, fn
          {key, value} ->
            {key, to_struct(value, module)}
        end)
    end

    Map.update!(model, field, maybe_transform_map)
  end

  def deserialize(model, field, :date, _) do
    value = Map.get(model, field)

    case is_binary(value) do
      true ->
        case Date.from_iso8601(value) do
          {:ok, date} -> Map.put(model, field, date)
          _ -> model
        end

      false ->
        model
    end
  end

  def deserialize(model, field, :datetime, _) do
    value = Map.get(model, field)

    case is_binary(value) do
      true ->
        case DateTime.from_iso8601(value) do
          {:ok, datetime, _offset} -> Map.put(model, field, datetime)
          _ -> model
        end

      false ->
        model
    end
  end

  defp to_struct(value, module)
  defp to_struct(nil, _), do: nil

  defp to_struct(list, module) when is_list(list) and is_atom(module) do
    Enum.map(list, &to_struct(&1, module))
  end

  defp to_struct(map, module) when is_map(map) and is_atom(module) do
    model = struct(module)

    model
    |> Map.keys()
    |> List.delete(:__struct__)
    |> Enum.reduce(model, fn field, acc ->
      Map.replace(acc, field, Map.get(map, Atom.to_string(field)))
    end)
    |> module.decode()
  end

  defp to_struct(value, module) when is_atom(module) do
    module.decode(value)
  end
end
