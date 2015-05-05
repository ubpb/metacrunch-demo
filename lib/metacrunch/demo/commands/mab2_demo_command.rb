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

          names  = mab.datafields("100", ind1: "-").subfields("p").values
          names += mab.datafields("104", ind1: "a").subfields("p").values

          puts "Authors for #{file_result.filename}"
          puts "  #{names.join('; ')}"
        end
      end

    end
  end
end
