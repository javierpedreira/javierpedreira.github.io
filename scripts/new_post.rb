POST_PATH = "#{File.dirname(__FILE__)}/../_posts"
FILE_EXT = 'md'

metadata = { layout: 'post',
             categories: 'posts',
             date: Time.now.strftime('%Y-%m-%d %I:%M:%S'),
             author: 'Javier Pedreira' }

def new_post(name)
  date_prefix_no_hour = Time.now.strftime('%Y-%m-%d')
  post_name_no_spaces = name.tr(' ', '-')
  file_name = "#{date_prefix_no_hour}-#{post_name_no_spaces}.#{FILE_EXT}"
  full_path_file = File.join(POST_PATH, file_name)

  fail("#{file_name} already exists") if File.exist?(full_path_file)
  File.new(full_path_file, 'w+')
  full_path_file
end

def to_string(metadata)
  string_metadata = "---\n"
  metadata.each { |key, value| string_metadata += "#{key}: #{value}\n" }
  string_metadata += "---\n"
end

def attach_metadata(file, metadata)
  File.write(file, to_string(metadata))
end

file_path = new_post(ARGV[0])
# FIXME: Para la primera version vale, pero deberia poder especificar que campo
# agrego para que no sea tan dependiente
# del orden y pueda elegir que agrego y que no.
metadata[:crawlertitle] = ARGV[1]
metadata[:tags] = ARGV[2]
metadata[:summary] = ARGV[3]

attach_metadata(file_path, metadata)
