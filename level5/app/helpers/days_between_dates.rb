module DaysBetweenDates
  def nb_of_days(start_date, end_date)
    (end_date - start_date).to_i + 1
  end
end