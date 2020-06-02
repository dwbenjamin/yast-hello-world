# frozen_string_literal: true

# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

require "rake/clean"
require "fileutils"

namespace :new_module do
  my_directories = ["doc", "package", "src", "test", "src/clients", "src/lib"]
  my_files = ["CONTRIBUTING.md", "COPYING", "Dockerfile", ".gitignore", "SECURITY.md",
              ".rubocop.yml", ".yardopts"]
  my_edits = [".travis.yml", "Rakefile"]
  desc "Create a custom module based on the Hello World module."
  task :create do
    puts "What is the name of this module"
    input = STDIN.gets.chomp
    nd = "yast-#{input}"
    if File.directory?(nd)
      puts "Directory already exists.  Stopping new module."
    else
      puts "Creating new module #{nd}."
      Dir.mkdir nd
      FileUtils.cp my_files, nd
      my_directories.each do |d|
        FileUtils.mkdir "#{nd}/#{d}"
      end
      FileUtils.mkdir "#{nd}/src/lib/y2#{input}"
      File.open("#{nd}/README.md", "w") do |f|
        f.write "# YaST module #{input.capitalize}\r\n"
      end
      File.open("#{nd}/RPMNAME", "w") do |f|
        f.write "yast2-#{input}\r\n"
      end
      File.open("#{nd}/src/clients/#{input}.rb", "w") do |f|
        f.write "require \"y2#{input}/main_module\"\r\n\r\n"
        f.write "Y2#{input.capitalize}::MainDialog.new.run\r\n"
      end

      text = File.read("src/lib/template")
      new_contents = text.gsub(/HelloWorld/, input.capitalize)
      File.open("#{nd}/src/lib/y2#{input}/main_module.rb", "w") { |f| f.puts new_contents }

      my_edits.each do |e|
        text = File.read(e)
        new_contents = text.gsub(/hello-world/, input)
        new_contents = new_contents.gsub(/dbenjamin/, "<obs name>")
        File.open("#{nd}/#{e}", "w") { |f| f.puts new_contents }
      end
    end
  end

  desc "Clean up and delete custom module files."
  task :cleanup do
    puts "What is the name of this module"
    input = STDIN.gets.chomp
    input = "yast-#{input}"
    if my_directories.include?(input)
      puts "Directory #{input} is protected."
    elsif File.directory?(input)
      puts "Cleaning up module #{input}."
      FileUtils.rmtree(input)
    else
      puts "No module #{input} to clean up."
    end
  end
end
