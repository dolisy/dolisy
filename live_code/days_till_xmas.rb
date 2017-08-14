#write a method which returns nb of days until xmas

require "date"

def days_till_xmas()
  this_xmas_year = Date.today.year
  next_xmas_year = Date.today.year + 1
  this_year_xmas_date = Date.new(this_xmas_year, 12, 25)
  next_year_xmas_date = Date.new(next_xmas_year, 12, 25)
  if this_year_xmas_date >= Date.today
    return (this_year_xmas_date - Date.today).to_i
  else
    return (next_year_xmas_date - Date.today).to_i
  end
end

puts days_till_xmas()

#use Date.next_year and Date.previous_year

def days_till_xmas(today_date)
  xmas = Date.new(today_date.year, 12, 25)
  xmas = xmas.next_year if xmas < today_date
  return (xmas - today_date).to_i
end

today = Date.today

puts days_till_xmas(today)

#use without argument, kind of default behavior

def days_till_xmas(today_date = Date.today) #paramenter = default argument
  xmas = Date.new(today_date.year, 12, 25)
  xmas = xmas.next_year if xmas < today_date
  return (xmas - today_date).to_i
end

today = Date.today

puts days_till_xmas()
