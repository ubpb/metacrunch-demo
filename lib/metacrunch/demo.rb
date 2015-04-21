require "metacrunch"
require "metacrunch/mab2"

begin
  require "pry"
rescue LoadError ; end

module Metacrunch
  module Demo
    require_relative "./demo/version"
    require_relative "./demo/print_files_command"
    require_relative "./demo/line_count_command"
    require_relative "./demo/mab2_demo_command"
    require_relative "./demo/cli"
  end
end


