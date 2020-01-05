module Utils
  extend self

  def datetime_from_date_and_time(date, time)
    date + time.seconds_since_midnight.seconds
  end
end