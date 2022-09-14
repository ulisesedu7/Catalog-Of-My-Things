require 'json'

def update_file(filename, data)
  file = "../data-storage/#{filename}.json"
  File.new(file, 'w+') unless File.exist?(file)
  File.write(file, data.to_json)
end