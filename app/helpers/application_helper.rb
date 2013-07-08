module ApplicationHelper

    # TIME FUNCTION FROM http://almosteffortless.com/2007/07/29/the-perfect-timestamp/
    def time_till_today(from_time, to_time = Time.now, include_seconds = true, detail = false)
         from_time = from_time.to_time if from_time.respond_to?(:to_time)
         to_time = to_time.to_time if to_time.respond_to?(:to_time)
         distance_in_minutes = (((to_time - from_time).abs)/60).round
         distance_in_seconds = ((to_time - from_time).abs).round
         case distance_in_minutes
             when 0..1           then time = (distance_in_seconds < 60) ? "#{distance_in_seconds} seconds ago" : '1 minute ago'
             when 2..59          then time = "#{distance_in_minutes} minutes ago"
             when 60..90         then time = "1 hour ago"
             when 90..1440       then time = "#{(distance_in_minutes.to_f / 60.0).round} hours ago"
             when 1440..2160     then time = '1 day ago' # 1-1.5 days
             when 2160..2880     then time = "#{(distance_in_minutes.to_f / 1440.0).round} days ago" # 1.5-2 days
         else
             @th = "th"
             @th = "st"  if from_time.strftime("%d").to_i == 1
             @th = "nd" if from_time.strftime("%d").to_i == 2
             @th = "rd" if from_time.strftime("%d").to_i == 3
             @th = "st" if from_time.strftime("%d").to_i == 21
             @th = "nd" if from_time.strftime("%d").to_i == 22
             @th = "rd" if from_time.strftime("%d").to_i == 23
             @th = "st"  if from_time.strftime("%d").to_i == 31
            time = from_time.strftime("%b %e" + @th + ",  %Y")
         end
         return time_stamp(from_time) if (detail && distance_in_minutes > 2880)
         return time
    end

end
