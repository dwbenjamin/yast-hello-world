require "rake/clean"
require "fileutils"

namespace :new_module do
    myDirectories = ["doc","package","src","test","src/clients","src/lib"]
    myFiles = ["CONTRIBUTING.md","COPYING","Dockerfile",".gitignore","SECURITY.md",".yardopts"]
    myEdits = [".travis.yml","Rakefile"]
    rubocopFile = "/usr/share/YaST2/data/devtools/data/rubocop-0.71.0_yast_style.yml"
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
            FileUtils.cp myFiles, nd
            myDirectories.each { |d| 
                FileUtils.mkdir "#{nd}/#{d}"
            }
            FileUtils.mkdir "#{nd}/src/lib/y2#{input}"
            File.open("#{nd}/README.md", "w") { |f|
                f.write "# YaST module #{input.capitalize}\r\n"
            }
            File.open("#{nd}/RPMNAME", "w") { |f|
                f.write "yast2-#{input}\r\n"
            }
            if File.exists?(rubocopFile)
                File.open("#{nd}/.rubocop.yml", "w") { |f|
                    f.write "inherit_from:\r\n"
                    f.write "  #{rubocopFile}\r\n"
                }
            else
                File.open("#{nd}/.rubocop.yml", "w") { |f|
                    f.write "inherit_from:\r\n"
                    f.write "  /usr/share/YaST/data/devtools/data/rubocop_yast_style.yml\r\n"
                }
            end
            File.open("#{nd}/src/clients/#{input}.rb", "w") { |f|
                f.write "require \"y2#{input}/main_module\"\r\n\r\n"
                f.write "Y2#{input.capitalize}::MainDialog.new.run\r\n"
            }

            text = File.read("src/lib/template")
            new_contents = text.gsub(/HelloWorld/, "#{input.capitalize}")
            File.open("#{nd}/src/lib/y2#{input}/main_module.rb", "w") { |f| f.puts new_contents}
            
            myEdits.each { |e|
                text = File.read(e)
                new_contents = text.gsub(/hello-world/, "#{input}")
                new_contents = new_contents.gsub(/dbenjamin/, "<obs name>")
                File.open("#{nd}/#{e}", "w") { |f| f.puts new_contents }
            }
        end
    end
    
    desc "Clean up and delete custom module files."
    task :cleanup do
        puts "What is the name of this module"
        input = STDIN.gets.chomp
        input = "yast-#{input}"
        unless myDirectories.include?(input)
            if File.directory?(input)
                puts "Cleaning up module #{input}."
                FileUtils.rmtree(input)
            else
                puts "No module #{input} to clean up."
            end
        else
            puts "Directory #{input} is protected."
        end
    end
end