module Metacrunch
  module Demo
    class SayHelloCommand < Metacrunch::Command
      def perform
        name     = params.join
        greeting = "Hello #{name}\n"

        greeting.upcase! if options["upcase"]

        shell.say greeting
      end
    end
  end
end
