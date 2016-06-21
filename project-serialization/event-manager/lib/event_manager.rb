require 'sunlight/congress'
require 'csv'
require 'erb'

Sunlight::Congress.api_key = "ebf0665497794166a5c0168a3f997924"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

## Cleaning the numbers
# def clean_phone(number)
#   number = ""
#   if number.length < 10
#    number = "Bad number" 
#   elsif number.length == 11 && number[0] == "1"
#     number = number[1..-1]
#   elsif number.length == 11 && number[0] != "1"
#     number = "Bad number"
#   elsif number.length > 11
#     number = "Bad number"
# end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager Initialized!"

lines = CSV.open("../event_attendees.csv", headers: true, header_converters: :symbol)

template_letter = File.read("../form_letter.erb")
erb_template = ERB.new template_letter

lines.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])
  # phone_number = clean_phone(row[:HomePhone])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)
end
