module Metacrunch
  module Demo
    class PrintFilesCommand < Metacrunch::Command

      def perform
        if params.empty?
          shell.say "No files found", :red
        else
          shell.say "Printing #{params.count} file(s)...", :green
          print_files(params)
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
