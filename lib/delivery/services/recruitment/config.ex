defmodule Delivery.Services.Recruitment.Config do

  alias Helpers.FormatDateTimeHelper, as: Format

  def get_base_url(:api) do
    "https://delivery-center-recruitment-ap.herokuapp.com"
  end

  def x_sent_header() do
    date_time_now = DateTime.utc_now

    hour = Format.hour(date_time_now)
    minute = Format.minute(date_time_now)
    day = Format.day(date_time_now)
    month = Format.month(date_time_now)
    year = Format.year(date_time_now)

    date_time_format = "#{hour}h#{minute} - #{day}/#{month}/#{year}"

    {"X-Sent", date_time_format}
  end

end