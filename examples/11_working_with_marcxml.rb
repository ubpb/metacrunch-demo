# Require Gemfile depenedencies
Bundler.require

# Set the source. Dummy files are in assets/marcxml.
# Run `bundle exec metacrunch 11_working_with_marcxml.rb ../assets/marcxml/*.xml`
source Metacrunch::File::Source.new(ARGV)

# Use the `Metacrunch::Marcxml` package to parse the marcxml string into a
# proper object we can work with.
transformation ->(file) do
  @current_source = Metacrunch::Marcxml.parse(file.contents)
  {} # this will be the result object we pass along the transformations
end

# Extract "author"
transformation ->(result) do
  result[:first_author] = @current_source.datafields("100", ind1: "1").subfields("a").first_value
  result
end

# Extract "title"
transformation ->(result) do
  result[:title] = @current_source.datafields("245").subfields("a").first_value
  result
end

# Extract "original title"
transformation ->(result) do
  result[:original_title] = @current_source.datafields("240", ind1: "1").subfields("a").first_value
  result
end

# Extract "index terms"
transformation ->(result) do
  result[:index_terms] = @current_source.datafields("653", ind1: :blank).map do |datafield|
    datafield.subfields("a").first_value
  end
  result
end

# Print out the result
transformation ->(result) do
  puts "First Author: #{result[:first_author] || "-"}"
  puts "Title: #{result[:title] || "-"}"
  puts "Title (Original): #{result[:original_title] || "-"}"
  puts "Index Terms: #{result[:index_terms]}"
  puts ""
end
