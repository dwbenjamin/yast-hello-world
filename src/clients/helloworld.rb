# frozen_string_literal: true

# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

require "y2helloworld/main_module"

unless ARGV.any?("help")
    Y2HelloWorld::MainDialog.new.run
else
    # translators: command line help text for Hello World client module
    puts "This YaST2 module does not support the command line interface."
end

