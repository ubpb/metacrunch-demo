require_relative "./commands/hello_world_command"
require_relative "./commands/say_hello_command"
require_relative "./commands/print_files_command"
require_relative "./commands/line_count_command"
require_relative "./commands/mab2_demo_command"

Metacrunch::Cli.setup("demo", "A collection of demo commands") do |r|
  # The simplest command possible
  r.register(Metacrunch::Demo::HelloWorldCommand, "Prints 'Hello World'")

  # A simple command using params and options
  r.register(Metacrunch::Demo::SayHelloCommand) do |c|
    c.usage "say_hello NAME"
    c.desc "Says hello to a given name"
    c.option :upcase, desc: "Upcase", type: :boolean
  end

  # A more complex command that prints filenames
  r.register(Metacrunch::Demo::PrintFilesCommand) do |c|
    c.usage "print_files FILES..."
    c.desc "Print file contents using Metacrunch::FileReader"
  end

  # A complex command using parallel processing
  r.register(Metacrunch::Demo::LineCountCommand) do |c|
    c.usage "line_count FILES..."
    c.desc "Counts the number of lines of the given files"
    c.option :no_of_procs,
      aliases: "-n",
      desc: "Number of processes to run in parallel",
      default: 1,
      type: :numeric,
      required: true
  end

  # A more complex command that prints filenames
  r.register(Metacrunch::Demo::Mab2DemoCommand) do |c|
    c.usage "mab2_demo FILES..."
    c.desc "Demo processing for Aleph MAB XML files"
  end
end
