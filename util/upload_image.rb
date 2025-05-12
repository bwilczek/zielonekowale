require 'base64'
require 'faraday'
require 'json'

raise 'API key not present in ENV. Please set $IMGBB_API_KEY' unless ENV['IMGBB_API_KEY']

# IMGBB_UPLOAD_URL = 'https://api.imgbb.com/1/upload'
IMGBB_API_KEY = ENV['IMGBB_API_KEY']

gallery = ARGV.shift
files = ARGV

puts "Gallery name: #{gallery}"
puts files

# Parameters
# key (required)
#   The API key.
# image (required)
#   A binary file, base64 data, or a URL for an image. (up to 32 MB)
# name (optional)
#   The name of the file, this is automatically detected if uploading a file with a POST and multipart / form-data
# expiration (optional)
#   Enable this if you want to force uploads to be auto deleted after certain time (in seconds 60-15552000)

puts "#{gallery}:"
files.each do |path|
  name = File.basename(path, '.*').tr('_', ' ')
  puts "  - label: #{name}"
  encoded_image = Base64.encode64(File.read(path))
  response = Faraday
    .new(url: 'https://api.imgbb.com', params: {key: IMGBB_API_KEY, name: name})
    .post('/1/upload', image: encoded_image)
  data = response.body
  # TODO: error handling, yea whatever...
  data = JSON.parse(data)
  puts "    desc: FILL IN OR DELETE"
  puts "    thumb: #{data.dig('data','thumb', 'url')}"
  puts "    medium: #{data.dig('data','medium', 'url')}"
  puts "    full: #{data.dig('data','image', 'url')}"
  puts "    external: #{data.dig('data','url_viewer')}"
  sleep 1
end
