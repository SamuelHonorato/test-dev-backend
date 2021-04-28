defmodule Delivery.Services.Recruitment.Config do

  alias TransactionsJobs.Services.Bankly.AuthService
  alias TransactionsJobs.Helpers.EnvironmentHelper

  def get_base_url(:api) do
    "https://delivery-center-recruitment-ap.herokuapp.com"
  end

  def x_sent_header() do
    value = ""
    {"X-Sent", value}
  end

end