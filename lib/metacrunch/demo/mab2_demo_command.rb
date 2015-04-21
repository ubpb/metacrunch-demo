module Metacrunch
  module Demo
    class Mab2DemoCommand < Metacrunch::Command

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
          shell.say "Processing #{files.count} file(s)...", :green
          process_files(files)
        end
      end

    private

      def process_files(files)
        file_reader = Metacrunch::Utils::FileReader.new
        file_reader.read_files(files) do |file_result|
          xml      = file_result.contents
          document = Metacrunch::Mab2::Document.from_aleph_mab_xml(xml)

          names = document.data_fields("100").filter(ind1: "-").map do |data_field|
            data_field.sub_fields("p").try(:first).try(:value)
          end

          # Alternative API with direct access to the values
          names = document.values(data_field: "100", ind1: "-", sub_field: "p")

          puts "Authors for #{file_result.filename}"
          puts "  #{names.join(' ; ')}"
        end
      end

    end
  end
end
