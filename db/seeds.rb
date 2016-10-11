require 'json'

Dir['db/data/*'].each do |path|
  puts path
  json = JSON.parse(File.read(path))
  json['posts'].each do |post|
    summary = post['summary']
    image_url = post['photos'].first['original_size']['url']
    Thing.create(summary: summary, image_url: image_url)
  end
end
