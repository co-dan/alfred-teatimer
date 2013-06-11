# TODO: Create a special exception
# TODO: Better time parsing
# TODO: Database of teas

require 'time'

class TimeInterval
  def initialize(min,sec)
    @mins = Integer(min)
    @secs = Integer(sec)
  end

  def to_s
    xmlMiddle = "<title>Start the timer</title>"
    xmlMiddle += "<icon>icon.png</icon>"
    
    xmlString = "<item arg=\"#{@mins * 60 + @secs}\">"
    xmlString += "<subtitle>For #{@mins} minute(s), #{@secs} second(s)</subtitle>"
    xmlString += xmlMiddle
    xmlString += "</item>"
    return xmlString
  end

  def self.bad_format
    xmlMiddle = "<title>Start the timer</title>"
    xmlMiddle += "<icon>icon.png</icon>"
    xmlString = "<item arg=\"0\">"
    xmlString += xmlMiddle
    xmlString += "<subtitle>Unknown format</subtitle>"
    xmlString += "</item>"
    return xmlString
  end
end


# Parse time in format 1:2
def parse_time(s)
  times = s.split ":"
  if times.size == 2 then
    r = TimeInterval.new(times[0], times[1])
  elsif times.size == 1 then
    begin
      r = TimeInterval.new(times[0], 0)
    # rescue ArgumentError => e
    #  parse_time2 s
    end
  else
    raise "Unknown format"
  end
  return r
end

interval = ARGV.join ' '
xml = "<?xml version=\"1.0\"?>\n<items>\n"
begin
  xml += parse_time(interval).to_s
rescue
  xml += TimeInterval.bad_format.to_s
end  
xml += "</items>"
puts xml




