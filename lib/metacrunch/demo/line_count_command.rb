module Metacrunch
  module Demo
    class LineCountCommand < Metacrunch::Command

      #
      # Do some setup
      #
      def setup
        @no_of_procs = options[:no_of_procs] > 0 ? options[:no_of_procs] : 1
      end

      #
      # Count lines
      #
      def call(files:)
        if files.empty?
          shell.say "No files found", :red
        else
          shell.say "Counting #{files.count} file(s) using #{@no_of_procs} prozesses...", :green
          lines = count_lines(files)
          shell.say "No of lines: #{lines}"
        end
      end

    private

      #
      # Count lines with a parallel MapReduce
      #
      def count_lines(files)
        counts = Parallel.map(files, in_processes: @no_of_procs) do |filename|
          file_reader = Metacrunch::Utils::FileReader.new
          file_reader.read_file(filename) do |result|
            result.contents.count("\n")
          end
        end

        counts.inject{ |sum, x| sum + x }
      end

    end
  end
end
