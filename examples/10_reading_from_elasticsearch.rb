# Require Gemfile depenedencies
Bundler.require

# Create an Elasticsearch client instance. Make sure you have a
# elasticsearch running at localhost:9200
elasticsearch = ::Elasticsearch::Client.new(log: true)

# Set user list as source
source Metacrunch::Elasticsearch::Source.new(elasticsearch, {
  index: "metacrunch-elasticsearch-demo",
  type: "users",
  body: {
    query: {
      wildcard: {
        name: "a*"
      }
    }
  }
})

transformation ->(hit) do
  user = hit["_source"]
  puts "Found user: #{user["name"]}"
end
