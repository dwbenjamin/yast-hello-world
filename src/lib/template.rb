# frozen_string_literal: true

# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

require "yast"

Yast.import "UI"
Yast.import "Label"

# Simple Hello World! fully functioning example
# @note This module can be changed using the YaST development tools
#   rake new_module:create
module Y2HelloWorld
  # Simple class for the MainDialog
  class MainDialog
    include Yast::UIShortcuts
    include Yast::I18n
    include Yast::Logger

    # Display the dialog
    def run
      # set the textdomain to something usefull
      #textdomain ""
      return unless create_dialog

      begin
        event_loop
      ensure
        Yast::UI.CloseDialog
      end
    end

    # Simple event loop
    def event_loop
      loop do
        input = Yast::UI.UserInput
        next unless (input == :button) || (input == :cancel)

        log.info "Received #{input}"
        # Break the loop
        break
      end
    end

    # Draws the dialog
    def create_dialog
      # Simple ycp-ui dialog box
      Yast::UI.OpenDialog(
        Opt(:decorated, :defaultsize),
        # ycp-ui VBox widget to hold more widgets
        VBox(
          # ycp-ui Heading widget
          Heading(_("New Module")),
          # ycp-ui PushButton widget
          PushButton(Id(:button), Yast::Label.QuitButton)
        )
      )
    end
  end
end
