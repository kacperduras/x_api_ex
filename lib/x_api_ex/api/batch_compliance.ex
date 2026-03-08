defmodule XApiEx.Api.BatchCompliance do
  @moduledoc """
  API calls for all endpoints tagged `BatchCompliance`.
  """

  alias XApiEx.Connection
  import XApiEx.RequestBuilder

  @doc """
  Create a batch compliance job
  Creates a new compliance job for Post IDs or user IDs.  A compliance job will contain an ID and a destination URL. The destination URL represents the location that contains the list of IDs consumed by your App  For full details, see the [API reference](https://docs.x.com/x-api/compliance/create-compliance-job) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateABatchComplianceJobRequest): 

  ### Returns

  - `{:ok, XApiEx.Model.ComplianceJobResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_a_batch_compliance_job(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ComplianceJobResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def create_a_batch_compliance_job(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/2/compliance/jobs")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.ComplianceJobResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Get a compliance job by ID
  Get a single compliance job with the specified ID.  For full details, see the [API reference](https://docs.x.com/x-api/compliance/get-compliance-job) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `id` (String.t): 
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, XApiEx.Model.ComplianceJobResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_a_compliance_job_by_id(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ComplianceJobResponse.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:error, Tesla.Env.t()}
  def get_a_compliance_job_by_id(connection, id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/2/compliance/jobs/#{id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.ComplianceJobResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end

  @doc """
  Get all batch compliance jobs
  Returns a list of recent compliance jobs.  For full details, see the [API reference](https://docs.x.com/x-api/compliance/list-compliance-jobs) for this endpoint.  [Sign up](https://t.co/signup) for the X API

  ### Parameters

  - `connection` (XApiEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:type` (String.t): 

  ### Returns

  - `{:ok, XApiEx.Model.ComplianceJobsResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_all_batch_compliance_jobs(Tesla.Env.client(), keyword()) ::
          {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ApiError.t()}
          | {:ok, XApiEx.Model.ComplianceJobsResponse.t()}
          | {:error, Tesla.Env.t()}
  def get_all_batch_compliance_jobs(connection, opts \\ []) do
    optional_params = %{
      :type => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/2/compliance/jobs")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, XApiEx.Model.ComplianceJobsResponse},
      {401, XApiEx.Model.ApiError},
      {429, XApiEx.Model.ApiError}
    ])
  end
end
