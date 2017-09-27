# Require Gemfile depenedencies
Bundler.require

# Create an Elasticsearch client instance. Make sure you have a
# elasticsearch running at localhost:9200
elasticsearch = ::Elasticsearch::Client.new(log: true)

# Set user list as source
source Metacrunch::Elasticsearch::Source.new(
  elasticsearch,

  search_options: {
    index: "metacrunch-elasticsearch-demo",
    type: "users",
    size: 2,
    body: {
      query: {
        wildcard: {
          name: "a*"
        }
      }
    }
  },

  total_hits_callback: ->(total_hits) {
    puts "Total hits: #{total_hits}"
  }
)

transformation ->(hit) do
  user = hit["_source"]
  puts "Found user: #{user["name"]}"
end
