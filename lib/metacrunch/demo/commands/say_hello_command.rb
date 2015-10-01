module Metacrunch
  module Demo
    class SayHelloCommand < Metacrunch::Command
      def perform
        name = params.join
        if name.blank?
          shell.say "Please provide a name", :red
          exit
        else
          greeting = "Hello #{name}\n"
          greeting.upcase! if options["upcase"]
          shell.say greeting
        end
      end
    end
  end
end
