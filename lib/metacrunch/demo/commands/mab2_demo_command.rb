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
        file_reader = Metacrunch::FileReader.new(files)
        file_reader.each do |file_result|
          xml = file_result.contents

          mab = Metacrunch::Mab2::Document.from_aleph_mab_xml(xml)
          snr = Metacrunch::SNR.new

          transformer = Transformer.new(source: mab, target: snr, options: {})
          transformer.transform do
            names  = source.datafields("100", ind1: "-").subfields("p").values
            names += source.datafields("104", ind1: "a").subfields("p").values
            target.add("search", "authors", names)
          end

          puts snr.to_xml
        end
      end

    end
  end
end
