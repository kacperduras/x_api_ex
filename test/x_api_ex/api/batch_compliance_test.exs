defmodule XApiEx.Api.BatchComplianceTest do
  @moduledoc """
  Tests for `XApiEx.Api.BatchCompliance` — creating and retrieving batch compliance jobs.
  """
  use XApiEx.ApiCase

  alias XApiEx.Fixtures

  describe "create_a_batch_compliance_job/2" do
    test "returns CreateABatchComplianceJob200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :post, url: "https://api.x.com/2/compliance/jobs"} ->
          %Tesla.Env{status: 200, body: Fixtures.create_compliance_job_200()}
      end)

      assert {:ok, %XApiEx.Model.ComplianceJobResponse{}} =
               XApiEx.Api.BatchCompliance.create_a_batch_compliance_job(conn,
                 body: %XApiEx.Model.CreateABatchComplianceJobRequest{type: "tweets"}
               )
    end

    test "returns ApiError on 401", %{conn: conn} do
      Tesla.Mock.mock(fn _ ->
        %Tesla.Env{status: 401, body: Fixtures.unauthorized_response()}
      end)

      assert {:ok, %XApiEx.Model.ApiError{}} =
               XApiEx.Api.BatchCompliance.create_a_batch_compliance_job(conn)
    end
  end

  describe "get_a_compliance_job_by_id/3" do
    test "returns GetAComplianceJobById200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/compliance/jobs/job123"} ->
          %Tesla.Env{status: 200, body: Fixtures.compliance_job_200()}
      end)

      assert {:ok, %XApiEx.Model.ComplianceJobResponse{}} =
               XApiEx.Api.BatchCompliance.get_a_compliance_job_by_id(conn, "job123")
    end

    test "interpolates job ID in URL (returns same model as create)", %{conn: conn} do
      Tesla.Mock.mock(fn env ->
        assert env.url == "https://api.x.com/2/compliance/jobs/myjob"
        %Tesla.Env{status: 200, body: Fixtures.compliance_job_200()}
      end)

      XApiEx.Api.BatchCompliance.get_a_compliance_job_by_id(conn, "myjob")
    end
  end

  describe "get_all_batch_compliance_jobs/2" do
    test "returns GetAllBatchComplianceJobs200Response on 200", %{conn: conn} do
      Tesla.Mock.mock(fn
        %{method: :get, url: "https://api.x.com/2/compliance/jobs"} ->
          %Tesla.Env{status: 200, body: Fixtures.compliance_jobs_200()}
      end)

      assert {:ok, %XApiEx.Model.ComplianceJobsResponse{}} =
               XApiEx.Api.BatchCompliance.get_all_batch_compliance_jobs(conn)
    end
  end
end
