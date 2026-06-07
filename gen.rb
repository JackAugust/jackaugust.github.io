require 'yaml'
require 'fileutils'

authors = YAML.load_file('_data/authors.yml')
FileUtils.mkdir_p('_authors') unless Dir.exist?('_authors')

authors.each do |key, value|
  next if key == "admin"  # admin 可能不需要单独页面？根据需求可选，这里保留也可以
  slug = key.downcase.gsub(/[\(\)\.]/, '').gsub(/\s+/, '-')
  filename = File.join('_authors', "#{slug}.md")
  content = <<~EOF
---
layout: author
author_key: "#{key}"
slug: #{slug}
---
  EOF
  File.write(filename, content)
  puts "Generated #{filename}"
end