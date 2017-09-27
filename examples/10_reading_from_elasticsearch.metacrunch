# Require Gemfile depenedencies
Bundler.require

# Create an Elasticsearch client instance. Make sure you have a
# elasticsearch running at localhost:9200
elasticsearch = ::Elasticsearch::Client.new(log: true)

# Let's query elasticsearch with a `Metacrunch::Elasticsearch::Source`.
source Metacrunch::Elasticsearch::Source.new(
  # Set the elasticsearch client instance
  elasticsearch,

  # Within the search options you define your query as described here:
  # https://github.com/elastic/elasticsearch-ruby/blob/master/elasticsearch-api/lib/elasticsearch/api/actions/search.rb
  # Internally `Metacrunch::Elasticsearch::Source` uses `search` and `scroll` to efficiently iterate even over
  # large result sets.
  search_options: {
    index: "metacrunch-elasticsearch-demo",
    type: "users",
    body: {
      query: {
        wildcard: {
          name: "a*"
        }
      }
    }
  },

  # You can set this custom callback to get notified about the total number of hits
  # the source will operate on. This can be used to setup a progress bar.
  total_hits_callback: ->(total_hits) {
    puts "Total hits: #{total_hits}"
  }
)

# Just some debug output of the results.
transformation ->(hit) do
  user = hit["_source"]
  puts "Found user: #{user["name"]}"
end
