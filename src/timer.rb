# Icon source: http://commons.wikimedia.org/wiki/Nuvola
require 'time'

def mk_item(mins, secs)
  xmlMiddle = "<title>Start the timer</title>"
  xmlMiddle += "<icon>icon.png</icon>"

  xmlString = "<item arg=\"#{Integer(mins) * 60 + Integer(secs)}\">"
  xmlString += "<subtitle>For #{mins} minute(s), #{secs} second(s)</subtitle>"
  xmlString += xmlMiddle
  xmlString += "</item>"
  return xmlString
end

def parse_time(s)
  xmlString = ""
  times = s.split ":"
  if times.size == 2 then
    xmlString += mk_item times[0], times[1]
  elsif times.size == 1 then
    xmlString += mk_item times[0], "0"
  else
    # raise "Unknown format"
  end
  return xmlString
end

interval = ARGV.join ' '
xml = "<?xml version=\"1.0\"?>\n<items>\n"
begin
  xml += parse_time interval
rescue
  xmlMiddle = "<title>Start the timer</title>"
  xmlMiddle += "<icon>icon.png</icon>"
  xml += "<item arg=\"0\">"
  xml += xmlMiddle
  xml += "<subtitle>Unknown format</subtitle>"
  xml += "</item>"
end  
xml += "</items>"
puts xml




