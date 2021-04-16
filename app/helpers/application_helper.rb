module ApplicationHelper
  def formated_time(time, filling = 'None')
    return filling unless time
    time.strftime('%Y-%m-%d %I:%M %p')
  end 
end
