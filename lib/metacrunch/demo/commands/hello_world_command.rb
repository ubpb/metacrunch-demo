module Metacrunch
  module Demo
    class HelloWorldCommand < Metacrunch::Command
      def perform
        shell.say "Hello World"
      end
    end
  end
end
