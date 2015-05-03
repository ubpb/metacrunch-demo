module Metacrunch
  module Demo
    class Mab2DemoCommand < Metacrunch::Command

      def perform
        if params.empty?
          shell.say "No files found", :red
        else
          shell.say "Processing #{params.count} file(s)...", :green
          process_files(params)
        end
      end

    private

      def process_files(files)
        file_reader = Metacrunch::Utils::FileReader.new
        file_reader.read_files(files) do |file_result|
          xml = file_result.contents
          mab = Metacrunch::Mab2::Document.from_aleph_mab_xml(xml)

          names  = mab.values(data_field: "100", ind1: "-", sub_field: "p")
          names += mab.values(data_field: "104", ind1: "a", sub_field: "p")

          puts "Authors for #{file_result.filename}"
          puts "  #{names.join('; ')}"
        end
      end

    end
  end
end
