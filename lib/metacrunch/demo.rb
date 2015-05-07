require "metacrunch"
require "metacrunch/mab2"

begin
  require "pry"
rescue LoadError ; end

module Metacrunch
  module Demo
    require_relative "./demo/version"
    require_relative "./demo/cli"
  end
end


