module Metacrunch
  module Demo
    class Cli < Thor
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
        PrintFilesCommand.new(shell: shell, options: options).call(files: files)
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
        LineCountCommand.new(shell: shell, options: options).call(files: files)
      end

      # Demo MAB2 processing
      desc "mab2_demo FILES...", "Demo processing fpr Aleph MAB XML files"
      def mab2_demo(*files)
        Mab2DemoCommand.new(shell: shell, options: options).call(files: files)
      end

      # Demo MAB2 processing
      desc "mab2_demo2 FILES...", "Demo processing fpr Aleph MAB XML files"
      def mab2_demo2(*files)
        Mab2DemoCommand2.new(shell: shell, options: options).call(files: files)
      end
    end
  end
end

Metacrunch::Cli.register(Metacrunch::Demo::Cli, "demo", "demo <command>", "A collection of demo commands")
