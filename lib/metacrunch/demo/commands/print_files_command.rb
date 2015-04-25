module Metacrunch
  module Demo
    class PrintFilesCommand < Metacrunch::Command

      #
      # One can override setup to make some setup before
      # call is run.
      #
      def setup
        # Your setup here...
      end

      #
      # Print out files
      #
      def call(files:)
        if files.empty?
          shell.say "No files found", :red
        else
          shell.say "Printing #{files.count} file(s)...", :green
          print_files(files)
        end
      end

    private

      def print_files(files)
        file_reader = Metacrunch::Utils::FileReader.new
        file_reader.read_files(files) do |file_result|
          if file_result.from_archive?
            puts "#{file_result.filename} @ #{File.expand_path(file_result.source_filename)}"
          else
            puts File.expand_path(file_result.filename)
          end
        end
      end

    end
  end
end
