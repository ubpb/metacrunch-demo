module Metacrunch
  module Demo
    class LineCountCommand < Metacrunch::Command

      #
      # Do some setup
      #
      def pre_perform
        @no_of_procs = options[:no_of_procs] > 0 ? options[:no_of_procs] : 1
      end

      #
      # Count lines
      #
      def perform
        if params.empty?
          shell.say "No files found", :red
        else
          shell.say "Counting #{params.count} file(s) using #{@no_of_procs} prozesses...", :green
          lines = count_lines(params)
          shell.say "No of lines: #{lines}"
        end
      end

    private

      #
      # Count lines with a parallel MapReduce
      #
      def count_lines(files)
        counts = Parallel.map(files, in_processes: @no_of_procs) do |filename|
          file_reader = Metacrunch::FileReader.new(filename)
          c = 0
          file_reader.each do |result|
            c += result.contents.count("\n")
          end
          c
        end

        counts.inject{ |sum, x| sum + x }
      end

    end
  end
end
