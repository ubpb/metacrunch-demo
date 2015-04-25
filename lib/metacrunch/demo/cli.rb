require_relative "./commands/print_files_command"
require_relative "./commands/line_count_command"
require_relative "./commands/mab2_demo_command"

module Metacrunch
  module Demo
    class Cli < Metacrunch::Cli::Base
      namespace "demo"

      # The simplest command possible
      desc "hello_world", "Prints out \"Hello world\""
      def hello_world
        puts "Hello world"
      end

      # A simple command with an option
      desc "say_hello", "Says hello to a given name"
      option :name,
        aliases: "-n",
        desc: "Name",
        required: true
      def say_hello
        puts "Hello #{options[:name]}!"
      end

      # A more complex command using a Metacrunch command class
      desc "print_files FILES...", "Print file contents using Metacrunch::FileReader"
      def print_files(*files)
        run_command(PrintFilesCommand, files: files)
      end

      # A complex command using parallel processing
      desc "count_lines FILES...", "Counts the number of lines of the given files"
      option :no_of_procs,
        aliases: "-n",
        desc: "Number of processes to run in parallel",
        default: 1,
        type: :numeric,
        required: true
      def count_lines(*files)
        run_command(LineCountCommand, files: files)
      end

      # Demo MAB2 processing
      desc "mab2_demo FILES...", "Demo processing fpr Aleph MAB XML files"
      def mab2_demo(*files)
        run_command(Mab2DemoCommand, files: files)
      end
    end
  end
end

Metacrunch::Cli.register(Metacrunch::Demo::Cli, "demo", "demo [command]", "A collection of demo commands")
